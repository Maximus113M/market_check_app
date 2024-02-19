import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/categories/data/models/categories_model.dart';

abstract class CategoriesRepository {
  Future<Either<RemoteFailure, List<CategorieModel>>> getCategorires(
      int storeId);
}
