import 'package:fpdart/fpdart.dart';

import '../failures/profile_failure.dart';
import '../../data/models/profile_dto.dart';

abstract interface class ProfileRepository {
  Future<Either<ProfileFailure, ProfileDto>> getProfile();
}
