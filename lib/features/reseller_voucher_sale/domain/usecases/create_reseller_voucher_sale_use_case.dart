import 'package:fpdart/fpdart.dart';

import '../../data/models/reseller_voucher_sale_request.dart';
import '../failures/reseller_voucher_sale_failure.dart';
import '../repositories/reseller_voucher_sale_repository.dart';

class CreateResellerVoucherSaleUseCase {
  const CreateResellerVoucherSaleUseCase(this._repository);

  final ResellerVoucherSaleRepository _repository;

  Future<Either<ResellerVoucherSaleFailure, String>> call(
    ResellerVoucherSaleRequest request,
  ) {
    return _repository.create(request);
  }
}
