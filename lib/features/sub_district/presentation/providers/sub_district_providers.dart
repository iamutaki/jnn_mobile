import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/sub_district_dto.dart';
import '../../data/providers/sub_district_data_providers.dart';

part 'sub_district_providers.g.dart';

@Riverpod(keepAlive: true)
class SubDistrictListNotifier extends _$SubDistrictListNotifier {
  @override
  Future<List<SubDistrictDto>> build() {
    return _fetch();
  }

  Future<List<SubDistrictDto>> _fetch() async {
    final repo = ref.read(subDistrictRepositoryProvider);
    final result = await repo.getSubDistricts();
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

  Future<void> create(String districtId, String name) async {
    final repo = ref.read(subDistrictRepositoryProvider);
    final result = await repo.createSubDistrict(districtId, name);
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

  Future<void> edit(String id, String districtId, String name) async {
    final repo = ref.read(subDistrictRepositoryProvider);
    final result = await repo.updateSubDistrict(id, districtId, name);
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
    final repo = ref.read(subDistrictRepositoryProvider);
    final result = await repo.deleteSubDistrict(id);
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
