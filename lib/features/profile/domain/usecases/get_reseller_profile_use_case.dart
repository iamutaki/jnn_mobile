import 'package:fpdart/fpdart.dart';

import '../failures/profile_failure.dart';
import '../repositories/profile_repository.dart';
import '../../data/models/reseller_profile_dto.dart';

class GetResellerProfileUseCase {
  const GetResellerProfileUseCase(this._repository);

  final ProfileRepository _repository;

  Future<Either<ProfileFailure, ResellerProfileDto>> call() {
    return _repository.getResellerProfile();
  }
}
