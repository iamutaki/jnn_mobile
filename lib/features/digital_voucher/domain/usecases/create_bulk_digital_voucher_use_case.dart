import 'package:fpdart/fpdart.dart';

import '../failures/digital_voucher_failure.dart';
import '../repositories/digital_voucher_repository.dart';
import '../../data/models/digital_voucher_request.dart';

class CreateBulkDigitalVoucherUseCase {
  const CreateBulkDigitalVoucherUseCase(this._repository);

  final DigitalVoucherRepository _repository;

  Future<Either<DigitalVoucherFailure, Unit>> call(
    DigitalVoucherBulkRequest request,
  ) {
    return _repository.createBulk(request);
  }
}
