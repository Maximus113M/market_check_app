import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';

import 'package:dartz/dartz.dart';

abstract class StoresRepository {
  Future<Either<Failure, List<StoreModel>>> getStores();
}
