import 'package:flutter/material.dart';

import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/profile_cards/data/models/purchase_model.dart';
import 'package:market_check/features/pending_purchases/domain/use_cases/get_open_purchases_use_case.dart';
import 'package:market_check/features/profile_cards/presentation/providers/profile_cards_provider.dart';
import 'package:provider/provider.dart';

class PendingPurchaseProvider with ChangeNotifier {
  final GetOpenPurchasesUseCase getOpenPurchaseUseCase;
  PurchaseModel? openPurchase;

  PendingPurchaseProvider({required this.getOpenPurchaseUseCase});

  void setFirstPendingPurchases(PurchaseModel? purchases) {
    openPurchase = purchases;
  }

  getOpenPurchase(BuildContext context) async {
    final response = await getOpenPurchaseUseCase(NoParams());
    response.fold(
        (l) => InAppNotification.showAppNotification(
            context: context,
            title: 'Error al consultar...',
            message: l.message,
            type: NotificationType.error), (r) {
      openPurchase = r;
      getOpenPurchaseProductsFromHistoryProvider(context);
      notifyListeners();
    });
  }

  void getOpenPurchaseProductsFromHistoryProvider(BuildContext context) {
    if (openPurchase != null) {
      context
          .read<ProfileCardsProvider>()
          .getPurchaseProducts(context, openPurchase!, showModal: false);
    }
  }
}
