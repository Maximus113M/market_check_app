import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/stores/domain/repositories/store_repository.dart';

import 'package:dartz/dartz.dart';

class GetOfferProductsUseCase extends UseCase<List<ProductModel>, int> {
  final StoresRepository storesRepository;

  GetOfferProductsUseCase({required this.storesRepository});

  @override
  Future<Either<RemoteFailure, List<ProductModel>>> call(int params) async {
    return await storesRepository.getOfferProducts(params);
  }
}
