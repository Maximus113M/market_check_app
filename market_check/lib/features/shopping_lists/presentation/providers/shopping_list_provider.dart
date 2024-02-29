import 'package:flutter/material.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_item_model.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';

class ShoppingListsProvider extends ChangeNotifier {
  List<ShoppingListsModel> shoppingList = [];
  ShoppingListsModel? currentShoppingList;
  int currentIndex = 0;
  TextEditingController productNameController = TextEditingController();
  bool checkBox = false;
  int productsCounter = 0;

  void createShoppingList(String name) {
    final newList = ShoppingListsModel(nameList: name, products: [], userId: AuthService.user!.id!, totalProductsCounter: 0);
    shoppingList.add(newList);
    notifyListeners();
  }

  void addProductsToList() {
    if (productNameController.text.isEmpty) return;
    currentShoppingList!.products.add(
      ShoppingListItemModel(itemName: productNameController.text, counterItems: productsCounter,),
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
