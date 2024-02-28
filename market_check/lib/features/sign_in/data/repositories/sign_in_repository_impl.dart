import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/shared/models/create_user_data_model.dart';
import 'package:market_check/features/sign_in/data/models/sign_in_data_model.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';
import 'package:market_check/features/sign_in/data/datasources/sign_in_data_source.dart';
import 'package:market_check/features/sign_in/domain/repositories/sign_in_repsitory.dart';

import 'package:dartz/dartz.dart';

class SignInRepositoryImpl extends SignInRepostory {
  final SignInDataSource signInDataSource;

  SignInRepositoryImpl({required this.signInDataSource});

  @override
  Future<Either<RemoteFailure, PurchaseModel?>> verifyCurrentSession() async {
    try {
      return Right(
        await signInDataSource.verifyCurrentSession(),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(message: e.message, type: e.type),
      );
    }
  }

  @override
  Future<Either<RemoteFailure, PurchaseModel?>> verifyLogIn(
      SignInDataModel signInData) async {
    try {
      return Right(
        await signInDataSource.verifyLogIn(signInData),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(message: e.message, type: e.type),
      );
    }
  }

  @override
  Future<Either<RemoteFailure, String>> signUp(SignUpDataModel newUser) async {
    try {
      return Right(
        await signInDataSource.signUp(newUser),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(message: e.message, type: e.type),
      );
    }
  }

  @override
  Future<Either<RemoteFailure, bool>> signOut() async {
    try {
      return Right(await signInDataSource.signOut());
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(message: e.message, type: ExceptionType.signInException),
      );
    }
  }
}
