import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';

import 'package:dio/dio.dart';

abstract class StoresDataSource {
  Future<List<StoreModel>> getStores();
}

class StoresDataSourceImpl extends StoresDataSource {
  final dioStores = Dio(
    BaseOptions(
      baseUrl: "${ServerUrls.currentUrl}${ServerUrls.storesUrl}",
    ),
  );

  @override
  Future<List<StoreModel>> getStores() async {
    try {
      List<StoreModel> stores = [];

      final response = await dioStores.get('');
      if (response.statusCode == 200) {
        stores = (response.data["stores"] as List).map((storeJson) {
          return StoreModel.fromJson(storeJson);
        }).toList();
        return stores.where((store) => store.state != 0).toList();
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
