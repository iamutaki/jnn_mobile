import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../sub_district/data/models/sub_district_dto.dart';
import '../../../user/data/models/user_dto.dart';

part 'reseller_dto.freezed.dart';
part 'reseller_dto.g.dart';

int _intFromJson(Object? json) {
  if (json is int) return json;
  if (json is double) return json.toInt();
  if (json is String) return int.tryParse(json) ?? 0;
  return 0;
}

double _doubleFromJson(Object? json) {
  if (json is double) return json;
  if (json is int) return json.toDouble();
  if (json is String) return double.tryParse(json) ?? 0.0;
  return 0.0;
}

@freezed
abstract class ResellerDto with _$ResellerDto {
  const factory ResellerDto({
    required UserDto user,
    @JsonKey(name: 'venuePhoto') String? venuePhoto,
    SubDistrictDto? subDistrict,
    @JsonKey(fromJson: _intFromJson) @Default(0) int commissionRate,
    @JsonKey(fromJson: _intFromJson) @Default(0) int commissionAmount,
    @JsonKey(fromJson: _doubleFromJson) double? lat,
    @JsonKey(fromJson: _doubleFromJson) double? lng,
    String? phone,
  }) = _ResellerDto;

  factory ResellerDto.fromJson(Map<String, dynamic> json) =>
      _$ResellerDtoFromJson(json);
}
