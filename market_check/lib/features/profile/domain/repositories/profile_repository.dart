import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/shared/models/create_user_data_model.dart';

abstract class ProfileRepository {
  Future<Either<RemoteFailure, bool>> updatePasword(String password);
  Future<Either<RemoteFailure, String>> deleteAccount();
  Future<Either<RemoteFailure, String>> updateAccountData(
      SignUpDataModel updatedData);
}
