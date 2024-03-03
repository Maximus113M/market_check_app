import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';
import 'package:market_check/features/shopping_lists/data/datasource/shopping_lists_datasource.dart';
import 'package:market_check/features/shopping_lists/domain/repositories/shopping_lists_repository.dart';

import 'package:dartz/dartz.dart';

class ShoppingListsRepositoryImpl extends ShoppingListsRepository {
  final ShoppingListsDatasorce shoppingListsDatasorce;

  ShoppingListsRepositoryImpl({required this.shoppingListsDatasorce});

  @override
  Future<Either<RemoteFailure, List<ShoppingListsModel>>>
      getShoppingList() async {
    try {
      return Right(
        await shoppingListsDatasorce.getShoppingLists(),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(message: e.message, type: e.type),
      );
    }
  }

  @override
  Future<Either<RemoteFailure, ShoppingListsModel>> createShoppingList(
      ShoppingListsModel newList) async {
    try {
      return Right(
        await shoppingListsDatasorce.createShoppingList(newList),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(message: e.message, type: e.type),
      );
    }
  }

  @override
  Future<Either<RemoteFailure, ShoppingListsModel>> updateShoppingList(
      ShoppingListsModel newList) async {
    try {
      return Right(
        await shoppingListsDatasorce.updateShoppingList(newList),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(message: e.message, type: e.type),
      );
    }
  }

  @override
  Future<Either<RemoteFailure, void>> deleteShoppingList(int id) async {
    try {
      return Right(
        await shoppingListsDatasorce.deleteShoppingList(id),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(message: e.message, type: e.type),
      );
    }
  }
}
