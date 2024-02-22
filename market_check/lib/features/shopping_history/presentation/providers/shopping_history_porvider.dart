import 'package:flutter/material.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';
import 'package:market_check/features/shopping_history/domain/use_cases/get_shopping_history_use_case.dart';

class ShoppingHistoryProvider with ChangeNotifier {
  final GetShoppinHistoryUseCase getShoppinHistoryUseCase;
  List<PurchaseModel> purchases = [];

  ShoppingHistoryProvider({required this.getShoppinHistoryUseCase});

  void getPurchasesHistory(BuildContext context) async {
    final result = await getShoppinHistoryUseCase(NoParams());
    result.fold(
        (l) => InAppNotification.showAppNotification(
            context: context,
            title: 'Ha ocurrido un error!',
            message: l.message,
            type: NotificationType.error), (r) {
      purchases = r;
      print(r);
    });

    notifyListeners();
  }
}
