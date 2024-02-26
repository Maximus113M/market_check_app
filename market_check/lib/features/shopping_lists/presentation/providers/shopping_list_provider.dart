import 'package:flutter/foundation.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';

class ShoppingListsProvider extends ChangeNotifier {
  List<ShoppingListsModel> shoppingList = [];
  int currentIndex = 0;

  void createShoppingList(String name) {
    final newList = ShoppingListsModel(nameList: name, products: []);
    shoppingList.add(newList);
    notifyListeners();
  }

  void addProductsToList(String productName) {
      shoppingList[currentIndex].products.add(productName);
      print(shoppingList[currentIndex].products);
      notifyListeners();
  }

  void selectShoppingList(int selectedIndex) {
    currentIndex = selectedIndex;
    notifyListeners();
  }
}
