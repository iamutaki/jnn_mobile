import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../voucher/data/models/voucher_dto.dart';

part 'reseller_voucher_sale_dto.freezed.dart';
part 'reseller_voucher_sale_dto.g.dart';

/// Representasi satu baris item penjualan pada DTO riwayat.
@freezed
abstract class ResellerVoucherSaleItemDto
    with _$ResellerVoucherSaleItemDto {
  const factory ResellerVoucherSaleItemDto({
    required String voucherId,
    VoucherDto? voucher,
    required int qty,
    required int unitPrice,
  }) = _ResellerVoucherSaleItemDto;

  factory ResellerVoucherSaleItemDto.fromJson(Map<String, dynamic> json) =>
      _$ResellerVoucherSaleItemDtoFromJson(json);
}

/// DTO entri penjualan voucher reseller (untuk halaman riwayat).
///
/// Field selain `id` dibuat opsional agar parsing tidak gagal bila backend
/// tidak mengembalikan sebagian field (mis. `createdAt`/`createdByUserId` tidak
/// selalu hadir di response list). `totalAmount` dihitung client-side bila null.
@freezed
abstract class ResellerVoucherSaleDto with _$ResellerVoucherSaleDto {
  const factory ResellerVoucherSaleDto({
    required String id,
    String? saleNo,
    String? saleDate,
    String? saleMonth,
    String? status,
    @Default(<ResellerVoucherSaleItemDto>[])
    List<ResellerVoucherSaleItemDto> items,
    int? totalQty,
    int? totalAmount,
    DateTime? createdAt,
    DateTime? completedAt,
    String? createdByUserId,
  }) = _ResellerVoucherSaleDto;

  factory ResellerVoucherSaleDto.fromJson(Map<String, dynamic> json) =>
      _$ResellerVoucherSaleDtoFromJson(json);
}
