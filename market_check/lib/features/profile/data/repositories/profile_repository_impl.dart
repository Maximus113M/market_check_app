import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/shared/models/create_user_data_model.dart';
import 'package:market_check/features/profile/data/datasources/profile_data_source.dart';
import 'package:market_check/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDataSource profileDataSource;

  ProfileRepositoryImpl({required this.profileDataSource});

  @override
  Future<Either<RemoteFailure, String>> deleteAccount() async {
    try {
      return Right(
        await profileDataSource.deleteAccount(),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
            message: e.message, type: ExceptionType.categoriesException),
      );
    }
  }

  @override
  Future<Either<RemoteFailure, String>> updateAccountData(
      SignUpDataModel updatedData) async {
    try {
      return Right(
        await profileDataSource.updateAccountData(updatedData),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
            message: e.message, type: ExceptionType.categoriesException),
      );
    }
  }

  @override
  Future<Either<RemoteFailure, bool>> updatePasword(String password) async {
    try {
      return Right(
        await profileDataSource.updatePasword(password),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
            message: e.message, type: ExceptionType.categoriesException),
      );
    }
  }
}
