import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../district/data/models/district_dto.dart';

part 'sub_district_dto.freezed.dart';
part 'sub_district_dto.g.dart';

@freezed
abstract class SubDistrictDto with _$SubDistrictDto {
  const factory SubDistrictDto({
    @Default('') String id,
    required String name,
    String? code,
    double? lat,
    double? lng,
    DistrictDto? district,
  }) = _SubDistrictDto;

  factory SubDistrictDto.fromJson(Map<String, dynamic> json) =>
      _$SubDistrictDtoFromJson(json);
}
