import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/profile_cards/data/models/purchase_model.dart';
import 'package:market_check/features/profile_cards/data/models/registered_purchase_item.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';

abstract class ProfileCardsDataSource {
  Future<List<PurchaseModel>> getShoppingHistory();
  Future<List<RegisteredPurchaseItemModel>> getShoppingProducts(int purchaseId);
  Future<List<StoreModel>> getStoresVisited();
  Future<List<ProductModel>> getFavoriteProducts(int userId);
}

class ProfileCardsDataSourceImpl extends ProfileCardsDataSource {
  final String dataSourceName = 'ProfileCardsDataSourceImpl';

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

      purhaseList =
          (jsonDecode(fixedResponse ?? response.body)['closePurchases'] as List)
              .map((purchaseJson) => PurchaseModel.fromJson(purchaseJson))
              .toList();

      return purhaseList;
    } on HttpException catch (e) {
      debugPrint('$dataSourceName, getShoppingHistory HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signIn);
    } catch (e) {
      debugPrint('$dataSourceName, getShoppingHistory Exception: $e');
      throw RemoteException(
          message: 'No se pudo obtener la lista',
          type: ExceptionType.profileCards);
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

      registeredItems =
          (jsonDecode(fixedResponse ?? response.body)['items'] as List)
              .map((jsonItem) => RegisteredPurchaseItemModel.fromJson(jsonItem))
              .toList();

      return registeredItems;
    } on HttpException catch (e) {
      debugPrint('$dataSourceName, getShoppingProducts HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signIn);
    } catch (e) {
      debugPrint('$dataSourceName, getShoppingProducts Exception: $e');
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
      debugPrint('$dataSourceName, getStoresVisited HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.profile);
    } catch (e) {
      debugPrint('$dataSourceName, getStoresVisited Exception: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al eliminar la cuenta, por favor intentalo despues.",
          type: ExceptionType.profile);
    }
  }

  @override
  Future<List<ProductModel>> getFavoriteProducts(int userId) async {
    try {
      List<ProductModel> products = [];
      if (AuthService.user != null) {
        final response = await ServerService.serverGet(
            '${ServerUrls.userUrl}${ServerUrls.userProductsUrl}$userId');

        if (response.statusCode != 200 && response.statusCode != 201) {
          throw HttpException(
              message: '${response.statusCode}, ${response.reasonPhrase}');
        }

        String? fixedResponse;
        if (!response.body.endsWith('}')) {
          fixedResponse = '${response.body}}';
        }

        products = (jsonDecode(fixedResponse ?? response.body)[
                "productos_mas_comprados"] as List)
            .map((productJson) => ProductModel.fromJson(productJson))
            .toList();
      }

      return products;
    } on HttpException catch (e) {
      debugPrint('$dataSourceName, getFavoriteProducts httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.profile);
    } catch (e) {
      debugPrint('$dataSourceName, getFavoriteProducts Exception: $e');
      throw RemoteException(
          message: 'Ha ocurrido un error al consultar los productos.',
          type: ExceptionType.profile);
    }
  }
}
