import 'package:market_check/features/stores/data/datasources/store_datasource.dart';
import 'package:market_check/features/stores/domain/entities/store.dart';
import 'package:market_check/features/stores/domain/repositories/store_datasource.dart';

class StoreRepositoryImpl extends StoreRepository {
  //Instancia del StoreDBDatasource, donde se realiza el mappeo
  final StoreDBDatasource datasource;

  StoreRepositoryImpl(this.datasource);

  @override
  Future<List<Store>> getStore() {
    return datasource.getStore();
  }
}
