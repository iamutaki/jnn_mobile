import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/network_providers.dart';
import '../datasources/role_remote_datasource.dart';

part 'role_data_providers.g.dart';

@Riverpod(keepAlive: true)
RoleRemoteDatasource roleRemoteDatasource(Ref ref) {
  return RoleRemoteDatasource(ref.watch(dioProvider));
}
