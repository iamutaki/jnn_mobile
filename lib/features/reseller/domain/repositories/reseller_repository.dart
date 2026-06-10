import 'package:fpdart/fpdart.dart';

import '../failures/reseller_failure.dart';
import '../../data/models/reseller_dto.dart';

abstract interface class ResellerRepository {
  Future<Either<ResellerFailure, List<ResellerDto>>> getResellers();
  Future<Either<ResellerFailure, Unit>> createReseller(
    String name,
    String username,
    String? password,
    String? phone,
    String? avatar,
    String? venuePhoto,
    String? subDistrictId,
    int? commissionRate,
    int? commissionAmount,
    double? lat,
    double? lng,
  );
  Future<Either<ResellerFailure, Unit>> updateReseller(
    String id,
    String name,
    String username,
    String? password,
    String? phone,
    String? avatar,
    String? venuePhoto,
    String? subDistrictId,
    int? commissionRate,
    int? commissionAmount,
    double? lat,
    double? lng,
  );
  Future<Either<ResellerFailure, ResellerDto>> getReseller(String id);
  Future<Either<ResellerFailure, Unit>> deleteReseller(String id);
}
