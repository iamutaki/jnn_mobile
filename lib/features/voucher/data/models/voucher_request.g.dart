// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VoucherRequest _$VoucherRequestFromJson(Map<String, dynamic> json) =>
    _VoucherRequest(
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$VoucherRequestToJson(_VoucherRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
    };
