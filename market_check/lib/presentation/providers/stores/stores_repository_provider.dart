import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_check/infrastructure/datasources/storedb_datasource.dart';
import 'package:market_check/infrastructure/repositories/store_repositoryimpl.dart';

//Este repositorio es inmutable, solo lectura, proporciona las tiendas
final storesRepositoryProvider = Provider((ref) {
//devuelve la instacia de la implementacion del repositorio(recibe el store datasource)
  return StoreRepositoryImpl(StoreDBDatasource());
});
