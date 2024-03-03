import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';

abstract class ShoppingListsRepository {
  Future<Either<RemoteFailure, List<ShoppingListsModel>>> getShoppingList();
  Future<Either<RemoteFailure, ShoppingListsModel>> createShoppingList(
      ShoppingListsModel newList);
  Future<Either<RemoteFailure, ShoppingListsModel>> updateShoppingList(
      ShoppingListsModel newList);
  Future<Either<RemoteFailure, void>> deleteShoppingList(int id);
}