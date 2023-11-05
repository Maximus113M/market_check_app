import 'package:market_check/features/offers/data/datasources/offer_datasource.dart';
import 'package:market_check/infrastructure/repositories/offer_repository_impl.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

//Este repositorio es inmutable, solo lectura, proporciona las ofertas
final offersRepositoryProvider = Provider((ref) {
  return OfferRepositoryImpl(OffersDBDatasource());
});
