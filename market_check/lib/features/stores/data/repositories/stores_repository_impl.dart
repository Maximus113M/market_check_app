import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/features/stores/data/models/offer_model.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/stores/data/datasources/stores_datasource.dart';
import 'package:market_check/features/stores/domain/repositories/store_repository.dart';

import 'package:dartz/dartz.dart';

class StoresRepositoryImpl extends StoresRepository {
  final StoresDataSource storesDatasource;

  StoresRepositoryImpl({required this.storesDatasource});

  @override
  Future<Either<RemoteFailure, List<StoreModel>>> getStores() async {
    try {
      return Right(
        await storesDatasource.getStores(),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
          message: e.message,
          type: ExceptionType.stores,
        ),
      );
    }
  }

  @override
  Future<Either<RemoteFailure, List<OfferModel>>> getOffers(int storeId) async {
    try {
      return Right(
        await storesDatasource.getOffersByStore(storeId),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
          message: e.message,
          type: ExceptionType.offers,
        ),
      );
    }
  }

  @override
  Future<Either<RemoteFailure, List<ProductModel>>> getOfferProducts(int offerId) async{
    try {
      return Right(
        await storesDatasource.getOfferProducts(offerId),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
          message: e.message,
          type: ExceptionType.offers,
        ),
      );
    }
  }
}
