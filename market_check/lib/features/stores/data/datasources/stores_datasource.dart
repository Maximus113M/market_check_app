import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';

import 'package:dio/dio.dart';

abstract class StoresDataSource {
  Future<List<StoreModel>> getStores();
}

class StoresDataSourceImpl extends StoresDataSource {
  final dioStores = Dio(
    BaseOptions(
      baseUrl: "${RemoteUrls.baseUrlMovilSena}${RemoteUrls.storesUrl}",
    ),
  );

  final dioImages = Dio(
    BaseOptions(
      baseUrl: "${RemoteUrls.baseUrlMovilSena}${RemoteUrls.imagesUrl}",
    ),
  );
  @override
  Future<List<StoreModel>> getStores() async {
    try {
      final response = await dioStores.get('');
      List<StoreModel> stores = [];
      if (response.statusCode == 200) {
        stores =
            (response.data["stores"] as List).map((storeJson) {
          return StoreModel.fromJson(storeJson);
        }).toList();
      }
      return stores;
    } catch (e) {
      print("STORES $e");
      throw RemoteException(
          message: "Ha ocurrido un error al consultar los establecimientos",
          type: ExceptionType.storesException);
    }
  }
}
