import 'package:market_check/domain/entities/store.dart';
import 'package:market_check/domain/repositories/store_datasource.dart';
import 'package:market_check/infrastructure/datasources/storedb_datasource.dart';

class StoreRepositoryImpl extends StoreRepository {
  //Instancia del StoreDBDatasource, donde se realiza el mappeo
  final StoreDBDatasource datasource;

  StoreRepositoryImpl(this.datasource);

  @override
  Future<List<Store>> getStore() {
    return datasource.getStore();
  }
}
