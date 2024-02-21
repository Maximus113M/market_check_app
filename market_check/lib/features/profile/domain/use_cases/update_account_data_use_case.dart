import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/shared/models/create_user_data_model.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/profile/domain/repositories/profile_repository.dart';

import 'package:dartz/dartz.dart';

class UpdateAccountDataUseCase extends UseCase<String, SignUpDataModel> {
  final ProfileRepository profileRepository;

  UpdateAccountDataUseCase({required this.profileRepository});

  @override
  Future<Either<RemoteFailure, String>> call(SignUpDataModel params) async {
    return await profileRepository.updateAccountData(params);
  }
}
