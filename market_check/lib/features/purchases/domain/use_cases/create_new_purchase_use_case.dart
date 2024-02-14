import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/purchases/data/models/purchase_item_model.dart';
import 'package:market_check/features/purchases/domain/repositories/purchases_repository.dart';

import 'package:dartz/dartz.dart';

class CreateNewPurchaseUseCase extends UseCase<bool, List<PurchaseItemModel>> {
  final PurchasesRepository purchasesRepository;

  CreateNewPurchaseUseCase({required this.purchasesRepository});

  @override
  Future<Either<RemoteFailure, bool>> call(params) async {
    return await purchasesRepository.createNewPurchase(params);
  }
}
