import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/products/data/datasources/products_data_source.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/products/data/models/products_by_category_model.dart';
import 'package:market_check/features/products/data/models/scanner_data_model.dart';
import 'package:market_check/features/products/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsDataSource productsDataSource;

  ProductsRepositoryImpl({required this.productsDataSource});
  @override
  Future<Either<RemoteFailure, List<ProductModel>>> getStoreProducts(
      int storeId) async {
    try {
      return Right(
        await productsDataSource.getStoreProducts(storeId),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
            message: e.message, type: ExceptionType.productsException),
      );
    }
  }

  @override
  Future<Either<RemoteFailure, ProductModel?>> getStoreProductByScanner(
      ScannerDataModel scannerData) async {
    try {
      return Right(
        await productsDataSource.getStoreProductByScanner(scannerData),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
            message: e.message, type: ExceptionType.productsException),
      );
    }
  }
  
  @override
  Future<Either<RemoteFailure, List<ProductModel>>> getProductsByCategorie(ProductsByCategoriesModel categoriesData) async{
    try {
      return Right(
        await productsDataSource.getProductsByCategorie(categoriesData)
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(message: e.message, type: ExceptionType.productsException)
      );
    }
  }

  
}
