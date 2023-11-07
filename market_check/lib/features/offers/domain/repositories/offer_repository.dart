import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/offers/domain/entities/offer_entity.dart';

import 'package:dartz/dartz.dart';

abstract class OfferRepository {
  Future<Either<Failure, List<OfferEntity>>> getOffers();
}
