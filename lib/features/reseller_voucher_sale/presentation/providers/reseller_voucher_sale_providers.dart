import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/reseller_voucher_sale_detail_dto.dart';
import '../../data/models/reseller_voucher_sale_request.dart';
import '../../domain/providers/reseller_voucher_sale_domain_providers.dart';

part 'reseller_voucher_sale_providers.g.dart';

@Riverpod(keepAlive: true)
class ResellerVoucherSaleNotifier extends _$ResellerVoucherSaleNotifier {
  @override
  Future<void> build() async {
    // No initial data to load.
  }

  /// Membuat sale; mengembalikan id sale baru (untuk navigasi ke detail).
  Future<String> create({
    required String saleDate,
    required String saleMonth,
    required List<ResellerVoucherSaleItem> items,
  }) async {
    final useCase = ref.read(createResellerVoucherSaleUseCaseProvider);
    final request = ResellerVoucherSaleRequest(
      saleDate: saleDate,
      saleMonth: saleMonth,
      items: items,
    );
    final result = await useCase(request);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (id) => id,
    );
  }
}

/// Detail sebuah sale (family by saleId). Menyediakan [complete] untuk
/// menyelesaikan sale & me-reveal kode voucher.
@riverpod
class ResellerVoucherSaleDetailNotifier
    extends _$ResellerVoucherSaleDetailNotifier {
  @override
  Future<ResellerVoucherSaleDetailDto> build(String saleId) =>
      _fetch(saleId);

  Future<ResellerVoucherSaleDetailDto> _fetch(String saleId) async {
    final useCase = ref.read(getResellerVoucherSaleDetailUseCaseProvider);
    final result = await useCase(saleId);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (detail) => detail,
    );
  }

  /// Complete sale (POST /:id/complete, 204) lalu re-fetch detail agar
  /// allocatedCodes terisi & status jadi 'completed'. Data lama dipertahankan
  /// selama re-fetch (tanpa flash skeleton) — spinner ditangani UI pemanggil.
  Future<void> complete() async {
    final useCase = ref.read(completeResellerVoucherSaleUseCaseProvider);
    final result = await useCase(saleId);
    result.fold(
      (failure) => throw Exception(failure.message),
      (_) {},
    );
    state = await AsyncValue.guard(() => _fetch(saleId));
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetch(saleId));
  }
}
