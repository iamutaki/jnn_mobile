// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reseller_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResellerDto _$ResellerDtoFromJson(Map<String, dynamic> json) => _ResellerDto(
  id: json['id'] as String? ?? '',
  name: json['name'] as String,
  username: json['username'] as String,
  phone: json['phone'] as String?,
  avatar: json['avatar'] as String?,
  venuePhoto: json['venuePhoto'] as String?,
  subDistrictId: json['subDistrictId'] as String?,
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
);

Map<String, dynamic> _$ResellerDtoToJson(_ResellerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'venuePhoto': instance.venuePhoto,
      'subDistrictId': instance.subDistrictId,
      'subDistrict': instance.subDistrict,
      'commissionRate': instance.commissionRate,
      'commissionAmount': instance.commissionAmount,
      'lat': instance.lat,
      'lng': instance.lng,
    };
