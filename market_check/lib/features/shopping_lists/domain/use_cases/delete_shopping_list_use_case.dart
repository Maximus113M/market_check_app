import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/shopping_lists/domain/repositories/shopping_lists_repository.dart';

import 'package:dartz/dartz.dart';

class DeleteShoppingListUseCase extends UseCase<void, int> {
  final ShoppingListsRepository shoppingListsRepository;

  DeleteShoppingListUseCase({required this.shoppingListsRepository});

  @override
  Future<Either<RemoteFailure, void>> call(int params) async {
    return await shoppingListsRepository.deleteShoppingList(params);
  }
}
