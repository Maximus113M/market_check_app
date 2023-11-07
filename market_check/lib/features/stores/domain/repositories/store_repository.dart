import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/stores/domain/entities/store_entity.dart';

import 'package:dartz/dartz.dart';

abstract class StoreRepository {
  Future<Either<Failure, List<StoreEntity>>> getStores();
}
