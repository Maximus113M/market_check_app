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

  factory ShoppingListsModel.fromJson(json) {
    final List<ShoppingListItemModel> products = [];

    (jsonDecode(json['productos']) as Map).forEach((key, value) {
      products.add(
        ShoppingListItemModel.fromJson(jsonDecode(value)),
      );
    });

    return ShoppingListsModel(
      id: json['id'],
      userId: json['user_id'],
      nameList: json['listName'],
      products: products,
    );
  }

  Map<String, dynamic> shoppingListToJson() {
    var test = {
      for (var item in products) item.itemName: jsonEncode(item.toMap())
    };

    print(test);
    return {
      "listName": nameList,
      "productos": jsonEncode(test),
    };
  }
}
