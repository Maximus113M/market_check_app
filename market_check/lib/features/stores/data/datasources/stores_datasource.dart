import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';

abstract class StoresDataSource {
  Future<List<StoreModel>> getStores();
}

class StoresDataSourceImpl extends StoresDataSource {
  /*final dioStores = Dio(
    BaseOptions(
      baseUrl: "${RemoteUrls.currentUrl}${RemoteUrls.storesUrl}",
    ),
  );*/

  @override
  Future<List<StoreModel>> getStores() async {
    try {
      List<StoreModel> stores = [];
      final response = await ServerService.serverGet(ServerUrls.storesUrl);

      if (response.statusCode == 200) {
        stores = (jsonDecode(response.body)["stores"] as List).map((storeJson) {
          return StoreModel.fromJson(storeJson);
        }).toList();
        return stores.where((store) => store.state != 0).toList();
      }
      return stores;
    } on HttpException catch (e) {
      debugPrint('Stores httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signInException);
    } catch (e) {
      debugPrint("Stores Exception: $e");
      throw RemoteException(
          message: "Ha ocurrido un error al consultar los establecimientos",
          type: ExceptionType.storesException);
    }
  }
}
