import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/sign_in/data/models/sign_in_data_model.dart';
import 'package:market_check/features/sign_in/domain/repositories/sign_in_repsitory.dart';

import 'package:dartz/dartz.dart';

class VerifyLogInUseCase extends UseCase<bool, SignInDataModel> {
  final SignInRepostory signInRepostory;

  VerifyLogInUseCase({required this.signInRepostory});

  @override
  Future<Either<RemoteFailure, bool>> call(SignInDataModel params) async {
    return await signInRepostory.verifyLogIn(params);
  }
}
