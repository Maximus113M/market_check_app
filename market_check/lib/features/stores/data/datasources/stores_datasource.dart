//import 'package:market_check/json_from_db/json_data.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/remote_service/remote_service.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';

import 'package:dio/dio.dart';

abstract class StoresDataSource {
  Future<List<StoreModel>> getStores();
}

class StoresDataSourceImpl extends StoresDataSource {
  final dioStores = Dio(
    BaseOptions(
      baseUrl: RemoteService.emulatorStoresUrl,
    ),
  );
  final dioImages = Dio(
    BaseOptions(
      baseUrl: RemoteService.emulatorImagesUrl,
    ),
  );
  @override
  Future<List<StoreModel>> getStores() async {
    try {
      final response = await dioStores.get('');
      List<StoreModel> offers = [];
      if (response.statusCode == 200) {
        final List<Future<StoreModel>> futuresStores =
            (response.data["stores"] as List).map((storeJson) async {
          final Response dioImage =
              await dioImages.get('${storeJson["Imagen"]}');
          final Response dioLogo = await dioImages.get('${storeJson["Logo"]}');

          return StoreModel.fromJson(
              storeJson,
              "http://10.0.2.2:8000${dioImage.data["image_url"]}",
              "http://10.0.2.2:8000${dioLogo.data["image_url"]}");
        }).toList();
        offers = await Future.wait(futuresStores);
      }
      return offers;
    } catch (e) {
      print(e);
      throw RemoteException(
          message: "Ha ocurrido un error al consultar los establecimientos",
          type: ExceptionType.storesException);
    }
  }
}
