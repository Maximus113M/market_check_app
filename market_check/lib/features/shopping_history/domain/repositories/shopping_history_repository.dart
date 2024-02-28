import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';
import 'package:market_check/features/shopping_history/data/models/registered_purchase_item.dart';

import 'package:dartz/dartz.dart';

abstract class ShoppingHistoryRepository {
  Future<Either<RemoteFailure, List<PurchaseModel>>> getShoppingHistory();

  Future<Either<RemoteFailure, List<RegisteredPurchaseItemModel>>>
      getShoppingProducts(int purchaseId);
}
