// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_device_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterDeviceRequestDto _$RegisterDeviceRequestDtoFromJson(
  Map<String, dynamic> json,
) => _RegisterDeviceRequestDto(
  udid: json['udid'] as String,
  fcmToken: json['fcmToken'] as String,
);

Map<String, dynamic> _$RegisterDeviceRequestDtoToJson(
  _RegisterDeviceRequestDto instance,
) => <String, dynamic>{'udid': instance.udid, 'fcmToken': instance.fcmToken};
