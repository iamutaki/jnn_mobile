// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reseller_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResellerRequest _$ResellerRequestFromJson(Map<String, dynamic> json) =>
    _ResellerRequest(
      name: json['name'] as String,
      username: json['username'] as String,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      venuePhoto: json['venuePhoto'] as String?,
      subDistrictId: json['subDistrictId'] as String?,
      commissionRate: (json['commissionRate'] as num?)?.toInt(),
      commissionAmount: (json['commissionAmount'] as num?)?.toInt(),
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ResellerRequestToJson(_ResellerRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'password': instance.password,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'venuePhoto': instance.venuePhoto,
      'subDistrictId': instance.subDistrictId,
      'commissionRate': instance.commissionRate,
      'commissionAmount': instance.commissionAmount,
      'lat': instance.lat,
      'lng': instance.lng,
    };
