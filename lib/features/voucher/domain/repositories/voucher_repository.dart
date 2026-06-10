import 'package:fpdart/fpdart.dart';

import '../failures/voucher_failure.dart';
import '../../data/models/voucher_dto.dart';

abstract interface class VoucherRepository {
  Future<Either<VoucherFailure, List<VoucherDto>>> getVouchers();
  Future<Either<VoucherFailure, Unit>> createVoucher(
    String name,
    int price,
    String? description,
  );
  Future<Either<VoucherFailure, Unit>> updateVoucher(
    String id,
    String name,
    int price,
    String? description,
  );
  Future<Either<VoucherFailure, Unit>> deleteVoucher(String id);
}
