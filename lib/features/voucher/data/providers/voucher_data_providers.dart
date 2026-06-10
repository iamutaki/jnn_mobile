import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/network_providers.dart';
import '../../domain/repositories/voucher_repository.dart';
import '../datasources/voucher_remote_datasource.dart';
import '../repositories/voucher_repository_impl.dart';

part 'voucher_data_providers.g.dart';

@riverpod
VoucherRemoteDatasource voucherRemoteDatasource(Ref ref) {
  return VoucherRemoteDatasource(ref.watch(dioProvider));
}

@riverpod
VoucherRepository voucherRepository(Ref ref) {
  return VoucherRepositoryImpl(
    ref.watch(voucherRemoteDatasourceProvider),
  );
}
