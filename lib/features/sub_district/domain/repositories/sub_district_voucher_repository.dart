import 'package:fpdart/fpdart.dart';

import '../failures/sub_district_voucher_failure.dart';
import '../../../voucher/data/models/voucher_dto.dart';

abstract interface class SubDistrictVoucherRepository {
  Future<Either<SubDistrictVoucherFailure, List<VoucherDto>>>
      getSubDistrictVouchers(String subDistrictId);
  Future<Either<SubDistrictVoucherFailure, Unit>> replaceSubDistrictVouchers(
    String subDistrictId,
    List<String> voucherIds,
  );
}
