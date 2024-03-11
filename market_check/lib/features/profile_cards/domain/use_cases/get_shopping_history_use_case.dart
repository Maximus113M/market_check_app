import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/profile_cards/data/models/purchase_model.dart';
import 'package:market_check/features/profile_cards/domain/repositories/shopping_history_repository.dart';

class GetShoppinHistoryUseCase extends UseCase<List<PurchaseModel>, NoParams> {
  final ProfileCardsRepository shoppingHistoryRepository;

  GetShoppinHistoryUseCase({required this.shoppingHistoryRepository});

  @override
  Future<Either<RemoteFailure, List<PurchaseModel>>> call(params) async {
    return await shoppingHistoryRepository.getShoppingHistory();
  }
}
