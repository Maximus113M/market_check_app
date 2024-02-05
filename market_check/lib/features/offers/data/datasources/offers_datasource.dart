import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/features/offers/data/models/offer_model.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';

abstract class OffersDataSource {
  Future<List<OfferModel>> getOffers();
}

class OffersDatasourceImpl extends OffersDataSource {
  final dioOffers = Dio(
    BaseOptions(
      baseUrl: "${RemoteUrls.baseUrlMovilSena}${RemoteUrls.offersUrl}",
    ),
  );

  final dioImages = Dio(
    BaseOptions(
      baseUrl: "${RemoteUrls.baseUrlMovilSena}${RemoteUrls.imagesUrl}",
    ),
  );

  @override
  Future<List<OfferModel>> getOffers() async {
    try {
      final response = await dioOffers.get('mobile-app/');
      List<OfferModel> offers = [];
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("$response");

        final List<Future<OfferModel>> futures =
            (response.data["offers"] as List).map((offerJson) async {
          final Response dioImage =
              await dioImages.get('${offerJson["imagen"]}');

          return OfferModel.fromJson(
              offerJson, "${RemoteUrls.baseUrlMovilSena}${dioImage.data["image_url"]}");
        }).toList();
        offers = await Future.wait(futures);
      }
      return offers;
    } catch (e) {
      throw RemoteException(
          message: "Ha ocurrido un error al consultar los establecimientos",
          type: ExceptionType.storesException);
    }
  }
}
