import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/scanner/data/models/scanner_data_model.dart';
import 'package:market_check/features/scanner/data/datasources/scanner_data_source.dart';
import 'package:market_check/features/scanner/domain/repositories/scanner_repository.dart';

import 'package:dartz/dartz.dart';

class ScannerRepositoryImpl extends ScannerRepository {
  final ScannerDataSource scannerDataSource;

  ScannerRepositoryImpl({required this.scannerDataSource});

  @override
  Future<Either<RemoteFailure, ProductModel?>> getStoreProductByScanner(
      ScannerDataModel scannerData) async {
    try {
      return Right(
        await scannerDataSource.getStoreProductByScanner(scannerData),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
          message: e.message,
          type: ExceptionType.scanner,
        ),
      );
    }
  }
}
