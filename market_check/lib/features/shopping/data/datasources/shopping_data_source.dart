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
      if (purchaseItems.isNotEmpty) {
        final response = await ServerService.serverGet(
            '${ServerUrls.purchaseUrl}${ServerUrls.createPurchaseUrl}${purchaseItems[0].product.storeId}');

        if (response.statusCode != 200 && response.statusCode != 201) {
        throw HttpException(
            message: '${response.statusCode}, ${response.reasonPhrase}');
      }
      String? fixedResponse;
      if (!response.body.endsWith('}')) {
        fixedResponse = '${response.body}}';
      }

        final int pin = jsonDecode(fixedResponse?? response.body)["pin"];
        final int purchaseId = jsonDecode(fixedResponse?? response.body)["id"];

        await Future.forEach(purchaseItems, (item) async {
          await addProductToPurchase(item, purchaseId);
        });

        AuthService.user!.isPurchaseOpen = true;
        AuthService.user!.purchasePin = pin;

        return true;
      }
      return false;
    } on HttpException catch (e) {
      debugPrint('ShoppingDataSource, createNewPurchase HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.purchases);
    } catch (e) {
      debugPrint('ShoppingDataSource, createNewPurchase Exception: $e');
      throw RemoteException(
          message: 'Ha ocurrido un error al intentar crear la compra',
          type: ExceptionType.purchases);
    }
  }

  @override
  Future<void> addProductToPurchase(
      ShoppingCartItemModel purchaseItem, int purchaseId) async {
    try {
      await ServerService.serverPost(
          '${ServerUrls.purchaseUrl}$purchaseId/producto/${purchaseItem.product.id}',
          {'itemsCount': purchaseItem.quanty});
    } on HttpException catch (e) {
      debugPrint('ShoppingDataSource, addProductToPurchase HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.purchases);
    } catch (e) {
      debugPrint('ShoppingDataSource, addProductToPurchase Exception: $e');
      throw RemoteException(
          message: 'Ha ocurrido un error al agregar productos a la compra.',
          type: ExceptionType.purchases);
    }
  }
}
