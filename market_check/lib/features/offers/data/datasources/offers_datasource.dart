import 'package:dio/dio.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/remote_service/remote_service.dart';
import 'package:market_check/features/offers/data/models/offer_model.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/json_from_db/json_data.dart';

abstract class OffersDataSource {
  Future<List<OfferModel>> getOffers();
}

class OffersDatasourceImpl extends OffersDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: RemoteServices.offersUrl,
    ),
  );

  @override
  Future<List<OfferModel>> getOffers() async {
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
