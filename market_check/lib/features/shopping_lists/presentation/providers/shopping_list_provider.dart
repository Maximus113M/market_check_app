import 'package:flutter/material.dart';

import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_item_model.dart';
import 'package:market_check/features/shopping_lists/domain/use_cases/create_shopping_list_use_case.dart';
import 'package:market_check/features/shopping_lists/domain/use_cases/delete_shopping_list_use_case.dart';
import 'package:market_check/features/shopping_lists/domain/use_cases/get_shopping_lists_use_case.dart';
import 'package:market_check/features/shopping_lists/domain/use_cases/update_shopping_list_use_case.dart';
import 'package:market_check/features/shopping_lists/presentation/widgets/new_list_dialog.dart';

class ShoppingListsProvider extends ChangeNotifier {
  final GetShoppingListsUseCase getShoppingListsUseCase;
  final CreateShoppingListUseCase createShoppingListsUseCase;
  final UpdateShoppingListUseCase updateShoppingListUseCase;
  final DeleteShoppingListUseCase deleteShoppingListUseCase;

  ShoppingListsProvider({
    required this.getShoppingListsUseCase,
    required this.updateShoppingListUseCase,
    required this.createShoppingListsUseCase,
    required this.deleteShoppingListUseCase,
  });

  List<ShoppingListsModel> shoppingLists = [];
  ShoppingListsModel? currentShoppingList;
  int currentIndex = 0;
  TextEditingController productNameController = TextEditingController();
  bool checkBox = false;
  int productsCounter = 1;

  void getShoppingLists(BuildContext context) async {
    //if (shoppingLists.isNotEmpty) return;

    final result = await getShoppingListsUseCase(NoParams());
    result.fold(
        (l) => InAppNotification.serverFailure(
            context: context, message: l.message), (r) {
      shoppingLists = r;
    });
    notifyListeners();
  }

  void createShoppingList(BuildContext context, String name) async {
    final newList = ShoppingListsModel(nameList: name, products: []);

    final result = await createShoppingListsUseCase(newList);
    result.fold(
        (l) => InAppNotification.serverFailure(
            context: context, message: l.message), (list) {
      shoppingLists.add(list);
    });
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
    currentShoppingList = shoppingLists[selectedIndex];
    notifyListeners();
  }

  void deleteList(BuildContext context, int index) async {
    final result = await deleteShoppingListUseCase(shoppingLists[index].id!);

    result.fold((l) {
      InAppNotification.showAppNotification(
        context: context,
        title: 'Error de conexión',
        message: l.message,
        type: NotificationType.error,
      );
    }, (r) {
      shoppingLists.removeAt(index);
    });
    notifyListeners();
  }

  void selectdCheckBox(int index) {
    currentShoppingList!.products[index].toggleState();
    notifyListeners();
  }

  showCreateListDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const NewListDialog(),
    );
  }

  //TODO VERIFICAR USO
  selectCurrentIndex(int index) {
    currentIndex = index;
  }
}
