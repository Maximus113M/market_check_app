import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/failures.dart';

abstract class PurchasesRepository{
  Future<Either<RemoteFailure, bool>> createNewPurchase(int storeId);
}