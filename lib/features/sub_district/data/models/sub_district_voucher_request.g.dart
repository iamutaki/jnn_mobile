// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_district_voucher_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubDistrictVoucherRequest _$SubDistrictVoucherRequestFromJson(
  Map<String, dynamic> json,
) => _SubDistrictVoucherRequest(
  voucherIds:
      (json['voucherIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$SubDistrictVoucherRequestToJson(
  _SubDistrictVoucherRequest instance,
) => <String, dynamic>{'voucherIds': instance.voucherIds};
