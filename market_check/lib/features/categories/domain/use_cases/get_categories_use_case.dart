import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/categories/data/models/categories_model.dart';
import 'package:market_check/features/categories/domain/repositories/categories_repository.dart';

class GetCategoriesUseCase extends UseCase<List<CategorieModel>, int> {
  final CategoriesRepository categoriesRepository;

  GetCategoriesUseCase({required this.categoriesRepository});

  @override
  Future<Either<RemoteFailure, List<CategorieModel>>> call(int params) async{
    return await categoriesRepository.getCategorires(params);
  }
}
