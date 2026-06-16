import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/exceptions/api_exception.dart';
import '../../data/models/voucher_dto.dart';
import '../../data/providers/voucher_data_providers.dart';

part 'voucher_providers.g.dart';

@Riverpod(keepAlive: true)
class VoucherListNotifier extends _$VoucherListNotifier {
  @override
  Future<List<VoucherDto>> build() {
    return _fetch();
  }

  Future<List<VoucherDto>> _fetch() async {
    final repo = ref.read(voucherRepositoryProvider);
    final result = await repo.getVouchers();
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

  Future<void> create(String name, int price, String? description) async {
    final repo = ref.read(voucherRepositoryProvider);
    final result = await repo.createVoucher(name, price, description);
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

  Future<void> edit(
    String id,
    String name,
    int price,
    String? description,
  ) async {
    final repo = ref.read(voucherRepositoryProvider);
    final result = await repo.updateVoucher(id, name, price, description);
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
    final repo = ref.read(voucherRepositoryProvider);
    final result = await repo.deleteVoucher(id);

    result.fold(
      (failure) => throw ApiException(failure.message, statusCode: failure.statusCode),
      (_) {
        final current = state.asData?.value ?? [];
        state = AsyncData(current.where((d) => d.id != id).toList());
      },
    );
  }
}
