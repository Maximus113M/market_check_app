import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';
import 'package:market_check/features/shopping_history/domain/repositories/shopping_history_repository.dart';

class GetShoppinHistoryUseCase extends UseCase<List<PurchaseModel>, NoParams>{
  final ShoppingHistoryRepository shoppingHistoryRepository;

  GetShoppinHistoryUseCase({required this.shoppingHistoryRepository});

  @override
  Future<Either<Failure, List<PurchaseModel>>> call(params) async{
    return await shoppingHistoryRepository.getShoppingHistory();
  }
}