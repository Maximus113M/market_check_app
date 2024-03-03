import 'dart:convert';

import 'package:market_check/features/shopping_lists/data/models/shopping_lists_item_model.dart';

class ShoppingListsModel {
  final int? id;
  final int? userId;
  final String nameList;
  List<ShoppingListItemModel> products;

  ShoppingListsModel({
    this.id,
    this.userId,
    required this.nameList,
    required this.products,
  });

  factory ShoppingListsModel.fromJson(json) => ShoppingListsModel(
        id: json['id'],
        userId: json['user_id'],
        nameList: json['listName'],
        products: (jsonDecode(json['productos']))
            .map((itemFromJson) => ShoppingListItemModel.fromJson(itemFromJson))
            .toList(),
      );

  Map<String, dynamic> shoppingListToJson() {
    var test = Map<String, String>.fromIterable(
      products,
      key: (item) => item.itemName,
      value: (item) => jsonEncode(item.toMap()),
    );

    print(test);
    return {
      "listName": nameList,
      "productos": jsonEncode(test),
    };
  }
}
