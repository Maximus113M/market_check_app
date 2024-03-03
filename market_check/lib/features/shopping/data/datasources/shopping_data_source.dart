import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/features/shopping/data/models/shopping_cart_item_model.dart';

abstract class ShoppingDataSource {
  Future<bool> createNewPurchase(List<ShoppingCartItemModel> purchaseItems);

  Future<void> addProductToPurchase(
      ShoppingCartItemModel purchaseItem, int purchaseId);
}

class PurchasesDataSourceImpl extends ShoppingDataSource {
  @override
  Future<bool> createNewPurchase(
      List<ShoppingCartItemModel> purchaseItems) async {
    try {
      if (AuthService.user == null) return false;
      if (purchaseItems.isNotEmpty) {
        final response = await ServerService.serverGet(
            '${ServerUrls.purchaseUrl}${ServerUrls.createPurchaseUrl}${purchaseItems[0].product.storeId}');

        if (response.statusCode == 201) {
          final int pin = jsonDecode(response.body)["pin"];
          final int purchaseId = jsonDecode(response.body)["id"];

          await Future.forEach(purchaseItems, (item) async {
            await addProductToPurchase(item, purchaseId);
          });
          AuthService.user!.isPurchaseOpen = true;
          AuthService.user!.purchasePin = pin;

          return true;
        }
      }
      return false;
    } on HttpException catch (e) {
      debugPrint('ShoppingDataSource httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.purchases);
    } catch (e) {
      debugPrint('ShoppingDataSource Exception: $e');
      throw RemoteException(
          message: 'Ha ocurrido un error al intentar crear la compra',
          type: ExceptionType.purchases);
    }
  }

  @override
  Future<bool> addProductToPurchase(
      ShoppingCartItemModel purchaseItem, int purchaseId) async {
    try {
      final response = await ServerService.serverPost(
          '${ServerUrls.purchaseUrl}$purchaseId/producto/${purchaseItem.product.id}',
          {'itemsCount': purchaseItem.quanty});

      print(response.body);
      return true;
    } on HttpException catch (e) {
      debugPrint('ShoppingDataSource httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.purchases);
    } catch (e) {
      debugPrint('ShoppingDataSource Exception: $e');
      throw RemoteException(
          message: 'Ha ocurrido un error al agregar productos a la compra.',
          type: ExceptionType.purchases);
    }
  }
}
