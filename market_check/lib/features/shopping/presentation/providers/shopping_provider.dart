import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/features/shopping/data/models/shopping_cart_item_model.dart';
import 'package:market_check/features/shopping/presentation/widgets/end_shopping_dialog.dart';
import 'package:market_check/features/shopping/domain/use_cases/create_new_purchase_use_case.dart';

class ShoppingProvider with ChangeNotifier {
  final CreateNewPurchaseUseCase createNewPurchaseUseCase;
  List<ShoppingCartItemModel> shoppingList = [];
  List<ShoppingCartItemModel> pendingList = [];
  double shoppingLimit = 0;
  double totalBuy = 0;
  int counter = 0;
  String code = '';
  bool isPurchasePending = false;

  ShoppingProvider({required this.createNewPurchaseUseCase});

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

    for (var item in shoppingList) {
      counter += item.quanty;
      totalBuy += item.totalPrice;
    }

    return counter;
  }

  void endShopping(BuildContext context) async {
    if (AuthService.user!.isPurchaseOpen) {
      return;
    }
    final result = await createNewPurchaseUseCase(shoppingList);
    result.fold((l) {
      debugPrint(l.message);
    }, (r) {
      if (r) {
        shoppingList.clear();
        showEndShoppingDialog(context);
        notifyListeners();
      }
    });
  }

  void showEndShoppingDialog(BuildContext context) {
    showDialog(
      barrierColor: AppColors.lightText.withOpacity(0.5),
      context: context,
      builder: (context) {
        return EndShoppingDialog(
          code: '${AuthService.user!.purchasePin}',
        );
      },
    );
  }

  bool addNewProductToCart(ShoppingCartItemModel shoppingCartItem) {
    if (AuthService.user!.isPurchaseOpen) return false;

    bool isProductAdded = false;
    for (var item in shoppingList) {
      if (item.product.id == shoppingCartItem.product.id) {
        item.quanty = item.quanty + shoppingCartItem.quanty;
        item.total();
        isProductAdded = true;
        notifyListeners();
        break;
      }
    }
    if (!isProductAdded) {
      shoppingList.add(shoppingCartItem);
      notifyListeners();
    }
    return true;
  }
}
