import 'package:fpdart/fpdart.dart';

import '../../data/models/reseller_voucher_sale_detail_dto.dart';
import '../failures/reseller_voucher_sale_failure.dart';
import '../repositories/reseller_voucher_sale_repository.dart';

class GetResellerVoucherSaleDetailUseCase {
  const GetResellerVoucherSaleDetailUseCase(this._repository);

  final ResellerVoucherSaleRepository _repository;

  Future<Either<ResellerVoucherSaleFailure, ResellerVoucherSaleDetailDto>>
      call(String id) {
    return _repository.getById(id);
  }
}
