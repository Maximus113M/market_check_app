import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/profile_cards/data/models/purchase_model.dart';
import 'package:market_check/features/profile_cards/data/models/registered_purchase_item.dart';
import 'package:market_check/features/profile_cards/data/datasources/profile_cards_data_source.dart';
import 'package:market_check/features/profile_cards/domain/repositories/shopping_history_repository.dart';

import 'package:dartz/dartz.dart';

class ProfileCardsRepositoryImpl extends ProfileCardsRepository {
  final ProfileCardsDataSource profileCardsDataSource;

  ProfileCardsRepositoryImpl({required this.profileCardsDataSource});

  @override
  Future<Either<RemoteFailure, List<PurchaseModel>>>
      getShoppingHistory() async {
    try {
      return Right(
        await profileCardsDataSource.getShoppingHistory(),
      );
    } on RemoteException catch (e) {
      return Left(RemoteFailure(
        message: e.message,
        type: ExceptionType.profileCards,
      ));
    }
  }

  @override
  Future<Either<RemoteFailure, List<RegisteredPurchaseItemModel>>>
      getShoppingProducts(int purchaseId) async {
    try {
      return Right(
        await profileCardsDataSource.getShoppingProducts(purchaseId),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
          message: e.message,
          type: ExceptionType.profileCards,
        ),
      );
    }
  }

  @override
  Future<Either<RemoteFailure, List<StoreModel>>> getStoresVisited() async {
    try {
      return Right(
        await profileCardsDataSource.getStoresVisited(),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
          message: e.message,
          type: ExceptionType.profileCards,
        ),
      );
    }
  }

  @override
  Future<Either<RemoteFailure, List<ProductModel>>> getFavoriteProducts(
      int userId) async {
    try {
      return Right(
        await profileCardsDataSource.getFavoriteProducts(userId),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
          message: e.message,
          type: ExceptionType.profileCards,
        ),
      );
    }
  }
}
