import 'package:market_check/features/offers/domain/entities/offer.dart';

abstract class OfferRepository {
  Future<List<Offer>> getOffers();
}
