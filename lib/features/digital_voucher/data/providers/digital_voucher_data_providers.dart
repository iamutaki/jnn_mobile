import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/network_providers.dart';
import '../../domain/repositories/digital_voucher_repository.dart';
import '../datasources/digital_voucher_remote_datasource.dart';
import '../repositories/digital_voucher_repository_impl.dart';

part 'digital_voucher_data_providers.g.dart';

@riverpod
DigitalVoucherRemoteDatasource digitalVoucherRemoteDatasource(Ref ref) {
  return DigitalVoucherRemoteDatasource(ref.watch(dioProvider));
}

@riverpod
DigitalVoucherRepository digitalVoucherRepository(Ref ref) {
  return DigitalVoucherRepositoryImpl(
    ref.watch(digitalVoucherRemoteDatasourceProvider),
  );
}
