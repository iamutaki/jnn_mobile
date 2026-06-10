import 'package:freezed_annotation/freezed_annotation.dart';

part 'reseller_request.freezed.dart';
part 'reseller_request.g.dart';

@freezed
abstract class ResellerRequest with _$ResellerRequest {
  const factory ResellerRequest({
    required String name,
    required String username,
    String? password,
    String? phone,
    String? avatar,
    @JsonKey(name: 'venuePhoto') String? venuePhoto,
    @JsonKey(name: 'subDistrictId') String? subDistrictId,
    @JsonKey(name: 'commissionRate') int? commissionRate,
    @JsonKey(name: 'commissionAmount') int? commissionAmount,
    double? lat,
    double? lng,
  }) = _ResellerRequest;

  factory ResellerRequest.fromJson(Map<String, dynamic> json) =>
      _$ResellerRequestFromJson(json);
}
