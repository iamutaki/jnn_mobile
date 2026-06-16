import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/network_providers.dart';
import '../../domain/repositories/reseller_voucher_sale_repository.dart';
import '../datasources/reseller_voucher_sale_remote_datasource.dart';
import '../repositories/reseller_voucher_sale_repository_impl.dart';

part 'reseller_voucher_sale_data_providers.g.dart';

@riverpod
ResellerVoucherSaleRemoteDatasource resellerVoucherSaleRemoteDatasource(
  Ref ref,
) {
  return ResellerVoucherSaleRemoteDatasource(ref.watch(dioProvider));
}

@riverpod
ResellerVoucherSaleRepository resellerVoucherSaleRepository(Ref ref) {
  return ResellerVoucherSaleRepositoryImpl(
    ref.watch(resellerVoucherSaleRemoteDatasourceProvider),
  );
}
