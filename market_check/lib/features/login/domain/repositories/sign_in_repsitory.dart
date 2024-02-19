import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/login/data/models/sign_in_data_model.dart';
import 'package:market_check/config/shared/models/create_user_data_model.dart';

abstract class SignInRepostory {
  Future<Either<RemoteFailure, bool>> verifyCurrentSession();
  Future<Either<RemoteFailure, bool>> verifyLogIn(SignInDataModel signInData);
  Future<Either<RemoteFailure, String>> signUp(SignUpDataModel newUser);
  Future<Either<RemoteFailure, bool>> signOut();
}
