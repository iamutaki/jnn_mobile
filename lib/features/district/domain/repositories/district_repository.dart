import 'package:fpdart/fpdart.dart';

import '../failures/district_failure.dart';
import '../../data/models/district_dto.dart';

abstract interface class DistrictRepository {
  Future<Either<DistrictFailure, List<DistrictDto>>> getDistricts();
  Future<Either<DistrictFailure, DistrictDto>> createDistrict(String name);
  Future<Either<DistrictFailure, DistrictDto>> updateDistrict(
    String id,
    String name,
  );
  Future<Either<DistrictFailure, Unit>> deleteDistrict(String id);
}
