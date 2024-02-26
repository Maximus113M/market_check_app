import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/features/offers/data/models/offer_model.dart';
import 'package:market_check/config/services/server/server_urls.dart';

abstract class OffersDataSource {
  Future<List<OfferModel>> getOffers(int storeId);
}

class OffersDatasourceImpl extends OffersDataSource {
  OffersDatasourceImpl();

  @override
  Future<List<OfferModel>> getOffers(int storeId) async {
    try {
      List<OfferModel> offers = [];

      if (AuthService.user != null) {
        var response = await ServerService.serverGet(
          ServerUrls.offersUrl,
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          offers = (jsonDecode(response.body)['offers'] as List).map(
            (offerJson) {
              return OfferModel.fromJson(offerJson);
            },
          ).toList();
        }
      }

      debugPrint("$offers");
      return offers;
    } on HttpException catch (e) {
      debugPrint('Offers httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.offersException);
    } catch (e) {
      debugPrint('Offers Exception: $e');
      throw RemoteException(
          message: "Ha ocurrido un error al consultar los establecimientos",
          type: ExceptionType.offersException);
    }
  }
}
