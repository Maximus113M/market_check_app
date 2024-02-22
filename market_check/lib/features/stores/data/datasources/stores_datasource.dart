import 'dart:convert';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class StoresDataSource {
  Future<List<StoreModel>> getStores();
}

class StoresDataSourceImpl extends StoresDataSource {
  final dioStores = Dio(
    BaseOptions(
      baseUrl: "${RemoteUrls.currentUrl}${RemoteUrls.storesUrl}",
    ),
  );

  @override
  Future<List<StoreModel>> getStores() async {
    try {
      List<StoreModel> stores = [];
      if (AuthService.user != null) {
        //final response = await dioStores.get('');
        var url = Uri.http(RemoteUrls.currentHttp,
            '/api/${RemoteUrls.storesUrl}');
        var response = await http.get(
          url,
          headers: AuthService.headers,
        );
      print(response);
        if (response.statusCode == 200) {
          stores = (jsonDecode(response.body)['stores'] as List).map((storeJson) {
            return StoreModel.fromJson(storeJson);
          }).toList();
          return stores.where((store) => store.state != 0).toList();
        }
      }
      return stores;
    } catch (e) {
      print("Stores Exception: $e");
      throw RemoteException(
          message: "Ha ocurrido un error al consultar los establecimientos",
          type: ExceptionType.storesException);
    }
  }
}
