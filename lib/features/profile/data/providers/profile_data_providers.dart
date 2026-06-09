import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/network_providers.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';
import '../repositories/profile_repository_impl.dart';

part 'profile_data_providers.g.dart';

@riverpod
ProfileRemoteDatasource profileRemoteDatasource(Ref ref) {
  return ProfileRemoteDatasource(ref.watch(dioProvider));
}

@riverpod
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepositoryImpl(
    ref.watch(profileRemoteDatasourceProvider),
  );
}
