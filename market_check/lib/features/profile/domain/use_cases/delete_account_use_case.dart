import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/profile/domain/repositories/profile_repository.dart';

import 'package:dartz/dartz.dart';

class DeleteAccountUseCase extends UseCase<String, NoParams> {
  final ProfileRepository profileRepository;
  DeleteAccountUseCase({required this.profileRepository});

  @override
  Future<Either<RemoteFailure, String>> call(NoParams params) async {
    return await profileRepository.deleteAccount();
  }
}
