import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/network_providers.dart';
import '../../domain/repositories/reseller_repository.dart';
import '../datasources/reseller_remote_datasource.dart';
import '../repositories/reseller_repository_impl.dart';

part 'reseller_data_providers.g.dart';

@Riverpod(keepAlive: true)
ResellerRemoteDatasource resellerRemoteDatasource(Ref ref) {
  return ResellerRemoteDatasource(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
ResellerRepository resellerRepository(Ref ref) {
  return ResellerRepositoryImpl(
    ref.watch(resellerRemoteDatasourceProvider),
  );
}
