import 'package:freezed_annotation/freezed_annotation.dart';

part 'district_dto.freezed.dart';
part 'district_dto.g.dart';

@freezed
abstract class DistrictDto with _$DistrictDto {
  const factory DistrictDto({
    @Default('') String id,
    required String name,
  }) = _DistrictDto;

  factory DistrictDto.fromJson(Map<String, dynamic> json) =>
      _$DistrictDtoFromJson(json);
}
