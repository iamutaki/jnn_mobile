import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/exceptions/api_exception.dart';
import '../../data/models/user_dto.dart';
import '../../data/providers/user_data_providers.dart';

part 'user_providers.g.dart';

@Riverpod(keepAlive: true)
class UserListNotifier extends _$UserListNotifier {
  @override
  Future<List<UserDto>> build() {
    return _fetch();
  }

  Future<List<UserDto>> _fetch() async {
    final repo = ref.read(userRepositoryProvider);
    final result = await repo.getUsers();
    return result.fold(
      (failure) => throw ApiException(failure.message, statusCode: failure.statusCode),
      (list) => list,
    );
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

  Future<void> create({
    required String name,
    required String username,
    String? password,
    String? phone,
    String? email,
    String? avatar,
    required List<String> roleIds,
  }) async {
    final repo = ref.read(userRepositoryProvider);
    final result = await repo.createUser(
      name: name,
      username: username,
      password: password,
      phone: phone,
      email: email,
      avatar: avatar,
      roleIds: roleIds,
    );
    result.fold(
      (failure) => throw ApiException(failure.message, statusCode: failure.statusCode),
      (_) {},
    );
    state = const AsyncLoading();
    try {
      final list = await _fetch();
      state = AsyncData(list);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> edit({
    required String id,
    required String name,
    required String username,
    String? password,
    String? phone,
    String? email,
    String? avatar,
    required List<String> roleIds,
  }) async {
    final repo = ref.read(userRepositoryProvider);
    final result = await repo.updateUser(
      id: id,
      name: name,
      username: username,
      password: password,
      phone: phone,
      email: email,
      avatar: avatar,
      roleIds: roleIds,
    );
    result.fold(
      (failure) => throw ApiException(failure.message, statusCode: failure.statusCode),
      (_) {},
    );
    state = const AsyncLoading();
    try {
      final list = await _fetch();
      state = AsyncData(list);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> delete(String id) async {
    final repo = ref.read(userRepositoryProvider);
    final result = await repo.deleteUser(id);

    result.fold(
      (failure) => throw ApiException(failure.message, statusCode: failure.statusCode),
      (_) {
        final current = state.asData?.value ?? [];
        state = AsyncData(current.where((r) => r.id != id).toList());
      },
    );
  }
}
