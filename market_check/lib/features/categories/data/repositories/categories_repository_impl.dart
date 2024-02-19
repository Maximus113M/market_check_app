import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/categories/data/datasource/categories_datasource.dart';
import 'package:market_check/features/categories/data/models/categories_model.dart';
import 'package:market_check/features/categories/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final CategoriesDataSource categoriesDataSource;

  CategoriesRepositoryImpl({required this.categoriesDataSource});

  @override
  Future<Either<RemoteFailure, List<CategorieModel>>> getCategorires(
      int storeId) async {
    try {
      return Right(
        await categoriesDataSource.getCategories(storeId),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
            message: e.message, type: ExceptionType.categoriesException),
      );
    }
  }
}
