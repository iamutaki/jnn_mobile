import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/providers/digital_voucher_data_providers.dart';
import '../usecases/create_bulk_digital_voucher_use_case.dart';
import '../usecases/get_digital_voucher_use_case.dart';
import '../usecases/get_import_history_use_case.dart';

part 'digital_voucher_domain_providers.g.dart';

@riverpod
CreateBulkDigitalVoucherUseCase createBulkDigitalVoucherUseCase(Ref ref) {
  return CreateBulkDigitalVoucherUseCase(
    ref.watch(digitalVoucherRepositoryProvider),
  );
}

@riverpod
GetImportHistoryUseCase getImportHistoryUseCase(Ref ref) {
  return GetImportHistoryUseCase(
    ref.watch(digitalVoucherRepositoryProvider),
  );
}

@riverpod
GetDigitalVoucherUseCase getDigitalVoucherUseCase(Ref ref) {
  return GetDigitalVoucherUseCase(
    ref.watch(digitalVoucherRepositoryProvider),
  );
}
