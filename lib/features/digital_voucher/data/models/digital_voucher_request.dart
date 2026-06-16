import 'package:freezed_annotation/freezed_annotation.dart';

part 'digital_voucher_request.freezed.dart';
part 'digital_voucher_request.g.dart';

@freezed
abstract class DigitalVoucherBulkRequest with _$DigitalVoucherBulkRequest {
  const factory DigitalVoucherBulkRequest({
    required List<DigitalVoucherItem> items,
  }) = _DigitalVoucherBulkRequest;

  factory DigitalVoucherBulkRequest.fromJson(Map<String, dynamic> json) =>
      _$DigitalVoucherBulkRequestFromJson(json);
}

@freezed
abstract class DigitalVoucherItem with _$DigitalVoucherItem {
  const factory DigitalVoucherItem({
    required String voucherId,
    required String code,
    String? subDistrictId,
  }) = _DigitalVoucherItem;

  factory DigitalVoucherItem.fromJson(Map<String, dynamic> json) =>
      _$DigitalVoucherItemFromJson(json);
}
