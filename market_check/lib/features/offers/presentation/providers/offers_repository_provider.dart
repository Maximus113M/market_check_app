import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_check/infrastructure/datasources/offersdb_datasource.dart';
import 'package:market_check/infrastructure/repositories/offer_repository_impl.dart';

//Este repositorio es inmutable, solo lectura, proporciona las ofertas
final offersRepositoryProvider = Provider((ref) {
  return OfferRepositoryImpl(OffersDBDatasource());
});
