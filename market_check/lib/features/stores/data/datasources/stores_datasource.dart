import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/features/stores/data/models/offer_model.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';

abstract class StoresDataSource {
  Future<List<StoreModel>> getStores();
  Future<List<OfferModel>> getOffersByStore(int storeId);
}

class StoresDataSourceImpl extends StoresDataSource {
  @override
  Future<List<StoreModel>> getStores() async {
    try {
      List<StoreModel> stores = [];

      final response = await ServerService.serverGet(ServerUrls.storesUrl);

      if (response.statusCode >= 300) {
        throw HttpException(
            message: '${response.statusCode}, ${response.reasonPhrase}');
      }

      stores = (jsonDecode(response.body)["stores"] as List).map((storeJson) {
        return StoreModel.fromJson(storeJson);
      }).toList();

      return stores.where((store) => store.state != 0).toList();
    } on HttpException catch (e) {
      debugPrint('StoresDataSource, getStores HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signIn);
    } catch (e) {
      debugPrint("StoresDataSource, getStores Exception: $e");
      throw RemoteException(
          message: "Ha ocurrido un error al consultar los establecimientos",
          type: ExceptionType.stores);
    }
  }

  @override
  Future<List<OfferModel>> getOffersByStore(int storeId) async {
    try {
      List<OfferModel> offers = [];

      final response = await ServerService.serverGet(
        ServerUrls.offersUrl,
      );

      if (response.statusCode >= 300) {
        throw HttpException(
            message: '${response.statusCode}, ${response.reasonPhrase}');
      }

      offers = (jsonDecode(response.body)['offers'] as List).map(
        (offerJson) {
          return OfferModel.fromJson(offerJson);
        },
      ).toList();

      debugPrint("$offers");
      return offers;
    } on HttpException catch (e) {
      debugPrint('StoresDatasource, getOffers HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.offers);
    } catch (e) {
      debugPrint('StoresDatasource, getOffers Exception: $e');
      throw RemoteException(
          message: "Ha ocurrido un error al consultar los establecimientos",
          type: ExceptionType.offers);
    }
  }
}
