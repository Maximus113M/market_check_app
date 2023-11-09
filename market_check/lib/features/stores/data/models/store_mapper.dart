import 'package:market_check/features/stores/domain/entities/store_entity.dart';
import 'package:market_check/features/stores/data/models/stores_db_response.dart';

class StoreMapper {
  static StoreEntity storeResponseToEntity(StoreDB storeDB) {
    return StoreEntity(
      id: storeDB.id,
      name: storeDB.name,
      caption: storeDB.caption,
      creationDate: storeDB.creationDate,
      poster: storeDB.poster,
      posterLogo: storeDB.posterLogo,
      color: storeDB.color,
      titleColor: storeDB.titleColor,
      locations: List<StoreLocation>.from(
        storeDB.locations.map(
          (x) => StoreLocation(
            location: x.location,
            name: x.name,
            phoneNumber: x.phoneNumber,
          ),
        ),
      ),
    );
  }
}
