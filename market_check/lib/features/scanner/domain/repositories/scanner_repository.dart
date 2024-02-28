import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/scanner/data/models/scanner_data_model.dart';

import 'package:dartz/dartz.dart';

abstract class ScannerRepository {
  Future<Either<RemoteFailure, ProductModel?>> getStoreProductByScanner(
      ScannerDataModel scannerData);
}
