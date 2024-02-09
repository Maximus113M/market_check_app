import 'package:flutter/material.dart';
import 'package:market_check/config/utils/utils.dart';

import 'package:market_check/features/purchases/domain/entities/shopping_item_entity.dart';
import 'package:market_check/features/purchases/presentation/widgets/end_shopping_dialog.dart';

class ShoppingCartProvider with ChangeNotifier {
  List<ShoppingItemEntity> shoppingList = shoppingItems;
  List<ShoppingItemEntity> pendingList = [];
  double shoppingLimit = 0;
  double totalBuy = 0;
  int counter = 0;
  String code = '';
  bool isPurchasePending = false;

  void incrementItemQuanty(int index) {
    shoppingList[index].incrementQuanty();
    notifyListeners();
  }

  void decrementItemQuanty(int index) {
    shoppingList[index].decrementQuanty();
    if (shoppingList[index].quanty == 0) {
      shoppingList.removeAt(index);
    }
    notifyListeners();
  }

  int getCount() {
    int result = shoppingList.fold(
        0, (previousItem, item) => previousItem + item.quanty);
    counter = result;
    return result;
  }

  int shoppingItemsCount() {
    counter = 0;
    totalBuy = 0;
    //Metodo para sumar un atributo
    //int result = shoppingList.fold(
    //    0, (previousItem, item) => previousItem + item.quanty);

    for (var item in shoppingList) {
      counter += item.quanty;
      totalBuy += item.totalPrice;
    }

    print('------------------> counter active');
    return counter;
  }

  void endShopping() {
    pendingList.addAll(shoppingList);
    shoppingList.clear();
  }

  void showEndShoppingDialog(BuildContext context) {
    if (isPurchasePending) return;
    code = "${AppFuntions.randomNumber()}";
    isPurchasePending = true;
    endShopping();
    showDialog(
      barrierColor: AppColors.lightText.withOpacity(0.5),
      context: context,
      builder: (context) {
        return EndShoppingDialog(
          code: code,
        );
      },
    );
  }
}
