import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';

import 'package:dartz/dartz.dart';

abstract class PendingPurchasesRepository {
  Future<Either<RemoteFailure, PurchaseModel?>> getOpenPurchase();
}
