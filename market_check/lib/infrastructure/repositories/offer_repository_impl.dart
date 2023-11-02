import 'package:market_check/domain/entities/offer.dart';
import 'package:market_check/domain/repositories/offer_repository.dart';
import 'package:market_check/infrastructure/datasources/offersdb_datasource.dart';

class OfferRepositoryImpl extends OfferRepository {
  //Recibe implementacion de OfferDBDatasource
  final OffersDBDatasource datasource;
  OfferRepositoryImpl(this.datasource);

  @override
  Future<List<Offer>> getOffers({int page = 1}) {
    return datasource.getOffers(page: page);
  }
}
