import 'package:market_check/features/shopping_lists/data/models/shopping_lists_item_model.dart';

class ShoppingListModel {
  String nameList;
  List<ShoppingListItemModel> products;

  ShoppingListModel({required this.nameList, required this.products});
}
