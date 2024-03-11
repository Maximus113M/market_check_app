import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/features/profile_cards/data/models/purchase_model.dart';
import 'package:market_check/features/profile_cards/data/models/registered_purchase_item.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';

abstract class ProfileCardsDataSource {
  Future<List<PurchaseModel>> getShoppingHistory();
  Future<List<RegisteredPurchaseItemModel>> getShoppingProducts(int purchaseId);
  Future<List<StoreModel>> getStoresVisited();

}

class ShoppingHistoryDataSourceImpl extends ProfileCardsDataSource {
  @override
  Future<List<PurchaseModel>> getShoppingHistory() async {
    try {
      List<PurchaseModel> purhaseList = [];
      const String path =
          '${ServerUrls.purchaseUrl}${ServerUrls.closeShoppingHistoryUrl}';

      final response = await ServerService.serverGet(path);

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw HttpException(
            message: '${response.statusCode}, ${response.reasonPhrase}');
      }
      String? fixedResponse;
      if (!response.body.endsWith('}')) {
        fixedResponse = '${response.body}}';
      }

      purhaseList = (jsonDecode(fixedResponse?? response.body)['closePurchases'] as List)
          .map((purchaseJson) => PurchaseModel.fromJson(purchaseJson))
          .toList();

      return purhaseList;
    } on HttpException catch (e) {
      debugPrint(
          'ShoppingHistoryDatasource, getShoppingHistory HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signIn);
    } catch (e) {
      debugPrint('ShoppingHistoryDatasource, getShoppingHistory Exception: $e');
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

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw HttpException(
            message: '${response.statusCode}, ${response.reasonPhrase}');
      }
      String? fixedResponse;
      if (!response.body.endsWith('}')) {
        fixedResponse = '${response.body}}';
      }

      registeredItems = (jsonDecode(fixedResponse?? response.body)['items'] as List)
          .map((jsonItem) => RegisteredPurchaseItemModel.fromJson(jsonItem))
          .toList();

      return registeredItems;
    } on HttpException catch (e) {
      debugPrint(
          'ShoppingHistoryDatasource, getShoppingProducts HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signIn);
    } catch (e) {
      debugPrint(
          'ShoppingHistoryDatasource, getShoppingProducts Exception: $e');
      throw RemoteException(
          message:
              'Ha ocurrido un error al obtener los productos de la compra.',
          type: ExceptionType.purchases);
    }
  }

  @override
  Future<List<StoreModel>> getStoresVisited() async {
    try {
      final String path =
          '${ServerUrls.userUrl}userStores/${AuthService.user!.id}';

      final response = await ServerService.serverGet(path);

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw HttpException(
            message: '${response.statusCode}, ${response.reasonPhrase}');
      }
      List<StoreModel> stores = [];

      String? fixedResponse;
      if (!response.body.endsWith('}')) {
        fixedResponse = '${response.body}}';
      }

      stores = (jsonDecode(fixedResponse ?? response.body)["establecimientos"]
              as List)
          .map((storeJson) {
        return StoreModel.fromJson(storeJson);
      }).toList();

      return stores;
    } on HttpException catch (e) {
      debugPrint('ProfileDataSource, getStoresVisited HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.profile);
    } catch (e) {
      debugPrint('ProfileDataSource, getStoresVisited Exception: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al eliminar la cuenta, por favor intentalo despues.",
          type: ExceptionType.profile);
    }
  }
}
