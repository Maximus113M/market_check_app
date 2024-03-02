import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';
import 'package:market_check/features/shopping_lists/domain/repositories/shopping_lists_repository.dart';

class ShoppingListsUseCase extends UseCase<ShoppingListsModel, ShoppingListsModel> {
  final ShoppingListsRepository shoppingListsRepository;

  ShoppingListsUseCase({required this.shoppingListsRepository});

  @override
  Future<Either<RemoteFailure, ShoppingListsModel>> call(ShoppingListsModel params) async {
    return await shoppingListsRepository.createShoppingList(params);
  }
}

