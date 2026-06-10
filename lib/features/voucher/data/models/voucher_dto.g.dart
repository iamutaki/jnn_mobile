// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VoucherDto _$VoucherDtoFromJson(Map<String, dynamic> json) => _VoucherDto(
  id: json['id'] as String? ?? '',
  name: json['name'] as String,
  price: _priceFromJson(json['price']),
  description: json['description'] as String?,
);

Map<String, dynamic> _$VoucherDtoToJson(_VoucherDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
    };
