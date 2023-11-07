import 'package:market_check/json_from_db/json_data.dart';
import 'package:market_check/features/stores/domain/entities/store_entity.dart';
import 'package:market_check/features/stores/data/models/store_mapper.dart';
import 'package:market_check/features/stores/data/models/stores_db_response.dart';

abstract class StoreDatasource {
  Future<List<StoreEntity>> getStores();
}

class StoreDBDatasource extends StoreDatasource {
  @override
  Future<List<StoreEntity>> getStores() async {
    //Json de peticion http
    final storeFromJson = storesJson;

    //Instanciar StoreDB from json
    final storeDB = StoresDbResponse.fromJson(storeFromJson);

    //Mapeo
    final List<StoreEntity> stores = storeDB.results
        .where((store) => store.poster.isNotEmpty)
        .map((storeDB) => StoreMapper.storeResponseToEntity(storeDB))
        .toList();

    return stores;
  }
}
