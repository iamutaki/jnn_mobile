// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_district_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubDistrictDto _$SubDistrictDtoFromJson(Map<String, dynamic> json) =>
    _SubDistrictDto(
      id: json['id'] as String? ?? '',
      name: json['name'] as String,
      code: json['code'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      district: json['district'] == null
          ? null
          : DistrictDto.fromJson(json['district'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubDistrictDtoToJson(_SubDistrictDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'lat': instance.lat,
      'lng': instance.lng,
      'district': instance.district,
    };
