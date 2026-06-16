import 'dart:async';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/reseller_voucher_sale_detail_dto.dart';
import '../../data/models/reseller_voucher_sale_dto.dart';
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
@Riverpod(keepAlive: true)
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

  /// Cancel sale (POST /:id/cancel, 204) lalu re-fetch detail.
  Future<void> cancel() async {
    final useCase = ref.read(cancelResellerVoucherSaleUseCaseProvider);
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

/// Cursor-based pagination untuk riwayat penjualan (keepAlive agar state
/// tetap ada saat navigasi bolak-balik, mengurangi API call).
@Riverpod(keepAlive: true)
class SaleHistoryPaging extends _$SaleHistoryPaging {
  @override
  PagingController<String, ResellerVoucherSaleDto> build() {
    String? nextCursor;
    final controller = PagingController<String, ResellerVoucherSaleDto>(
      getNextPageKey: (state) {
        if (state.keys == null || state.keys!.isEmpty) return '';
        return nextCursor;
      },
      fetchPage: (pageKey) async {
        final useCase = ref.read(getResellerVoucherSaleHistoryUseCaseProvider);
        final cursor = pageKey.isEmpty ? null : pageKey;
        final result = await useCase(cursor);
        return result.fold(
          (failure) => throw Exception(failure.message),
          (page) {
            nextCursor = page.nextCursor;
            return page.items;
          },
        );
      },
    );
    ref.onDispose(controller.dispose);
    return controller;
  }
}
