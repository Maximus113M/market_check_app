import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/features/purchases/data/models/purchase_item_model.dart';
import 'package:market_check/features/purchases/data/datasources/purchases_data_source.dart';
import 'package:market_check/features/purchases/data/models/registered_purchase_item.dart';
import 'package:market_check/features/purchases/domain/repositories/purchases_repository.dart';

import 'package:dartz/dartz.dart';

class PurchasesRepositoryImpl extends PurchasesRepository {
  final PurchasesDataSource purchasesDataSource;

  PurchasesRepositoryImpl({required this.purchasesDataSource});
  @override
  Future<Either<RemoteFailure, bool>> createNewPurchase(
      List<PurchaseItemModel> purchaseItems) async {
    try {
      return Right(
        await purchasesDataSource.createNewPurchase(purchaseItems),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
            message: e.message, type: ExceptionType.purchasesException),
      );
    }
  }

  @override
  Future<Either<RemoteFailure, List<RegisteredPurchaseItemModel>>>
      getPurchaseProducts(int purchaseId) async {
    try {
      return Right(
        await purchasesDataSource.getPurchaseProducts(purchaseId),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
            message: e.message, type: ExceptionType.purchasesException),
      );
    }
  }
}
