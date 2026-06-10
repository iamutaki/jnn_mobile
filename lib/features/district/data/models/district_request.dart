import 'package:freezed_annotation/freezed_annotation.dart';

part 'district_request.freezed.dart';
part 'district_request.g.dart';

@freezed
abstract class DistrictRequest with _$DistrictRequest {
  const factory DistrictRequest({
    required String name,
  }) = _DistrictRequest;

  factory DistrictRequest.fromJson(Map<String, dynamic> json) =>
      _$DistrictRequestFromJson(json);
}
