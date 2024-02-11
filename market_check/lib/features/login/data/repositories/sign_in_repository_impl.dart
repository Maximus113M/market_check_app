import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/shared/models/user.dart';
import 'package:market_check/features/login/data/models/sign_in_data_model.dart';
import 'package:market_check/features/login/data/datasources/sign_in_data_source.dart';
import 'package:market_check/features/login/domain/repositories/sign_in_repsitory.dart';

import 'package:dartz/dartz.dart';

class SignInRepositoryImpl extends SignInRepostory {
  final SignInDataSource signInDataSource;

  SignInRepositoryImpl({required this.signInDataSource});
  
  @override
  Future<Either<RemoteFailure, bool>> verifyLogIn(
      SignInDataModel signInData) async {
    try {
      return Right(await signInDataSource.verifyLogIn(signInData));
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(message: e.message, type: ExceptionType.signInException),
      );
    }
  }

  @override
  Future<Either<RemoteFailure, String>> signUp(User newUser) async {
    try {
      return Right(await signInDataSource.signUp(newUser));
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(message: e.message, type: ExceptionType.signInException),
      );
    }
  }
}