import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';

class PendingProvider {
  List<PurchaseModel> openPurchases = [];

  void getPendingPurchases(List<PurchaseModel> purchases) {
    openPurchases = [...purchases];
  }
}
