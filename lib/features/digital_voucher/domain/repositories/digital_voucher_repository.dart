import 'package:fpdart/fpdart.dart';

import '../../../../core/models/paginated_result.dart';
import '../failures/digital_voucher_failure.dart';
import '../../data/models/digital_voucher_dto.dart';
import '../../data/models/digital_voucher_import_dto.dart';
import '../../data/models/digital_voucher_request.dart';

abstract interface class DigitalVoucherRepository {
  Future<Either<DigitalVoucherFailure, Unit>> createBulk(
    DigitalVoucherBulkRequest request,
  );

  Future<Either<DigitalVoucherFailure, PaginatedResult<DigitalVoucherImportDto>>>
      getImportHistory(String? cursor);

  Future<Either<DigitalVoucherFailure, DigitalVoucherDto>> getById(String id);
}
