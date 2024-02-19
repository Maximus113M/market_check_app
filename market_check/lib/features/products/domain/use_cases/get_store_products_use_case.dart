import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/products/domain/repositories/products_repository.dart';

import 'package:dartz/dartz.dart';

class GetStoreProductsUseCase extends UseCase<List<ProductModel>, int> {
  final ProductsRepository productsRepository;

  GetStoreProductsUseCase({required this.productsRepository});
  @override
  Future<Either<RemoteFailure, List<ProductModel>>> call(int params) async {
    return await productsRepository.getStoreProducts(params);
  }
}
