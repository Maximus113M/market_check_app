import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/stores/data/models/offer_model.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';

import 'package:dartz/dartz.dart';

abstract class StoresRepository {
  Future<Either<RemoteFailure, List<StoreModel>>> getStores();
  Future<Either<RemoteFailure, List<OfferModel>>> getOffers(int storeId);
}
