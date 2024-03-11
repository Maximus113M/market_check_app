import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/profile_cards/data/models/purchase_model.dart';
import 'package:market_check/features/pending_purchases/domain/repositories/pending_purchases_repository.dart';

import 'package:dartz/dartz.dart';

class GetOpenPurchasesUseCase
    extends UseCase<PurchaseModel?, NoParams> {
  final PendingPurchasesRepository pendingPurchasesRepository;

  GetOpenPurchasesUseCase({required this.pendingPurchasesRepository});
  @override
  Future<Either<RemoteFailure, PurchaseModel?>> call(NoParams params) async {
    return await pendingPurchasesRepository.getOpenPurchase();
  }
}
