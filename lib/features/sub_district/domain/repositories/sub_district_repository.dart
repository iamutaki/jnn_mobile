import 'package:fpdart/fpdart.dart';

import '../failures/sub_district_failure.dart';
import '../../data/models/sub_district_dto.dart';

abstract interface class SubDistrictRepository {
  Future<Either<SubDistrictFailure, List<SubDistrictDto>>> getSubDistricts();
  Future<Either<SubDistrictFailure, Unit>> createSubDistrict(
    String districtId,
    String name,
  );
  Future<Either<SubDistrictFailure, Unit>> updateSubDistrict(
    String id,
    String districtId,
    String name,
  );
  Future<Either<SubDistrictFailure, Unit>> deleteSubDistrict(String id);
}
