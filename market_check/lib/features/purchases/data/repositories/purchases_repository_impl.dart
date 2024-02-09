import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/purchases/data/datasources/purchases_data_source.dart';
import 'package:market_check/features/purchases/domain/repositories/purchases_repository.dart';

class PurchasesRepositoryImpl extends PurchasesRepository {
  final PurchasesDataSource purchasesDataSource;

  PurchasesRepositoryImpl({required this.purchasesDataSource});
  @override
  Future<Either<RemoteFailure, bool>> createNewPurchase(int storeId) async {
    try {
      return Right(
        await purchasesDataSource.createNewPurchase(storeId),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
            message: e.message, type: ExceptionType.purchasesException),
      );
    }
  }
}
