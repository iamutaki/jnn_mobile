// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reseller_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResellerProfileDto _$ResellerProfileDtoFromJson(Map<String, dynamic> json) =>
    _ResellerProfileDto(
      subDistrictId: json['subDistrictId'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ResellerProfileDtoToJson(_ResellerProfileDto instance) =>
    <String, dynamic>{
      'subDistrictId': instance.subDistrictId,
      'lat': instance.lat,
      'lon': instance.lon,
    };
