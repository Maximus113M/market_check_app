import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/shared/models/create_user_data_model.dart';
import 'package:market_check/features/sign_in/data/models/sign_in_data_model.dart';
import 'package:market_check/features/profile_cards/data/models/purchase_model.dart';

import 'package:dartz/dartz.dart';

abstract class SignInRepostory {
  Future<Either<RemoteFailure, PurchaseModel?>> verifyCurrentSession();
  Future<Either<RemoteFailure, PurchaseModel?>> verifyLogIn(
      SignInDataModel signInData);
  Future<Either<RemoteFailure, String>> signUp(SignUpDataModel newUser);
  Future<Either<RemoteFailure, bool>> signOut();
}
