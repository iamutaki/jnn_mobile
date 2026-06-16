// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reseller_voucher_sale_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResellerVoucherSaleItemDto _$ResellerVoucherSaleItemDtoFromJson(
  Map<String, dynamic> json,
) => _ResellerVoucherSaleItemDto(
  voucherId: json['voucherId'] as String,
  voucher: json['voucher'] == null
      ? null
      : VoucherDto.fromJson(json['voucher'] as Map<String, dynamic>),
  qty: (json['qty'] as num).toInt(),
  unitPrice: (json['unitPrice'] as num).toInt(),
);

Map<String, dynamic> _$ResellerVoucherSaleItemDtoToJson(
  _ResellerVoucherSaleItemDto instance,
) => <String, dynamic>{
  'voucherId': instance.voucherId,
  'voucher': instance.voucher,
  'qty': instance.qty,
  'unitPrice': instance.unitPrice,
};

_ResellerVoucherSaleDto _$ResellerVoucherSaleDtoFromJson(
  Map<String, dynamic> json,
) => _ResellerVoucherSaleDto(
  id: json['id'] as String,
  saleNo: json['saleNo'] as String?,
  saleDate: json['saleDate'] as String?,
  saleMonth: json['saleMonth'] as String?,
  status: json['status'] as String?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                ResellerVoucherSaleItemDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <ResellerVoucherSaleItemDto>[],
  totalQty: (json['totalQty'] as num?)?.toInt(),
  totalAmount: (json['totalAmount'] as num?)?.toInt(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  createdByUserId: json['createdByUserId'] as String?,
);

Map<String, dynamic> _$ResellerVoucherSaleDtoToJson(
  _ResellerVoucherSaleDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'saleNo': instance.saleNo,
  'saleDate': instance.saleDate,
  'saleMonth': instance.saleMonth,
  'status': instance.status,
  'items': instance.items,
  'totalQty': instance.totalQty,
  'totalAmount': instance.totalAmount,
  'createdAt': instance.createdAt?.toIso8601String(),
  'completedAt': instance.completedAt?.toIso8601String(),
  'createdByUserId': instance.createdByUserId,
};
