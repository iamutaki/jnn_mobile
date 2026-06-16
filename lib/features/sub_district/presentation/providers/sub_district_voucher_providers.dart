import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../voucher/data/models/voucher_dto.dart';
import '../../data/providers/sub_district_voucher_data_providers.dart';

part 'sub_district_voucher_providers.g.dart';

@Riverpod(keepAlive: true)
class SubDistrictVoucherNotifier extends _$SubDistrictVoucherNotifier {
  @override
  Future<List<String>> build(String subDistrictId) async {
    return _fetch(subDistrictId);
  }

  Future<List<String>> _fetch(String subDistrictId) async {
    final repo = ref.read(subDistrictVoucherRepositoryProvider);
    final result = await repo.getSubDistrictVouchers(subDistrictId);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (list) => list.map((v) => v.id).toList(),
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    try {
      final list = await _fetch(subDistrictId);
      state = AsyncData(list);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> save(List<String> voucherIds) async {
    final repo = ref.read(subDistrictVoucherRepositoryProvider);
    final result = await repo.replaceSubDistrictVouchers(
      subDistrictId,
      voucherIds,
    );
    result.fold(
      (failure) => throw Exception(failure.message),
      (_) {
        state = AsyncData(voucherIds);
      },
    );
  }
}

/// Sama dengan [SubDistrictVoucherNotifier], tapi mengembalikan [VoucherDto]
/// lengkap (id, nama, harga) — dipakai halaman penjualan untuk menampilkan
/// produk beserta steppernya tanpa perlu intersect dengan master voucher.
@Riverpod(keepAlive: true)
class SubDistrictVouchersNotifier extends _$SubDistrictVouchersNotifier {
  @override
  Future<List<VoucherDto>> build(String subDistrictId) => _fetch(subDistrictId);

  Future<List<VoucherDto>> _fetch(String subDistrictId) async {
    final repo = ref.read(subDistrictVoucherRepositoryProvider);
    final result = await repo.getSubDistrictVouchers(subDistrictId);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (list) => list,
    );
  }
}
