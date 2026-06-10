// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reseller_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResellerDto _$ResellerDtoFromJson(Map<String, dynamic> json) => _ResellerDto(
  user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
  venuePhoto: json['venuePhoto'] as String?,
  subDistrict: json['subDistrict'] == null
      ? null
      : SubDistrictDto.fromJson(json['subDistrict'] as Map<String, dynamic>),
  commissionRate: json['commissionRate'] == null
      ? 0
      : _intFromJson(json['commissionRate']),
  commissionAmount: json['commissionAmount'] == null
      ? 0
      : _intFromJson(json['commissionAmount']),
  lat: _doubleFromJson(json['lat']),
  lng: _doubleFromJson(json['lng']),
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$ResellerDtoToJson(_ResellerDto instance) =>
    <String, dynamic>{
      'user': instance.user,
      'venuePhoto': instance.venuePhoto,
      'subDistrict': instance.subDistrict,
      'commissionRate': instance.commissionRate,
      'commissionAmount': instance.commissionAmount,
      'lat': instance.lat,
      'lng': instance.lng,
      'phone': instance.phone,
    };
