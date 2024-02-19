import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/config/shared/models/create_user_data_model.dart';
import 'package:market_check/features/login/domain/repositories/sign_in_repsitory.dart';

import 'package:dartz/dartz.dart';

class SignUpUseCase extends UseCase<String, SignUpDataModel> {
  final SignInRepostory signInRepostory;

  SignUpUseCase({required this.signInRepostory});
  
  @override
  Future<Either<RemoteFailure, String>> call(SignUpDataModel params) async{
    return await signInRepostory.signUp(params);
  }

  
}
