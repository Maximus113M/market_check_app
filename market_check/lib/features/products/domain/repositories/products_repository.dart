import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/products/data/models/product_model.dart';

import 'package:dartz/dartz.dart';
import 'package:market_check/features/products/data/models/scanner_data_model.dart';

abstract class ProductsRepository {
  Future<Either<RemoteFailure, List<ProductModel>>> getStoreProducts(
      int storeId);

  Future<Either<RemoteFailure, ProductModel?>> getStoreProductByScanner(
      ScannerDataModel scannerData);
}
