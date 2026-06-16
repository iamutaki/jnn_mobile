// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_voucher_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DigitalVoucherDto _$DigitalVoucherDtoFromJson(Map<String, dynamic> json) =>
    _DigitalVoucherDto(
      id: json['id'] as String,
      voucherId: json['voucherId'] as String?,
      subDistrictId: json['subDistrictId'] as String?,
      importId: json['importId'] as String?,
      status: json['status'] as String?,
      soldToResellerId: json['soldToResellerId'] as String?,
      soldSaleId: json['soldSaleId'] as String?,
      soldAt: json['soldAt'] == null
          ? null
          : DateTime.parse(json['soldAt'] as String),
      code: json['code'] as String?,
    );

Map<String, dynamic> _$DigitalVoucherDtoToJson(_DigitalVoucherDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'voucherId': instance.voucherId,
      'subDistrictId': instance.subDistrictId,
      'importId': instance.importId,
      'status': instance.status,
      'soldToResellerId': instance.soldToResellerId,
      'soldSaleId': instance.soldSaleId,
      'soldAt': instance.soldAt?.toIso8601String(),
      'code': instance.code,
    };
