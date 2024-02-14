import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/purchases/data/models/registered_purchase_item.dart';
import 'package:market_check/features/purchases/domain/repositories/purchases_repository.dart';

import 'package:dartz/dartz.dart';

class GetPurchaseProductsUseCase
    extends UseCase<List<RegisteredPurchaseItemModel>, int> {
  final PurchasesRepository purchasesRepository;

  GetPurchaseProductsUseCase({required this.purchasesRepository});

  @override
  Future<Either<Failure, List<RegisteredPurchaseItemModel>>> call(
      int params) async {
    return purchasesRepository.getPurchaseProducts(params);
  }
}
