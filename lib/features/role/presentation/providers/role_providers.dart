import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/role_dto.dart';
import '../../data/providers/role_data_providers.dart';

part 'role_providers.g.dart';

@Riverpod(keepAlive: true)
class RoleListNotifier extends _$RoleListNotifier {
  @override
  Future<List<RoleDto>> build() {
    return _fetch();
  }

  Future<List<RoleDto>> _fetch() async {
    final repo = ref.read(roleRemoteDatasourceProvider);
    final response = await repo.getRoles();
    return response.data ?? [];
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    try {
      final list = await _fetch();
      state = AsyncData(list);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
