import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/features/stores/domain/entities/store_entity.dart';
import 'package:market_check/features/stores/data/datasources/store_datasource.dart';
import 'package:market_check/features/stores/domain/repositories/store_repository.dart';

import 'package:dartz/dartz.dart';

class StoreRepositoryImpl extends StoreRepository {
  //Instancia del StoreDBDatasource, donde se realiza el mappeo
  final StoreDBDatasource datasource;

  StoreRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<StoreEntity>>> getStores() async {
    try {
      return Right(
        await datasource.getStores(),
      );
    } on StoresException catch (e) {
      return Left(
        OffersFailure(message: e.message),
      );
    }
  }
}
