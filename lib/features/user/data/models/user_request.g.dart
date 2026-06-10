// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRequest _$UserRequestFromJson(Map<String, dynamic> json) => _UserRequest(
  name: json['name'] as String,
  username: json['username'] as String,
  password: json['password'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  avatar: json['avatar'] as String?,
  roleIds: (json['roleIds'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$UserRequestToJson(_UserRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'password': instance.password,
      'phone': instance.phone,
      'email': instance.email,
      'avatar': instance.avatar,
      'roleIds': instance.roleIds,
    };
