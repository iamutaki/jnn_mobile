// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_voucher_import_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DigitalVoucherImportDto _$DigitalVoucherImportDtoFromJson(
  Map<String, dynamic> json,
) => _DigitalVoucherImportDto(
  id: json['id'] as String,
  voucher: VoucherDto.fromJson(json['voucher'] as Map<String, dynamic>),
  subDistrict: json['subDistrict'] == null
      ? null
      : SubDistrictDto.fromJson(json['subDistrict'] as Map<String, dynamic>),
  totalCodes: (json['totalCodes'] as num).toInt(),
  notes: json['notes'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  createdByUserId: json['createdByUserId'] as String,
);

Map<String, dynamic> _$DigitalVoucherImportDtoToJson(
  _DigitalVoucherImportDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'voucher': instance.voucher,
  'subDistrict': instance.subDistrict,
  'totalCodes': instance.totalCodes,
  'notes': instance.notes,
  'createdAt': instance.createdAt.toIso8601String(),
  'createdByUserId': instance.createdByUserId,
};
