import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';
import 'package:market_check/features/shopping_lists/domain/repositories/shopping_lists_repository.dart';

import 'package:dartz/dartz.dart';

class GetShoppingListsUseCase
    extends UseCase<List<ShoppingListsModel>, NoParams> {
  final ShoppingListsRepository shoppingListsRepository;

  GetShoppingListsUseCase({required this.shoppingListsRepository});

  @override
  Future<Either<RemoteFailure, List<ShoppingListsModel>>> call(
      NoParams params) async {
    return await shoppingListsRepository.getShoppingList();
  }
}
