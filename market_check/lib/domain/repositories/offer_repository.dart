import 'package:market_check/domain/entities/offer.dart';

abstract class OfferRepository {
  Future<List<Offer>> getOffers();
}
