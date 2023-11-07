import 'package:flutter/material.dart';

import 'package:market_check/features/stores/domain/entities/store_entity.dart';
import 'package:market_check/features/stores/data/models/stores_db_response.dart';

class StoreMapper {
  static StoreEntity storeResponseToEntity(StoreDB storeDB) {
    final String color = storeDB.color;
    List<String> colorSplit = color.split(',');
    List<int> colorIndex = [];

    for (String color in colorSplit) {
      int number = int.parse(color);
      colorIndex.add(number);
    }
    return StoreEntity(
        id: storeDB.id,
        name: storeDB.name,
        caption: storeDB.caption,
        creationDate: storeDB.creationDate,
        poster: storeDB.poster,
        posterLogo: storeDB.posterLogo,
        color: Color.fromARGB(
            colorIndex[0], colorIndex[1], colorIndex[2], colorIndex[3]),
        locations:
            List<StoreLocation>.from(storeDB.locations.map((x) => StoreLocation(
                  location: x.location,
                  name: x.name,
                  phoneNumber: x.phoneNumber,
                ))));
  }
}
