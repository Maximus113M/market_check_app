import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/profile_cards/data/models/purchase_model.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/profile_cards/data/models/favorite_product_model.dart';
import 'package:market_check/features/profile_cards/data/models/registered_purchase_item.dart';
import 'package:market_check/features/pending_purchases/presentation/widgets/purchases_card.dart';
import 'package:market_check/features/profile_cards/domain/use_cases/get_stores_visited_use_case.dart';
import 'package:market_check/features/profile_cards/domain/use_cases/get_shopping_history_use_case.dart';
import 'package:market_check/features/profile_cards/domain/use_cases/get_favorite_products_use_case.dart';
import 'package:market_check/features/profile_cards/domain/use_cases/get_shopping_products_use_case.dart';

import 'package:provider/provider.dart';

class ProfileCardsProvider with ChangeNotifier {
  final GetShoppinHistoryUseCase getShoppinHistoryUseCase;
  final GetShoppingProductsUseCase getShoppingProductsUseCase;
  final GetStoresVisitedUseCase getStoresVisitedUseCase;
  final GetFavoriteProductsUseCase getFavoriteProductsUseCase;
  List<PurchaseModel> purchases = [];
  List<RegisteredPurchaseItemModel> registeredPurchaseItems = [];
  List<StoreModel> storesVisited = [];
  List<FavoriteProductModel> favoriteProducts = [];
  bool isLoading = false;

  ProfileCardsProvider({
    required this.getShoppinHistoryUseCase,
    required this.getShoppingProductsUseCase,
    required this.getStoresVisitedUseCase,
    required this.getFavoriteProductsUseCase,
  });

  void getPurchasesHistory(BuildContext context) async {
    if (isLoading) return;
    isLoading = true;

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

    isLoading = false;
    notifyListeners();
  }

  void getPurchaseProducts(BuildContext context, PurchaseModel currentPurchase,
      {bool showModal = true}) async {
    if (isLoading) return;
    isLoading = true;

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

    isLoading = false;
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

  void getVisitedStores(BuildContext context) async {
    if (isLoading) return;
    isLoading = true;

    final result = await getStoresVisitedUseCase(NoParams());

    result.fold(
        (l) => InAppNotification.serverFailure(
              context: context,
              message: l.message,
            ), (r) {
      storesVisited = r;
    });

    isLoading = false;
    notifyListeners();
  }

  void getFavoriteProducts(BuildContext context) async {
    if (isLoading) return;
    isLoading = true;

    final result = await getFavoriteProductsUseCase(AuthService.user!.id!);
    result.fold(
        (l) => InAppNotification.showAppNotification(
              context: context,
              title: 'Error de conexión',
              message: l.message,
              type: NotificationType.error,
            ), (r) {
      favoriteProducts = r;
    });

    isLoading = false;
    notifyListeners();
  }
}
