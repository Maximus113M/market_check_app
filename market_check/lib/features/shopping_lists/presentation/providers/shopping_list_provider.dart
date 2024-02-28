import 'package:flutter/material.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_item_model.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';

class ShoppingListsProvider extends ChangeNotifier {
  List<ShoppingListModel> shoppingList = [];
  ShoppingListModel? currentShoppingList;
  int currentIndex = 0;
  TextEditingController customTextForm = TextEditingController();
  bool checkBox = false;

  void createShoppingList(String name) {
    final newList = ShoppingListModel(nameList: name, products: []);
    shoppingList.add(newList);
    notifyListeners();
  }

  void addProductsToList() {
    if (productNameController.text.isEmpty) return;
    currentShoppingList!.products.add(
      ShoppingListItemModel(itemName: productNameController.text),
    );
    productNameController.clear();

    notifyListeners();
  }

  void selectShoppingList(int selectedIndex) {
    currentShoppingList = shoppingList[selectedIndex];
    notifyListeners();
  }

  void deleteList() {
    shoppingList.removeAt(currentIndex);
    notifyListeners();
  }

  void selectdCheckBox(int index) {
    currentShoppingList!.products[index].toggleState();
    notifyListeners();
  }
  //TODO VERIFICAR USO
  selectCurrentIndex(int index){
    currentIndex= index;
  }
}
