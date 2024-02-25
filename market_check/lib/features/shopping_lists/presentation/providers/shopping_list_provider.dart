import 'package:flutter/foundation.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';

class ShoppingListsProvider extends ChangeNotifier{

  List<ShoppingListsModel> shoppingList = [];

  void createShoppingList(String name){
    final newList = ShoppingListsModel(nameList: name);
    shoppingList.add(newList);
    notifyListeners();
  }
}