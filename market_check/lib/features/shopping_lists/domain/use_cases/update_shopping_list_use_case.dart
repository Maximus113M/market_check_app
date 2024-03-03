import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';
import 'package:market_check/features/shopping_lists/domain/repositories/shopping_lists_repository.dart';

import 'package:dartz/dartz.dart';

class UpdateShoppingListUseCase
    extends UseCase<ShoppingListsModel, ShoppingListsModel> {
  final ShoppingListsRepository shoppingListsRepository;

  UpdateShoppingListUseCase({required this.shoppingListsRepository});

  @override
  Future<Either<RemoteFailure, ShoppingListsModel>> call(
      ShoppingListsModel params) async {
    return await shoppingListsRepository.updateShoppingList(params);
  }
}
