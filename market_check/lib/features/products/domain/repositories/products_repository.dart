import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/products/data/models/product_model.dart';

import 'package:dartz/dartz.dart';

abstract class ProductsRepository{
  Future<Either<RemoteFailure, List<ProductModel>>> getStoreProducts(int storeId);
}