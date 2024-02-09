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
<<<<<<< HEAD
        stores =
            (response.data["stores"] as List).map((storeJson) {
          return StoreModel.fromJson(storeJson);
=======
        final List<Future<StoreModel>> futuresStores =
            (response.data["stores"] as List).map((storeJson) async {
          /*final Response dioImage =
              await dioImages.get('${storeJson["Imagen"]}');
          final Response dioLogo = await dioImages.get('${storeJson["Logo"]}');*/

          return StoreModel.fromJson(
              storeJson
              /*"${RemoteUrls.baseUrlMovilSena}${dioImage.data["image_url"]}",
              "${RemoteUrls.baseUrlMovilSena}${dioLogo.data["image_url"]}"*/);
>>>>>>> 2f2914403582567560834e55338fdf2a22057b36
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
