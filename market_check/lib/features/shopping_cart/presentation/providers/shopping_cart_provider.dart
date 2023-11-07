import 'package:flutter/material.dart';
import 'package:market_check/features/shopping_cart/domain/entities/shopping_item_entity.dart';

class ShoppingCartProvider with ChangeNotifier {
  List<ShoppingItemEntity> shoppingList = shoppingItems;
  double totalBuy = 0;

  void incrementItemQuanty(int index) {
    shoppingList[index].incrementQuanty();
    notifyListeners();
  }

  void decrementItemQuanty(int index) {
    shoppingList[index].decrementQuanty();
    notifyListeners();
  }

  int shoppingItemsCount() {
    int count = 0;
    totalBuy = 0;
    for (var item in shoppingList) {
      count += item.quanty;
      totalBuy += item.totalPrice;
    }
    //getTotalBuy();
    return count;
  }

  void getTotalBuy() {
    totalBuy = 0;
    for (var item in shoppingList) {
      totalBuy += item.totalPrice;
    }
  }
}
