import 'package:market_check/json_from_db/json_data.dart';
import 'package:market_check/features/stores/domain/entities/store.dart';
import 'package:market_check/features/stores/data/models/store_mapper.dart';
import 'package:market_check/features/stores/data/models/stores_db_response.dart';

abstract class StoreDatasource {
  Future<List<Store>> getStore();
}

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
