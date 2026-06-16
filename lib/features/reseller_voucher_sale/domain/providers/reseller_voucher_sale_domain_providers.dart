import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/providers/reseller_voucher_sale_data_providers.dart';
import '../usecases/complete_reseller_voucher_sale_use_case.dart';
import '../usecases/create_reseller_voucher_sale_use_case.dart';
import '../usecases/get_reseller_voucher_sale_detail_use_case.dart';
import '../usecases/get_reseller_voucher_sale_history_use_case.dart';

part 'reseller_voucher_sale_domain_providers.g.dart';

@riverpod
CreateResellerVoucherSaleUseCase createResellerVoucherSaleUseCase(Ref ref) {
  return CreateResellerVoucherSaleUseCase(
    ref.watch(resellerVoucherSaleRepositoryProvider),
  );
}

@riverpod
GetResellerVoucherSaleHistoryUseCase getResellerVoucherSaleHistoryUseCase(
  Ref ref,
) {
  return GetResellerVoucherSaleHistoryUseCase(
    ref.watch(resellerVoucherSaleRepositoryProvider),
  );
}

@riverpod
GetResellerVoucherSaleDetailUseCase getResellerVoucherSaleDetailUseCase(
  Ref ref,
) {
  return GetResellerVoucherSaleDetailUseCase(
    ref.watch(resellerVoucherSaleRepositoryProvider),
  );
}

@riverpod
CompleteResellerVoucherSaleUseCase completeResellerVoucherSaleUseCase(
  Ref ref,
) {
  return CompleteResellerVoucherSaleUseCase(
    ref.watch(resellerVoucherSaleRepositoryProvider),
  );
}
