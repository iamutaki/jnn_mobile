import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/network_providers.dart';
import '../../domain/repositories/sub_district_repository.dart';
import '../datasources/sub_district_remote_datasource.dart';
import '../repositories/sub_district_repository_impl.dart';

part 'sub_district_data_providers.g.dart';

@riverpod
SubDistrictRemoteDatasource subDistrictRemoteDatasource(Ref ref) {
  return SubDistrictRemoteDatasource(ref.watch(dioProvider));
}

@riverpod
SubDistrictRepository subDistrictRepository(Ref ref) {
  return SubDistrictRepositoryImpl(
    ref.watch(subDistrictRemoteDatasourceProvider),
  );
}
