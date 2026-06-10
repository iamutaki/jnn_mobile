import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/district_dto.dart';
import '../../data/providers/district_data_providers.dart';

part 'district_providers.g.dart';

@Riverpod(keepAlive: true)
class DistrictListNotifier extends _$DistrictListNotifier {
  @override
  Future<List<DistrictDto>> build() {
    return _fetch();
  }

  Future<List<DistrictDto>> _fetch() async {
    final repo = ref.read(districtRepositoryProvider);
    final result = await repo.getDistricts();
    return result.fold(
      (failure) => throw Exception(failure.message),
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

  Future<void> create(String name) async {
    final repo = ref.read(districtRepositoryProvider);
    final result = await repo.createDistrict(name);
    result.fold(
      (failure) => throw Exception(failure.message),
      (_) {},
    );
    // Set loading lalu fetch ulang.
    state = const AsyncLoading();
    try {
      final list = await _fetch();
      state = AsyncData(list);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> edit(String id, String name) async {
    final repo = ref.read(districtRepositoryProvider);
    final result = await repo.updateDistrict(id, name);
    result.fold(
      (failure) => throw Exception(failure.message),
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
    final repo = ref.read(districtRepositoryProvider);
    final result = await repo.deleteDistrict(id);
    result.fold(
      (failure) => throw Exception(failure.message),
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
}
