// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reseller_voucher_sale_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResellerVoucherSaleRequest _$ResellerVoucherSaleRequestFromJson(
  Map<String, dynamic> json,
) => _ResellerVoucherSaleRequest(
  saleDate: json['saleDate'] as String,
  saleMonth: json['saleMonth'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => ResellerVoucherSaleItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ResellerVoucherSaleRequestToJson(
  _ResellerVoucherSaleRequest instance,
) => <String, dynamic>{
  'saleDate': instance.saleDate,
  'saleMonth': instance.saleMonth,
  'items': instance.items,
};

_ResellerVoucherSaleItem _$ResellerVoucherSaleItemFromJson(
  Map<String, dynamic> json,
) => _ResellerVoucherSaleItem(
  voucherId: json['voucherId'] as String,
  qty: (json['qty'] as num).toInt(),
  unitPrice: (json['unitPrice'] as num).toInt(),
);

Map<String, dynamic> _$ResellerVoucherSaleItemToJson(
  _ResellerVoucherSaleItem instance,
) => <String, dynamic>{
  'voucherId': instance.voucherId,
  'qty': instance.qty,
  'unitPrice': instance.unitPrice,
};
