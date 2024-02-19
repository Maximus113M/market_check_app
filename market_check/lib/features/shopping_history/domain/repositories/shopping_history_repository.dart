import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';

abstract class ShoppingHistoryRepository{
  Future<Either<RemoteFailure, List<PurchaseModel>>> getShoppingHistory();
}