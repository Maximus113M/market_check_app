import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/login/data/models/sign_in_data_model.dart';
import 'package:market_check/features/login/domain/repositories/sign_in_repsitory.dart';

class VerifyLogInUseCase extends UseCase<bool, SignInDataModel>{
  final SignInRepostory signInRepostory;

  VerifyLogInUseCase({required this.signInRepostory});

  @override
  Future<Either<RemoteFailure, bool>> call(SignInDataModel params) async{
    return await signInRepostory.verifyLogIn(params);
  }

}