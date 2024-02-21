import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/profile/domain/repositories/profile_repository.dart';

import 'package:dartz/dartz.dart';

class UpdatePasswordUseCase extends UseCase<bool, String> {
  final ProfileRepository profileRepository;

  UpdatePasswordUseCase({required this.profileRepository});

  @override
  Future<Either<RemoteFailure, bool>> call(String params) async {
    return await profileRepository.updatePasword(params);
  }
}
