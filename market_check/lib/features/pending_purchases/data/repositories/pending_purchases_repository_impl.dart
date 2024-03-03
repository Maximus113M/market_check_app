import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';
import 'package:market_check/features/pending_purchases/data/datasources/pending_purchases_data_source.dart';
import 'package:market_check/features/pending_purchases/domain/repositories/pending_purchases_repository.dart';

import 'package:dartz/dartz.dart';

class PendingPurchasesRepositoryImpl extends PendingPurchasesRepository {
  final PendingPurchasesDataSource pendingPurchasesDataSource;

  PendingPurchasesRepositoryImpl({required this.pendingPurchasesDataSource});

  @override
  Future<Either<RemoteFailure, PurchaseModel?>> getOpenPurchase() async {
    try {
      return Right(
        await pendingPurchasesDataSource.getOpenPurchase(),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
          message: e.message,
          type: ExceptionType.pendingPurchases,
        ),
      );
    }
  }
}
