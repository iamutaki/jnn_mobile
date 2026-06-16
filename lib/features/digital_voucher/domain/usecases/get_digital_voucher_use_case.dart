import 'package:fpdart/fpdart.dart';

import '../../data/models/digital_voucher_dto.dart';
import '../failures/digital_voucher_failure.dart';
import '../repositories/digital_voucher_repository.dart';

class GetDigitalVoucherUseCase {
  const GetDigitalVoucherUseCase(this._repository);

  final DigitalVoucherRepository _repository;

  Future<Either<DigitalVoucherFailure, DigitalVoucherDto>> call(String id) {
    return _repository.getById(id);
  }
}
