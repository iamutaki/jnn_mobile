import 'package:fpdart/fpdart.dart';

import '../failures/profile_failure.dart';
import '../repositories/profile_repository.dart';
import '../../data/models/profile_dto.dart';

class GetProfileUseCase {
  const GetProfileUseCase(this._repository);

  final ProfileRepository _repository;

  Future<Either<ProfileFailure, ProfileDto>> call() {
    return _repository.getProfile();
  }
}
