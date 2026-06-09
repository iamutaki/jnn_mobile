import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/network_providers.dart';
import '../../domain/repositories/district_repository.dart';
import '../datasources/district_remote_datasource.dart';
import '../repositories/district_repository_impl.dart';

part 'district_data_providers.g.dart';

@riverpod
DistrictRemoteDatasource districtRemoteDatasource(Ref ref) {
  return DistrictRemoteDatasource(ref.watch(dioProvider));
}

@riverpod
DistrictRepository districtRepository(Ref ref) {
  return DistrictRepositoryImpl(
    ref.watch(districtRemoteDatasourceProvider),
  );
}
