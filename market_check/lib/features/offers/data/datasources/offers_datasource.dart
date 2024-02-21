import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/features/offers/data/models/offer_model.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

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
      //final response = await dioOffers.get('mobile-app/');
      List<OfferModel> offers = [];
       var url = Uri.http(RemoteUrls.currentHttp,
            '/api/${RemoteUrls.offersUrl}');

        var response = await http.get(
          url,
          headers: AuthService.headers,
        );
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        offers = (jsonDecode(response.body)["offers"] as List).map((offerJson) {
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
