import 'package:flutter/material.dart';

import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';
import 'package:market_check/features/pending_purchases/domain/use_cases/get_open_purchases_use_case.dart';

class PendingProvider  with ChangeNotifier{
  final GetOpenPurchasesUseCase getOpenPurchaseUseCase;
  PurchaseModel? openPurchases;

  PendingProvider({required this.getOpenPurchaseUseCase});

  void setFirstPendingPurchases(PurchaseModel purchases) {
    openPurchases = purchases;
  }

  void getOpenPurchase(BuildContext context) async {
    final response = await getOpenPurchaseUseCase(NoParams());
    response.fold(
        (l) => InAppNotification.showAppNotification(
            context: context,
            title: 'Error al consultar...',
            message: l.message,
            type: NotificationType.error), (r) {
      openPurchases = r;
    });
  }
}
