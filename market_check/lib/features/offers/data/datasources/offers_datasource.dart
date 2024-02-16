import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/features/offers/data/models/offer_model.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';

abstract class OffersDataSource {
  Future<List<OfferModel>> getOffers();
}

class OffersDatasourceImpl extends OffersDataSource {
  OffersDatasourceImpl();

  final dioOffers = Dio(
    BaseOptions(
      baseUrl: "${RemoteUrls.baseUrlMovilSena}${RemoteUrls.offersUrl}",
    ),
  );

  /* final dioImages = Dio(
    BaseOptions(
      baseUrl: "${RemoteUrls.baseUrlMovilSena}${RemoteUrls.imagesUrl}",
    ),
  );*/

  @override
  Future<List<OfferModel>> getOffers() async {
    try {
      final response = await dioOffers.get('mobile-app/');
      List<OfferModel> offers = [];
      if (response.statusCode == 200 || response.statusCode == 201) {
        offers = (response.data["offers"] as List).map((offerJson) {
          return OfferModel.fromJson(offerJson);
        }).toList();
      }

      debugPrint("$offers");
      return offers;
    } catch (e) {
      print(e);
      throw RemoteException(
          message: "Ha ocurrido un error al consultar los establecimientos",
          type: ExceptionType.storesException);
    }
  }
}
