import 'package:fpdart/fpdart.dart';

import '../../../../core/models/paginated_result.dart';
import '../../data/models/reseller_voucher_sale_dto.dart';
import '../failures/reseller_voucher_sale_failure.dart';
import '../repositories/reseller_voucher_sale_repository.dart';

class GetResellerVoucherSaleHistoryUseCase {
  const GetResellerVoucherSaleHistoryUseCase(this._repository);

  final ResellerVoucherSaleRepository _repository;

  Future<
      Either<ResellerVoucherSaleFailure,
          PaginatedResult<ResellerVoucherSaleDto>>> call(String? cursor) {
    return _repository.getHistory(cursor);
  }
}
