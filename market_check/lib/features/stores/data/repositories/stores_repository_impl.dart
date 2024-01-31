import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/stores/data/datasources/stores_datasource.dart';
import 'package:market_check/features/stores/domain/repositories/store_repository.dart';

import 'package:dartz/dartz.dart';

class StoresRepositoryImpl extends StoresRepository {
  final StoresDataSourceImpl datasource;

  StoresRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<StoreModel>>> getStores() async {
    try {
      return Right(
        await datasource.getStores(),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
          message: e.message,
          type: ExceptionType.storesException,
        ),
      );
    }
  }
}
