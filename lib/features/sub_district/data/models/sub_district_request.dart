import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_district_request.freezed.dart';
part 'sub_district_request.g.dart';

@freezed
abstract class SubDistrictRequest with _$SubDistrictRequest {
  const factory SubDistrictRequest({
    required String districtId,
    required String name,
  }) = _SubDistrictRequest;

  factory SubDistrictRequest.fromJson(Map<String, dynamic> json) =>
      _$SubDistrictRequestFromJson(json);
}
