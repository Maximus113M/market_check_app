import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';
import 'package:market_check/features/shopping_history/data/models/registered_purchase_item.dart';
import 'package:market_check/features/shopping_history/data/datasources/shopping_history_data_source.dart';
import 'package:market_check/features/shopping_history/domain/repositories/shopping_history_repository.dart';

import 'package:dartz/dartz.dart';

class ShoppingHistoryRepositoryImpl extends ShoppingHistoryRepository {
  final ShoppingHistoryDataSource shoppingHistoryDataSource;

  ShoppingHistoryRepositoryImpl({required this.shoppingHistoryDataSource});

  @override
  Future<Either<RemoteFailure, List<PurchaseModel>>>
      getShoppingHistory() async {
    try {
      return Right(
        await shoppingHistoryDataSource.getShoppingHistory(),
      );
    } on RemoteException catch (e) {
      return Left(RemoteFailure(
        message: e.message,
        type: ExceptionType.shoppingHistory,
      ));
    }
  }

  @override
  Future<Either<RemoteFailure, List<RegisteredPurchaseItemModel>>>
      getShoppingProducts(int purchaseId) async {
    try {
      return Right(
        await shoppingHistoryDataSource.getShoppingProducts(purchaseId),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(message: e.message, type: ExceptionType.shoppingHistory),
      );
    }
  }
}
