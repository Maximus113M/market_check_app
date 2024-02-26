import 'package:flutter/material.dart';

import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/shopping_history/data/models/registered_purchase_item.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';
import 'package:market_check/features/shopping_history/domain/use_cases/get_shopping_products_use_case.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/shopping_history/domain/use_cases/get_shopping_history_use_case.dart';
import 'package:market_check/features/shopping_history/presentation/widgets/shopping_history_modal_details.dart';

import 'package:provider/provider.dart';

class ShoppingHistoryProvider with ChangeNotifier {
  final GetShoppinHistoryUseCase getShoppinHistoryUseCase;
  final GetShoppingProductsUseCase getShoppingProductsUseCase;

  List<PurchaseModel> purchases = [];
  List<RegisteredPurchaseItemModel> registeredPurchaseItems = [];

  ShoppingHistoryProvider(
      {required this.getShoppinHistoryUseCase,
      required this.getShoppingProductsUseCase});

  void getPurchasesHistory(BuildContext context) async {
    final result = await getShoppinHistoryUseCase(NoParams());
    result.fold(
      (l) {
        InAppNotification.showAppNotification(
            context: context,
            title: 'Ha ocurrido un error!',
            message: l.message,
            type: NotificationType.error);
      },
      (purchaseList) {
        purchases = purchaseList;
      },
    );

    notifyListeners();
  }

  void getPurchaseProducts(
      BuildContext context, PurchaseModel currentPurchase) async {
    final result = await getShoppingProductsUseCase(currentPurchase.id);
    result.fold(
        (l) => InAppNotification.showAppNotification(
              context: context,
              title: 'Error de conexión',
              message: l.message,
              type: NotificationType.error,
            ), (r) {
      registeredPurchaseItems = r;
      int totalProducts = registeredPurchaseItems.fold(0,
          (previousValue, purchaseItem) => previousValue + purchaseItem.quanty);
      showShoppingHistoryModal(context, currentPurchase, totalProducts);
    });
  }

  void showShoppingHistoryModal(BuildContext context,
      PurchaseModel currentPurchase, int totalProducts) async {
    showDialog(
      context: context,
      builder: (context) => ShoppingHistoryModalDetails(
        products: registeredPurchaseItems,
        currentPurchase: currentPurchase,
        stores: context.watch<StoresProvider>().storeList,
        totalProducts: totalProducts,
      ),
    );
  }
}