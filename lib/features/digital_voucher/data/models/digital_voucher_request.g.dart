// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_voucher_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DigitalVoucherBulkRequest _$DigitalVoucherBulkRequestFromJson(
  Map<String, dynamic> json,
) => _DigitalVoucherBulkRequest(
  items: (json['items'] as List<dynamic>)
      .map((e) => DigitalVoucherItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DigitalVoucherBulkRequestToJson(
  _DigitalVoucherBulkRequest instance,
) => <String, dynamic>{'items': instance.items};

_DigitalVoucherItem _$DigitalVoucherItemFromJson(Map<String, dynamic> json) =>
    _DigitalVoucherItem(
      voucherId: json['voucherId'] as String,
      code: json['code'] as String,
      subDistrictId: json['subDistrictId'] as String?,
    );

Map<String, dynamic> _$DigitalVoucherItemToJson(_DigitalVoucherItem instance) =>
    <String, dynamic>{
      'voucherId': instance.voucherId,
      'code': instance.code,
      'subDistrictId': instance.subDistrictId,
    };
