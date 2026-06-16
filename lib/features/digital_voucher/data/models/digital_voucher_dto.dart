import 'package:freezed_annotation/freezed_annotation.dart';

part 'digital_voucher_dto.freezed.dart';
part 'digital_voucher_dto.g.dart';

/// Satu instance digital voucher beserta kodenya (endpoint
/// `GET /v1/digital-voucher/:id`). `code` berisi kode yang ditampilkan ke
/// buyer; bisa null/masked bila belum di-reveal.
@freezed
abstract class DigitalVoucherDto with _$DigitalVoucherDto {
  const factory DigitalVoucherDto({
    required String id,
    String? voucherId,
    String? subDistrictId,
    String? importId,
    String? status,
    String? soldToResellerId,
    String? soldSaleId,
    DateTime? soldAt,
    String? code,
  }) = _DigitalVoucherDto;

  factory DigitalVoucherDto.fromJson(Map<String, dynamic> json) =>
      _$DigitalVoucherDtoFromJson(json);
}
