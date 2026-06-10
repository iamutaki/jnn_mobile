import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/network_providers.dart';
import '../../domain/repositories/sub_district_voucher_repository.dart';
import '../datasources/sub_district_voucher_remote_datasource.dart';
import '../repositories/sub_district_voucher_repository_impl.dart';

part 'sub_district_voucher_data_providers.g.dart';

@riverpod
SubDistrictVoucherRemoteDatasource subDistrictVoucherRemoteDatasource(
  Ref ref,
) {
  return SubDistrictVoucherRemoteDatasource(ref.watch(dioProvider));
}

@riverpod
SubDistrictVoucherRepository subDistrictVoucherRepository(Ref ref) {
  return SubDistrictVoucherRepositoryImpl(
    ref.watch(subDistrictVoucherRemoteDatasourceProvider),
  );
}
