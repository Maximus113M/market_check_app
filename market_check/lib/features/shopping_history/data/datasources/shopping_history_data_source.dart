import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/shared/models/user.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';
import 'package:market_check/features/shopping_history/data/models/registered_purchase_item.dart';

abstract class ShoppingHistoryDataSource {
  Future<List<PurchaseModel>> getShoppingHistory();
  Future<List<RegisteredPurchaseItemModel>> getShoppingProducts(int purchaseId);
}

class ShoppingHistoryDataSourceImpl extends ShoppingHistoryDataSource {
  @override
  Future<List<PurchaseModel>> getShoppingHistory() async {
    try {
      final User? user = AuthService.user;
      List<PurchaseModel> purhaseList = [];
      if (user == null) return purhaseList;
      const String path =
          '${ServerUrls.purchaseUrl}${ServerUrls.closeShoppingHistoryUrl}';
      final response = await ServerService.serverGet(path);

      if (response.statusCode == 200) {
        purhaseList = (jsonDecode(response.body)['closePurchases'] as List)
            .map((purchaseJson) => PurchaseModel.fromJson(purchaseJson))
            .toList();
      }
      return purhaseList;
    } on HttpException catch (e) {
      debugPrint('ShoppingHistory httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signIn);
    } catch (e) {
      debugPrint('ShoppingHistory httpException: $e');

      throw RemoteException(
          message: 'No se pudo obtener la lista',
          type: ExceptionType.shoppingHistory);
    }
  }

  @override
  Future<List<RegisteredPurchaseItemModel>> getShoppingProducts(
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
      debugPrint('ShoppingHistory httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signIn);
    } catch (e) {
      debugPrint('ShoppingHistory Exception: $e');
      throw RemoteException(
          message:
              'Ha ocurrido un error al obtener los productos de la compra.',
          type: ExceptionType.purchases);
    }
  }
}
