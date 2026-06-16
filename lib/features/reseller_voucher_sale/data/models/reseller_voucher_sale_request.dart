import 'package:freezed_annotation/freezed_annotation.dart';

part 'reseller_voucher_sale_request.freezed.dart';
part 'reseller_voucher_sale_request.g.dart';

/// Payload pembuatan penjualan voucher reseller.
///
/// `saleDate` & `saleMonth` sengaja bertipe [String] (format "YYYY-MM-DD" &
/// "YYYY-MM-MM") agar JSON yang terkirim persis seperti kontrak backend.
/// Bila pakai [DateTime], json_serializable akan menyertakan komponen waktu
/// (ISO 8601) yang tidak sesuai payload.
///
/// `saleNo` (nomor invoice) sengaja tidak disertakan — di-generate backend.
@freezed
abstract class ResellerVoucherSaleRequest
    with _$ResellerVoucherSaleRequest {
  const factory ResellerVoucherSaleRequest({
    required String saleDate,
    required String saleMonth,
    required List<ResellerVoucherSaleItem> items,
  }) = _ResellerVoucherSaleRequest;

  factory ResellerVoucherSaleRequest.fromJson(Map<String, dynamic> json) =>
      _$ResellerVoucherSaleRequestFromJson(json);
}

@freezed
abstract class ResellerVoucherSaleItem with _$ResellerVoucherSaleItem {
  const factory ResellerVoucherSaleItem({
    required String voucherId,
    required int qty,
    required int unitPrice,
  }) = _ResellerVoucherSaleItem;

  factory ResellerVoucherSaleItem.fromJson(Map<String, dynamic> json) =>
      _$ResellerVoucherSaleItemFromJson(json);
}
