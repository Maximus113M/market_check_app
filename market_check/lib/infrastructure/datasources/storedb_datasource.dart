import 'package:market_check/features/stores/data/datasources/store_datasource.dart';
import 'package:market_check/domain/entities/store.dart';
import 'package:market_check/infrastructure/models/marketcheck_db/stores_db_response.dart';
import 'package:market_check/json_from_db/json_data.dart';
import 'package:market_check/infrastructure/mappers/store_mapper.dart';

class StoreDBDatasource extends StoreDatasource {
  @override
  Future<List<Store>> getStore() async {
    //Json de peticion http
    final storeFromJson = storesJson;

    //Instanciar StoreDB from json
    final storeDB = StoresDbResponse.fromJson(storeFromJson);

    //Mapeo
    final List<Store> stores = storeDB.results
        .where((store) => store.poster.isNotEmpty)
        .map((storeDB) => StoreMapper.storeResponseToEntity(storeDB))
        .toList();

    return stores;
  }
}
