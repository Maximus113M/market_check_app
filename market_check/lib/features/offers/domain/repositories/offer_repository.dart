import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/offers/data/models/offer_model.dart';

import 'package:dartz/dartz.dart';

abstract class OffersRepository {
  Future<Either<RemoteFailure, List<OfferModel>>> getOffers(int storeId);
}
