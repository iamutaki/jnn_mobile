// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reseller_voucher_sale_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AllocatedCodeDto _$AllocatedCodeDtoFromJson(Map<String, dynamic> json) =>
    _AllocatedCodeDto(
      id: json['id'] as String,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AllocatedCodeDtoToJson(_AllocatedCodeDto instance) =>
    <String, dynamic>{'id': instance.id, 'status': instance.status};

_ResellerVoucherSaleDetailItemDto _$ResellerVoucherSaleDetailItemDtoFromJson(
  Map<String, dynamic> json,
) => _ResellerVoucherSaleDetailItemDto(
  id: json['id'] as String?,
  voucherId: json['voucherId'] as String,
  qty: (json['qty'] as num).toInt(),
  unitPrice: (json['unitPrice'] as num).toInt(),
  totalAmount: (json['totalAmount'] as num?)?.toInt(),
  allocatedCodes:
      (json['allocatedCodes'] as List<dynamic>?)
          ?.map((e) => AllocatedCodeDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AllocatedCodeDto>[],
);

Map<String, dynamic> _$ResellerVoucherSaleDetailItemDtoToJson(
  _ResellerVoucherSaleDetailItemDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'voucherId': instance.voucherId,
  'qty': instance.qty,
  'unitPrice': instance.unitPrice,
  'totalAmount': instance.totalAmount,
  'allocatedCodes': instance.allocatedCodes,
};

_ResellerVoucherSaleDetailDto _$ResellerVoucherSaleDetailDtoFromJson(
  Map<String, dynamic> json,
) => _ResellerVoucherSaleDetailDto(
  id: json['id'] as String,
  resellerId: json['resellerId'] as String?,
  saleNo: json['saleNo'] as String?,
  saleDate: json['saleDate'] as String,
  saleMonth: json['saleMonth'] as String,
  totalQty: (json['totalQty'] as num?)?.toInt(),
  totalAmount: (json['totalAmount'] as num?)?.toInt(),
  status: json['status'] as String,
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  cancelledAt: json['cancelledAt'] == null
      ? null
      : DateTime.parse(json['cancelledAt'] as String),
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => ResellerVoucherSaleDetailItemDto.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <ResellerVoucherSaleDetailItemDto>[],
);

Map<String, dynamic> _$ResellerVoucherSaleDetailDtoToJson(
  _ResellerVoucherSaleDetailDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'resellerId': instance.resellerId,
  'saleNo': instance.saleNo,
  'saleDate': instance.saleDate,
  'saleMonth': instance.saleMonth,
  'totalQty': instance.totalQty,
  'totalAmount': instance.totalAmount,
  'status': instance.status,
  'completedAt': instance.completedAt?.toIso8601String(),
  'cancelledAt': instance.cancelledAt?.toIso8601String(),
  'items': instance.items,
};
