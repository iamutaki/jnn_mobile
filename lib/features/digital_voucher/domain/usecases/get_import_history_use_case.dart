import 'package:fpdart/fpdart.dart';

import '../../../../core/models/paginated_result.dart';
import '../failures/digital_voucher_failure.dart';
import '../repositories/digital_voucher_repository.dart';
import '../../data/models/digital_voucher_import_dto.dart';

class GetImportHistoryUseCase {
  const GetImportHistoryUseCase(this._repository);

  final DigitalVoucherRepository _repository;

  Future<Either<DigitalVoucherFailure, PaginatedResult<DigitalVoucherImportDto>>>
      call(String? cursor) {
    return _repository.getImportHistory(cursor);
  }
}
