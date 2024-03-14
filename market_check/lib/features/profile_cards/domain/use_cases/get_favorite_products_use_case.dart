import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/profile_cards/domain/repositories/shopping_history_repository.dart';

import 'package:dartz/dartz.dart';

class GetFavoriteProductsUseCase extends UseCase<List<ProductModel>, int> {
  final ProfileCardsRepository profileCardsRepository;

  GetFavoriteProductsUseCase({required this.profileCardsRepository});
  @override
  Future<Either<RemoteFailure, List<ProductModel>>> call(int params) async {
    return await profileCardsRepository.getFavoriteProducts(params);
  }
}
