import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/profile_cards/data/models/purchase_model.dart';
import 'package:market_check/features/sign_in/domain/repositories/sign_in_repsitory.dart';

import 'package:dartz/dartz.dart';

class VerifyCurrentSessionUseCase extends UseCase<PurchaseModel?, NoParams> {
  final SignInRepostory signInRepostory;

  VerifyCurrentSessionUseCase({required this.signInRepostory});

  @override
  Future<Either<RemoteFailure, PurchaseModel?>> call(NoParams params) async {
    return await signInRepostory.verifyCurrentSession();
  }
}
