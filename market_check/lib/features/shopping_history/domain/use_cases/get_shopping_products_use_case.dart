import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/shopping_history/data/models/registered_purchase_item.dart';
import 'package:market_check/features/shopping_history/domain/repositories/shopping_history_repository.dart';

import 'package:dartz/dartz.dart';

class GetShoppingProductsUseCase
    extends UseCase<List<RegisteredPurchaseItemModel>, int> {
  final ShoppingHistoryRepository shoppingHistoryRepository;

  GetShoppingProductsUseCase({required this.shoppingHistoryRepository});

  @override
  Future<Either<RemoteFailure, List<RegisteredPurchaseItemModel>>> call(
      int params) async {
    return shoppingHistoryRepository.getShoppingProducts(params);
  }
}
