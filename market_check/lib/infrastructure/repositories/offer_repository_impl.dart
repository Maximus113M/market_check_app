import 'package:market_check/features/offers/data/datasources/offer_datasource.dart';
import 'package:market_check/features/offers/domain/entities/offer.dart';
import 'package:market_check/features/offers/domain/repositories/offer_repository.dart';

class OfferRepositoryImpl extends OfferRepository {
  //Recibe implementacion de OfferDBDatasource
  final OffersDBDatasource datasource;
  OfferRepositoryImpl(this.datasource);

  @override
  Future<List<Offer>> getOffers({int page = 1}) {
    return datasource.getOffers(page: page);
  }
}
