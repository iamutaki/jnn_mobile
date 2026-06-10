import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/reseller_dto.dart';
import '../../data/providers/reseller_data_providers.dart';

part 'reseller_providers.g.dart';

@Riverpod(keepAlive: true)
class ResellerListNotifier extends _$ResellerListNotifier {
  @override
  Future<List<ResellerDto>> build() {
    return _fetch();
  }

  Future<List<ResellerDto>> _fetch() async {
    final repo = ref.read(resellerRepositoryProvider);
    final result = await repo.getResellers();
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

  Future<void> create({
    required String name,
    required String username,
    String? password,
    String? phone,
    String? avatar,
    String? venuePhoto,
    String? subDistrictId,
    int? commissionRate,
    int? commissionAmount,
    double? lat,
    double? lng,
  }) async {
    final repo = ref.read(resellerRepositoryProvider);
    final result = await repo.createReseller(
      name,
      username,
      password,
      phone,
      avatar,
      venuePhoto,
      subDistrictId,
      commissionRate,
      commissionAmount,
      lat,
      lng,
    );
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

  Future<void> edit({
    required String id,
    required String name,
    required String username,
    String? password,
    String? phone,
    String? avatar,
    String? venuePhoto,
    String? subDistrictId,
    int? commissionRate,
    int? commissionAmount,
    double? lat,
    double? lng,
  }) async {
    final repo = ref.read(resellerRepositoryProvider);
    final result = await repo.updateReseller(
      id,
      name,
      username,
      password,
      phone,
      avatar,
      venuePhoto,
      subDistrictId,
      commissionRate,
      commissionAmount,
      lat,
      lng,
    );
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

  Future<ResellerDto> getResellerById(String id) async {
    final repo = ref.read(resellerRepositoryProvider);
    final result = await repo.getReseller(id);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (reseller) => reseller,
    );
  }

  Future<void> delete(String id) async {
    final repo = ref.read(resellerRepositoryProvider);
    final result = await repo.deleteReseller(id);

    result.fold(
      (failure) => throw Exception(failure.message),
      (_) {
        final current = state.asData?.value ?? [];
        state = AsyncData(current.where((r) => r.user.id != id).toList());
      },
    );
  }
}
