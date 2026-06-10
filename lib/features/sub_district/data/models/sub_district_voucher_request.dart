import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_district_voucher_request.freezed.dart';
part 'sub_district_voucher_request.g.dart';

@freezed
abstract class SubDistrictVoucherRequest with _$SubDistrictVoucherRequest {
  const factory SubDistrictVoucherRequest({
    @Default([]) List<String> voucherIds,
  }) = _SubDistrictVoucherRequest;

  factory SubDistrictVoucherRequest.fromJson(Map<String, dynamic> json) =>
      _$SubDistrictVoucherRequestFromJson(json);
}
