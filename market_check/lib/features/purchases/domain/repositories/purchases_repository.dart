import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/purchases/data/models/purchase_item_model.dart';

import 'package:dartz/dartz.dart';
import 'package:market_check/features/purchases/data/models/registered_purchase_item.dart';

abstract class PurchasesRepository {
  Future<Either<RemoteFailure, bool>> createNewPurchase(
      List<PurchaseItemModel> purchaseItems);

  Future<Either<RemoteFailure, List<RegisteredPurchaseItemModel>>>
      getPurchaseProducts(int purchaseId);
}
