import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';
import 'package:market_check/features/pending_purchases/presentation/widgets/purchases_card.dart';
import 'package:market_check/features/shopping_history/data/models/registered_purchase_item.dart';
import 'package:market_check/features/shopping_history/domain/use_cases/get_shopping_products_use_case.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/shopping_history/domain/use_cases/get_shopping_history_use_case.dart';

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

  void getPurchaseProducts(BuildContext context, PurchaseModel currentPurchase,
      {bool showModal = true}) async {
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
      if (showModal) {
        showShoppingHistoryModal(context, currentPurchase, totalProducts);
      }
    });
    notifyListeners();
  }

  void showShoppingHistoryModal(BuildContext context,
      PurchaseModel currentPurchase, int totalProducts) async {
    showDialog(
        barrierColor: AppColors.text.withOpacity(0.6),
        context: context,
        builder: (context) => Dialog(
              insetPadding:
                  EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.004),
              child: Stack(
                children: [
                  PurchasesCard(
                    purchase: currentPurchase,
                    store: context.watch<StoresProvider>().storeList.firstWhere(
                          (store) =>
                              store.id == currentPurchase.establecimientoId,
                        ),
                    products: registeredPurchaseItems,
                  ),
                  Positioned(
                    top: 0,
                    right: ScreenSize.width * 0.005,
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(
                        Icons.cancel,
                      ),
                    ),
                  ),
                ],
              ),
            ) /*ShoppingHistoryModalDetails(
        products: registeredPurchaseItems,
        currentPurchase: currentPurchase,
        stores: context.watch<StoresProvider>().storeList,
        totalProducts: totalProducts,
      ),*/
        );
  }
}
