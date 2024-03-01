import 'package:market_check/features/shopping_lists/data/models/shopping_lists_item_model.dart';

class ShoppingListsModel {
  final int userId;
  final String nameList;
  List<ShoppingListItemModel> products;

  ShoppingListsModel(
      {required this.userId, required this.nameList, required this.products});

  factory ShoppingListsModel.fromJson(json) => ShoppingListsModel(
        userId: json['user_id'],
        nameList: json['listName'],
        products: json['productos'],
      );

  Map<String, dynamic> shoppingListJson()=>{
    "user_id": userId,
    "listName": nameList,
    "productos": products
  };
}
