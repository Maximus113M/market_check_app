import 'package:market_check/features/shopping_lists/data/models/shopping_lists_item_model.dart';

class ShoppingListsModel {
  final int userId;
  final String nameList;
  int totalProductsCounter;
  List<ShoppingListItemModel> products;


ShoppingListsModel({required this.userId, required this.nameList, required this.totalProductsCounter, required this.products});  



}