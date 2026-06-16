import 'package:fpdart/fpdart.dart';

import '../failures/reseller_voucher_sale_failure.dart';
import '../repositories/reseller_voucher_sale_repository.dart';

class CompleteResellerVoucherSaleUseCase {
  const CompleteResellerVoucherSaleUseCase(this._repository);

  final ResellerVoucherSaleRepository _repository;

  Future<Either<ResellerVoucherSaleFailure, Unit>> call(String id) {
    return _repository.complete(id);
  }
}
