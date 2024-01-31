//import 'package:market_check/json_from_db/json_data.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';

import 'package:dio/dio.dart';

abstract class StoresDataSource {
  Future<List<StoreModel>> getStores();
}

class StoresDataSourceImpl extends StoresDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:8000/api/establecimiento/',
    ),
  );

  @override
  Future<List<StoreModel>> getStores() async {
    try {
      final Response response = await dio.get('');
      List<StoreModel> stores = [];
      if (response.statusCode == 200 || response.statusCode == 201) {
        stores = response.data["stores"]
            .map((storeJson) => StoreModel.fromJson(storeJson))
            .toList();
      }

      //final storeFromJson = storesJson;

      return stores;
    } catch (e) {
      throw RemoteException(
          message: "Ha ocurrido un error al consultar los establecimientos",
          type: ExceptionType.storesException);
    }
  }
}
