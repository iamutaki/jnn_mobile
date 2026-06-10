import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/network_providers.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_datasource.dart';
import '../repositories/user_repository_impl.dart';

part 'user_data_providers.g.dart';

@Riverpod(keepAlive: true)
UserRemoteDatasource userRemoteDatasource(Ref ref) {
  return UserRemoteDatasource(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  return UserRepositoryImpl(
    ref.watch(userRemoteDatasourceProvider),
  );
}
