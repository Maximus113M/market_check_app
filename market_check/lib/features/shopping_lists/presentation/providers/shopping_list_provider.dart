import 'package:flutter/material.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_item_model.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';
import 'package:market_check/features/shopping_lists/domain/use_cases/create_shopping_list_use_case.dart';
import 'package:market_check/features/shopping_lists/domain/use_cases/get_shopping_lists_use_case.dart';
import 'package:market_check/features/shopping_lists/domain/use_cases/update_shopping_list_use_case.dart';

class ShoppingListsProvider extends ChangeNotifier {
  final GetShoppingListsUseCase getShoppingListsUseCase;
  final CreateShoppingListUseCase createShoppingListsUseCase;
  final UpdateShoppingListUseCase updateShoppingListUseCase;

  ShoppingListsProvider(
      {required this.getShoppingListsUseCase,
      required this.updateShoppingListUseCase,
      required this.createShoppingListsUseCase});

  List<ShoppingListsModel> shoppingList = [];
  ShoppingListsModel? currentShoppingList;
  int currentIndex = 0;
  TextEditingController productNameController = TextEditingController();
  bool checkBox = false;
  int productsCounter = 1;

  //TODO Terminar
  void getShoppingLists(BuildContext context) async {
    final result = await getShoppingListsUseCase(NoParams());
    result.fold(
      (l) => InAppNotification.serverFailure(
        context: context, message: l.message), 
      (r) => null);
  }

  void createShoppingList(BuildContext context, String name) async {
    final newList = ShoppingListsModel(nameList: name, products: []);
    shoppingList.add(newList);
    final result = await createShoppingListsUseCase(newList);
    result.fold(
        (l) => InAppNotification.serverFailure(
            context: context, message: l.message),
        (r) => newList);
    notifyListeners();
  }

  void addProductsToList() {
    if (productNameController.text.isEmpty) return;
    
    currentShoppingList!.products.add(
      ShoppingListItemModel(
        itemName: productNameController.text,
        counterItems: productsCounter,
      ),
    );
    productNameController.clear();

    notifyListeners();
  }

  //TODO Terminar
  void updateShoppingList(BuildContext context) async {
    final result = await updateShoppingListUseCase(currentShoppingList!);
    result.fold(
        (l) => InAppNotification.serverFailure(
            context: context, message: l.message),
        (updateList) => currentShoppingList = updateList);
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
  selectCurrentIndex(int index) {
    currentIndex = index;
  }
}
