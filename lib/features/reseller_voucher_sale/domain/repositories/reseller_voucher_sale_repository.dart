import 'package:fpdart/fpdart.dart';

import '../../../../core/models/paginated_result.dart';
import '../../data/models/reseller_voucher_sale_detail_dto.dart';
import '../../data/models/reseller_voucher_sale_dto.dart';
import '../../data/models/reseller_voucher_sale_request.dart';
import '../failures/reseller_voucher_sale_failure.dart';

abstract interface class ResellerVoucherSaleRepository {
  Future<Either<ResellerVoucherSaleFailure, String>> create(
    ResellerVoucherSaleRequest request,
  );

  Future<Either<ResellerVoucherSaleFailure, ResellerVoucherSaleDetailDto>>
      getById(String id);

  Future<Either<ResellerVoucherSaleFailure, Unit>> complete(String id);

  Future<Either<ResellerVoucherSaleFailure, Unit>> cancel(String id);

  Future<Either<ResellerVoucherSaleFailure,
      PaginatedResult<ResellerVoucherSaleDto>>> getHistory(String? cursor);
}
