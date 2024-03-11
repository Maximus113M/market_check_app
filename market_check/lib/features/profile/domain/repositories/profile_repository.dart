import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/config/shared/models/create_user_data_model.dart';

import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<RemoteFailure, void>> updatePasword(String password);
  Future<Either<RemoteFailure, String>> deleteAccount();
  Future<Either<RemoteFailure, String>> updateAccountData(
      SignUpDataModel updatedData);
  Future<Either<RemoteFailure, List<StoreModel>>> getStoresVisited();
}
