import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/purchases/data/models/purchase_item_model.dart';
import 'package:market_check/features/purchases/data/models/registered_purchase_item.dart';
import 'package:market_check/features/purchases/presentation/widgets/end_shopping_dialog.dart';
import 'package:market_check/features/purchases/domain/use_cases/get_purchase_products_use_case.dart';

class ShoppingCartProvider with ChangeNotifier {
  final GetPurchaseProductsUseCase getPurchaseProductsUseCase;

  List<PurchaseItemModel> shoppingList = [];
  List<PurchaseItemModel> pendingList = [];
  double shoppingLimit = 0;
  double totalBuy = 0;
  int counter = 0;
  String code = '';
  bool isPurchasePending = false;

  ShoppingCartProvider({required this.getPurchaseProductsUseCase});

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

  void addNewProductToCart(ProductModel product) {
    PurchaseItemModel purchaseItem = PurchaseItemModel(product: product);
    shoppingList.add(purchaseItem);
    notifyListeners();
  }

  //TODO MOVER A PURCHASE HISTORY
  Future<List<RegisteredPurchaseItemModel>> getPurchaseProducts(
      BuildContext context, int purchaseId) async {
    List<RegisteredPurchaseItemModel> registeredPurchases = [];
    final result = await getPurchaseProductsUseCase(purchaseId);
    result.fold(
        (l) => InAppNotification.showAppNotification(
              context: context,
              title: 'Error de conexión',
              message: l.message,
              type: NotificationType.error,
            ),
        (r) => registeredPurchases = r);
    return registeredPurchases;
  }
}
