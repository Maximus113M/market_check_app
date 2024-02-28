import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/features/shopping/data/models/shopping_cart_item_model.dart';
import 'package:market_check/features/shopping/data/datasources/shopping_data_source.dart';
import 'package:market_check/features/shopping/domain/repositories/shopping_repository.dart';

import 'package:dartz/dartz.dart';

class ShoppingRepositoryImpl extends ShoppingRepository {
  final ShoppingDataSource purchasesDataSource;

  ShoppingRepositoryImpl({required this.purchasesDataSource});
  @override
  Future<Either<RemoteFailure, bool>> createNewPurchase(
      List<ShoppingCartItemModel> purchaseItems) async {
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
}
