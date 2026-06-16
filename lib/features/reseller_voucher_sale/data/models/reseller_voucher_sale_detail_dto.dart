import 'package:freezed_annotation/freezed_annotation.dart';

part 'reseller_voucher_sale_detail_dto.freezed.dart';
part 'reseller_voucher_sale_detail_dto.g.dart';

/// Satu instance kode voucher yang sudah dialokasikan ke item sale.
/// Hanya membawa id (instance digital-voucher) + status; kode lengkapnya
/// di-fetch terpisah via `GET /v1/digital-voucher/:id`.
@freezed
abstract class AllocatedCodeDto with _$AllocatedCodeDto {
  const factory AllocatedCodeDto({
    required String id,
    String? status,
  }) = _AllocatedCodeDto;

  factory AllocatedCodeDto.fromJson(Map<String, dynamic> json) =>
      _$AllocatedCodeDtoFromJson(json);
}

/// Satu baris item pada detail sale (endpoint `GET .../:id`). Berbeda dari
/// [ResellerVoucherSaleItemDto] (riwayat) karena membawa `allocatedCodes`.
@freezed
abstract class ResellerVoucherSaleDetailItemDto
    with _$ResellerVoucherSaleDetailItemDto {
  const factory ResellerVoucherSaleDetailItemDto({
    String? id,
    required String voucherId,
    required int qty,
    required int unitPrice,
    int? totalAmount,
    @Default(<AllocatedCodeDto>[]) List<AllocatedCodeDto> allocatedCodes,
  }) = _ResellerVoucherSaleDetailItemDto;

  factory ResellerVoucherSaleDetailItemDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ResellerVoucherSaleDetailItemDtoFromJson(json);
}

/// Detail sale (endpoint `GET /v1/reseller-voucher-sale/:id`).
///
/// `status`: `draft` → `completed` → `cancelled`. `allocatedCodes` tiap item
/// baru terisi setelah sale di-complete.
@freezed
abstract class ResellerVoucherSaleDetailDto
    with _$ResellerVoucherSaleDetailDto {
  const factory ResellerVoucherSaleDetailDto({
    required String id,
    String? resellerId,
    String? saleNo,
    required String saleDate,
    required String saleMonth,
    int? totalQty,
    int? totalAmount,
    required String status,
    DateTime? completedAt,
    DateTime? cancelledAt,
    @Default(<ResellerVoucherSaleDetailItemDto>[])
    List<ResellerVoucherSaleDetailItemDto> items,
  }) = _ResellerVoucherSaleDetailDto;

  factory ResellerVoucherSaleDetailDto.fromJson(Map<String, dynamic> json) =>
      _$ResellerVoucherSaleDetailDtoFromJson(json);
}
