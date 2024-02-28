import 'package:flutter/material.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';

class ShoppingListsProvider extends ChangeNotifier {
  List<ShoppingListsModel> shoppingList = [];
  int currentIndex = 0;
  TextEditingController customTextForm = TextEditingController();
  bool checkBox = false;

  void createShoppingList(String name) {
    final newList = ShoppingListsModel(nameList: name, products: [], isSelected: false);
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

  void deleteList(){
    shoppingList.removeAt(currentIndex);
    notifyListeners();
  }

  void clearCustomTextform(){
    customTextForm.clear();
    notifyListeners();
  }

  void selectdCheckBox(bool? value,){
    checkBox = value!;
    notifyListeners();
  }




}
