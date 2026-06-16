import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/digital_voucher_dto.dart';
import '../../data/models/digital_voucher_request.dart';
import '../../domain/providers/digital_voucher_domain_providers.dart';

part 'digital_voucher_providers.g.dart';

@Riverpod(keepAlive: true)
class DigitalVoucherNotifier extends _$DigitalVoucherNotifier {
  @override
  Future<void> build() async {
    // No initial data to load.
  }

  Future<void> createBulk({
    required String voucherId,
    required String subDistrictId,
    required List<String> codes,
  }) async {
    final useCase = ref.read(createBulkDigitalVoucherUseCaseProvider);
    final items = codes.map((code) => DigitalVoucherItem(
      voucherId: voucherId,
      code: code,
      subDistrictId: subDistrictId,
    )).toList();
    final request = DigitalVoucherBulkRequest(items: items);
    final result = await useCase(request);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (_) {},
    );
  }
}

/// Satu instance digital voucher by id (family). Dipakai halaman detail
/// sale untuk menampilkan kode tiap allocatedCode setelah sale di-complete.
@riverpod
class DigitalVoucherDetailNotifier extends _$DigitalVoucherDetailNotifier {
  @override
  Future<DigitalVoucherDto> build(String id) => _fetch(id);

  Future<DigitalVoucherDto> _fetch(String id) async {
    final useCase = ref.read(getDigitalVoucherUseCaseProvider);
    final result = await useCase(id);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (dto) => dto,
    );
  }
}
