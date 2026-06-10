import 'package:freezed_annotation/freezed_annotation.dart';

part 'voucher_request.freezed.dart';
part 'voucher_request.g.dart';

@freezed
abstract class VoucherRequest with _$VoucherRequest {
  const factory VoucherRequest({
    required String name,
    required int price,
    String? description,
  }) = _VoucherRequest;

  factory VoucherRequest.fromJson(Map<String, dynamic> json) =>
      _$VoucherRequestFromJson(json);
}
