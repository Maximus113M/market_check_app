import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/scanner/data/models/scanner_data_model.dart';
import 'package:market_check/features/scanner/domain/repositories/scanner_repository.dart';

import 'package:dartz/dartz.dart';

class GetStoreProductByScannerUseCase
    extends UseCase<ProductModel?, ScannerDataModel> {
  final ScannerRepository scannerRepository;

  GetStoreProductByScannerUseCase({required this.scannerRepository});
  @override
  Future<Either<RemoteFailure, ProductModel?>> call(
      ScannerDataModel params) async {
    return await scannerRepository.getStoreProductByScanner(params);
  }
}
