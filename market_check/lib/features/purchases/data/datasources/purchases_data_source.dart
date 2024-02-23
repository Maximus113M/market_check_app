import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/config/shared/models/user.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/features/purchases/data/models/purchase_item_model.dart';

import 'package:dio/dio.dart';
import 'package:market_check/features/purchases/data/models/registered_purchase_item.dart';

abstract class PurchasesDataSource {
  Future<bool> createNewPurchase(List<PurchaseItemModel> purchaseItems);

  Future<void> addProductToPurchase(
      PurchaseItemModel purchaseItem, int purchaseId);

  Future<List<RegisteredPurchaseItemModel>> getPurchaseProducts(int purchaseId);
}

class PurchasesDataSourceImpl extends PurchasesDataSource {
  final Dio dioPurchaseBaseUrl = Dio(
    BaseOptions(
        baseUrl: "${ServerUrls.currentUrl}${ServerUrls.purchaseUrl}",
        headers: AuthService.headers),
  );

  @override
  Future<bool> createNewPurchase(List<PurchaseItemModel> purchaseItems) async {
    try {
      final User? user = AuthService.user;
      if (user == null) return false;
      if (purchaseItems.isNotEmpty) {
        final Response response = await dioPurchaseBaseUrl.post('new-purchase/',
            data: {'establecimiento_id': purchaseItems[0].product.storeId});
        if (response.statusCode == 201) {
          final int pin = response.data["pin"];
          final int purchaseId = response.data["id"];

          for (var item in purchaseItems) {
            await addProductToPurchase(item, purchaseId);
          }
          user.isPurchaseOpen = true;
          user.purchasePin = pin;

          return true;
        }
      }
      return false;
    } catch (e) {
      throw RemoteException(
          message: 'Ha ocurrido un error al intentar crear la compra',
          type: ExceptionType.purchasesException);
    }
  }

  @override
  Future<void> addProductToPurchase(
      PurchaseItemModel purchaseItem, int purchaseId) async {
    try {
      final Response response = await dioPurchaseBaseUrl.get(
          '$purchaseId/producto/${purchaseItem.product.id}',
          data: {'itemsCount': purchaseItem.quanty});
      print(response.data);
    } catch (e) {
      throw RemoteException(
          message: 'Ha ocurrido un error al agregar productos a la compra.',
          type: ExceptionType.purchasesException);
    }
  }

  @override
  Future<List<RegisteredPurchaseItemModel>> getPurchaseProducts(
      int purchaseId) async {
    try {
      List<RegisteredPurchaseItemModel> registeredItems = [];
      final response =
          await ServerService.serverGet('${ServerUrls.purchaseUrl}$purchaseId');
      if (response.statusCode == 200) {
        registeredItems = (jsonDecode(response.body)['items'] as List)
            .map((jsonItem) => RegisteredPurchaseItemModel.fromJson(jsonItem))
            .toList();
      }

      return registeredItems;
    } on HttpException catch (e) {
      debugPrint('Purchases httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signInException);
    } catch (e) {
      debugPrint('Purchases Exception: $e');
      throw RemoteException(
          message:
              'Ha ocurrido un error al obtener los productos de la compra.',
          type: ExceptionType.purchasesException);
    }
  }
}
