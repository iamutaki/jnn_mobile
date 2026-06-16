// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reseller_voucher_sale_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResellerVoucherSaleItemDto {

 String get voucherId; VoucherDto? get voucher; int get qty; int get unitPrice;
/// Create a copy of ResellerVoucherSaleItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResellerVoucherSaleItemDtoCopyWith<ResellerVoucherSaleItemDto> get copyWith => _$ResellerVoucherSaleItemDtoCopyWithImpl<ResellerVoucherSaleItemDto>(this as ResellerVoucherSaleItemDto, _$identity);

  /// Serializes this ResellerVoucherSaleItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResellerVoucherSaleItemDto&&(identical(other.voucherId, voucherId) || other.voucherId == voucherId)&&(identical(other.voucher, voucher) || other.voucher == voucher)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,voucherId,voucher,qty,unitPrice);

@override
String toString() {
  return 'ResellerVoucherSaleItemDto(voucherId: $voucherId, voucher: $voucher, qty: $qty, unitPrice: $unitPrice)';
}


}

/// @nodoc
abstract mixin class $ResellerVoucherSaleItemDtoCopyWith<$Res>  {
  factory $ResellerVoucherSaleItemDtoCopyWith(ResellerVoucherSaleItemDto value, $Res Function(ResellerVoucherSaleItemDto) _then) = _$ResellerVoucherSaleItemDtoCopyWithImpl;
@useResult
$Res call({
 String voucherId, VoucherDto? voucher, int qty, int unitPrice
});


$VoucherDtoCopyWith<$Res>? get voucher;

}
/// @nodoc
class _$ResellerVoucherSaleItemDtoCopyWithImpl<$Res>
    implements $ResellerVoucherSaleItemDtoCopyWith<$Res> {
  _$ResellerVoucherSaleItemDtoCopyWithImpl(this._self, this._then);

  final ResellerVoucherSaleItemDto _self;
  final $Res Function(ResellerVoucherSaleItemDto) _then;

/// Create a copy of ResellerVoucherSaleItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? voucherId = null,Object? voucher = freezed,Object? qty = null,Object? unitPrice = null,}) {
  return _then(_self.copyWith(
voucherId: null == voucherId ? _self.voucherId : voucherId // ignore: cast_nullable_to_non_nullable
as String,voucher: freezed == voucher ? _self.voucher : voucher // ignore: cast_nullable_to_non_nullable
as VoucherDto?,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ResellerVoucherSaleItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VoucherDtoCopyWith<$Res>? get voucher {
    if (_self.voucher == null) {
    return null;
  }

  return $VoucherDtoCopyWith<$Res>(_self.voucher!, (value) {
    return _then(_self.copyWith(voucher: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResellerVoucherSaleItemDto].
extension ResellerVoucherSaleItemDtoPatterns on ResellerVoucherSaleItemDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResellerVoucherSaleItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleItemDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResellerVoucherSaleItemDto value)  $default,){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleItemDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResellerVoucherSaleItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleItemDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String voucherId,  VoucherDto? voucher,  int qty,  int unitPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleItemDto() when $default != null:
return $default(_that.voucherId,_that.voucher,_that.qty,_that.unitPrice);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String voucherId,  VoucherDto? voucher,  int qty,  int unitPrice)  $default,) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleItemDto():
return $default(_that.voucherId,_that.voucher,_that.qty,_that.unitPrice);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String voucherId,  VoucherDto? voucher,  int qty,  int unitPrice)?  $default,) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleItemDto() when $default != null:
return $default(_that.voucherId,_that.voucher,_that.qty,_that.unitPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResellerVoucherSaleItemDto implements ResellerVoucherSaleItemDto {
  const _ResellerVoucherSaleItemDto({required this.voucherId, this.voucher, required this.qty, required this.unitPrice});
  factory _ResellerVoucherSaleItemDto.fromJson(Map<String, dynamic> json) => _$ResellerVoucherSaleItemDtoFromJson(json);

@override final  String voucherId;
@override final  VoucherDto? voucher;
@override final  int qty;
@override final  int unitPrice;

/// Create a copy of ResellerVoucherSaleItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResellerVoucherSaleItemDtoCopyWith<_ResellerVoucherSaleItemDto> get copyWith => __$ResellerVoucherSaleItemDtoCopyWithImpl<_ResellerVoucherSaleItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResellerVoucherSaleItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResellerVoucherSaleItemDto&&(identical(other.voucherId, voucherId) || other.voucherId == voucherId)&&(identical(other.voucher, voucher) || other.voucher == voucher)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,voucherId,voucher,qty,unitPrice);

@override
String toString() {
  return 'ResellerVoucherSaleItemDto(voucherId: $voucherId, voucher: $voucher, qty: $qty, unitPrice: $unitPrice)';
}


}

/// @nodoc
abstract mixin class _$ResellerVoucherSaleItemDtoCopyWith<$Res> implements $ResellerVoucherSaleItemDtoCopyWith<$Res> {
  factory _$ResellerVoucherSaleItemDtoCopyWith(_ResellerVoucherSaleItemDto value, $Res Function(_ResellerVoucherSaleItemDto) _then) = __$ResellerVoucherSaleItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String voucherId, VoucherDto? voucher, int qty, int unitPrice
});


@override $VoucherDtoCopyWith<$Res>? get voucher;

}
/// @nodoc
class __$ResellerVoucherSaleItemDtoCopyWithImpl<$Res>
    implements _$ResellerVoucherSaleItemDtoCopyWith<$Res> {
  __$ResellerVoucherSaleItemDtoCopyWithImpl(this._self, this._then);

  final _ResellerVoucherSaleItemDto _self;
  final $Res Function(_ResellerVoucherSaleItemDto) _then;

/// Create a copy of ResellerVoucherSaleItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? voucherId = null,Object? voucher = freezed,Object? qty = null,Object? unitPrice = null,}) {
  return _then(_ResellerVoucherSaleItemDto(
voucherId: null == voucherId ? _self.voucherId : voucherId // ignore: cast_nullable_to_non_nullable
as String,voucher: freezed == voucher ? _self.voucher : voucher // ignore: cast_nullable_to_non_nullable
as VoucherDto?,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ResellerVoucherSaleItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VoucherDtoCopyWith<$Res>? get voucher {
    if (_self.voucher == null) {
    return null;
  }

  return $VoucherDtoCopyWith<$Res>(_self.voucher!, (value) {
    return _then(_self.copyWith(voucher: value));
  });
}
}


/// @nodoc
mixin _$ResellerVoucherSaleDto {

 String get id; String? get saleNo; String? get saleDate; String? get saleMonth; String? get status; List<ResellerVoucherSaleItemDto> get items; int? get totalQty; int? get totalAmount; DateTime? get createdAt; DateTime? get completedAt; String? get createdByUserId;
/// Create a copy of ResellerVoucherSaleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResellerVoucherSaleDtoCopyWith<ResellerVoucherSaleDto> get copyWith => _$ResellerVoucherSaleDtoCopyWithImpl<ResellerVoucherSaleDto>(this as ResellerVoucherSaleDto, _$identity);

  /// Serializes this ResellerVoucherSaleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResellerVoucherSaleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.saleNo, saleNo) || other.saleNo == saleNo)&&(identical(other.saleDate, saleDate) || other.saleDate == saleDate)&&(identical(other.saleMonth, saleMonth) || other.saleMonth == saleMonth)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalQty, totalQty) || other.totalQty == totalQty)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdByUserId, createdByUserId) || other.createdByUserId == createdByUserId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,saleNo,saleDate,saleMonth,status,const DeepCollectionEquality().hash(items),totalQty,totalAmount,createdAt,completedAt,createdByUserId);

@override
String toString() {
  return 'ResellerVoucherSaleDto(id: $id, saleNo: $saleNo, saleDate: $saleDate, saleMonth: $saleMonth, status: $status, items: $items, totalQty: $totalQty, totalAmount: $totalAmount, createdAt: $createdAt, completedAt: $completedAt, createdByUserId: $createdByUserId)';
}


}

/// @nodoc
abstract mixin class $ResellerVoucherSaleDtoCopyWith<$Res>  {
  factory $ResellerVoucherSaleDtoCopyWith(ResellerVoucherSaleDto value, $Res Function(ResellerVoucherSaleDto) _then) = _$ResellerVoucherSaleDtoCopyWithImpl;
@useResult
$Res call({
 String id, String? saleNo, String? saleDate, String? saleMonth, String? status, List<ResellerVoucherSaleItemDto> items, int? totalQty, int? totalAmount, DateTime? createdAt, DateTime? completedAt, String? createdByUserId
});




}
/// @nodoc
class _$ResellerVoucherSaleDtoCopyWithImpl<$Res>
    implements $ResellerVoucherSaleDtoCopyWith<$Res> {
  _$ResellerVoucherSaleDtoCopyWithImpl(this._self, this._then);

  final ResellerVoucherSaleDto _self;
  final $Res Function(ResellerVoucherSaleDto) _then;

/// Create a copy of ResellerVoucherSaleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? saleNo = freezed,Object? saleDate = freezed,Object? saleMonth = freezed,Object? status = freezed,Object? items = null,Object? totalQty = freezed,Object? totalAmount = freezed,Object? createdAt = freezed,Object? completedAt = freezed,Object? createdByUserId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,saleNo: freezed == saleNo ? _self.saleNo : saleNo // ignore: cast_nullable_to_non_nullable
as String?,saleDate: freezed == saleDate ? _self.saleDate : saleDate // ignore: cast_nullable_to_non_nullable
as String?,saleMonth: freezed == saleMonth ? _self.saleMonth : saleMonth // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ResellerVoucherSaleItemDto>,totalQty: freezed == totalQty ? _self.totalQty : totalQty // ignore: cast_nullable_to_non_nullable
as int?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdByUserId: freezed == createdByUserId ? _self.createdByUserId : createdByUserId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResellerVoucherSaleDto].
extension ResellerVoucherSaleDtoPatterns on ResellerVoucherSaleDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResellerVoucherSaleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResellerVoucherSaleDto value)  $default,){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResellerVoucherSaleDto value)?  $default,){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? saleNo,  String? saleDate,  String? saleMonth,  String? status,  List<ResellerVoucherSaleItemDto> items,  int? totalQty,  int? totalAmount,  DateTime? createdAt,  DateTime? completedAt,  String? createdByUserId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleDto() when $default != null:
return $default(_that.id,_that.saleNo,_that.saleDate,_that.saleMonth,_that.status,_that.items,_that.totalQty,_that.totalAmount,_that.createdAt,_that.completedAt,_that.createdByUserId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? saleNo,  String? saleDate,  String? saleMonth,  String? status,  List<ResellerVoucherSaleItemDto> items,  int? totalQty,  int? totalAmount,  DateTime? createdAt,  DateTime? completedAt,  String? createdByUserId)  $default,) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleDto():
return $default(_that.id,_that.saleNo,_that.saleDate,_that.saleMonth,_that.status,_that.items,_that.totalQty,_that.totalAmount,_that.createdAt,_that.completedAt,_that.createdByUserId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? saleNo,  String? saleDate,  String? saleMonth,  String? status,  List<ResellerVoucherSaleItemDto> items,  int? totalQty,  int? totalAmount,  DateTime? createdAt,  DateTime? completedAt,  String? createdByUserId)?  $default,) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleDto() when $default != null:
return $default(_that.id,_that.saleNo,_that.saleDate,_that.saleMonth,_that.status,_that.items,_that.totalQty,_that.totalAmount,_that.createdAt,_that.completedAt,_that.createdByUserId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResellerVoucherSaleDto implements ResellerVoucherSaleDto {
  const _ResellerVoucherSaleDto({required this.id, this.saleNo, this.saleDate, this.saleMonth, this.status, final  List<ResellerVoucherSaleItemDto> items = const <ResellerVoucherSaleItemDto>[], this.totalQty, this.totalAmount, this.createdAt, this.completedAt, this.createdByUserId}): _items = items;
  factory _ResellerVoucherSaleDto.fromJson(Map<String, dynamic> json) => _$ResellerVoucherSaleDtoFromJson(json);

@override final  String id;
@override final  String? saleNo;
@override final  String? saleDate;
@override final  String? saleMonth;
@override final  String? status;
 final  List<ResellerVoucherSaleItemDto> _items;
@override@JsonKey() List<ResellerVoucherSaleItemDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int? totalQty;
@override final  int? totalAmount;
@override final  DateTime? createdAt;
@override final  DateTime? completedAt;
@override final  String? createdByUserId;

/// Create a copy of ResellerVoucherSaleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResellerVoucherSaleDtoCopyWith<_ResellerVoucherSaleDto> get copyWith => __$ResellerVoucherSaleDtoCopyWithImpl<_ResellerVoucherSaleDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResellerVoucherSaleDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResellerVoucherSaleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.saleNo, saleNo) || other.saleNo == saleNo)&&(identical(other.saleDate, saleDate) || other.saleDate == saleDate)&&(identical(other.saleMonth, saleMonth) || other.saleMonth == saleMonth)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalQty, totalQty) || other.totalQty == totalQty)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdByUserId, createdByUserId) || other.createdByUserId == createdByUserId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,saleNo,saleDate,saleMonth,status,const DeepCollectionEquality().hash(_items),totalQty,totalAmount,createdAt,completedAt,createdByUserId);

@override
String toString() {
  return 'ResellerVoucherSaleDto(id: $id, saleNo: $saleNo, saleDate: $saleDate, saleMonth: $saleMonth, status: $status, items: $items, totalQty: $totalQty, totalAmount: $totalAmount, createdAt: $createdAt, completedAt: $completedAt, createdByUserId: $createdByUserId)';
}


}

/// @nodoc
abstract mixin class _$ResellerVoucherSaleDtoCopyWith<$Res> implements $ResellerVoucherSaleDtoCopyWith<$Res> {
  factory _$ResellerVoucherSaleDtoCopyWith(_ResellerVoucherSaleDto value, $Res Function(_ResellerVoucherSaleDto) _then) = __$ResellerVoucherSaleDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String? saleNo, String? saleDate, String? saleMonth, String? status, List<ResellerVoucherSaleItemDto> items, int? totalQty, int? totalAmount, DateTime? createdAt, DateTime? completedAt, String? createdByUserId
});




}
/// @nodoc
class __$ResellerVoucherSaleDtoCopyWithImpl<$Res>
    implements _$ResellerVoucherSaleDtoCopyWith<$Res> {
  __$ResellerVoucherSaleDtoCopyWithImpl(this._self, this._then);

  final _ResellerVoucherSaleDto _self;
  final $Res Function(_ResellerVoucherSaleDto) _then;

/// Create a copy of ResellerVoucherSaleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? saleNo = freezed,Object? saleDate = freezed,Object? saleMonth = freezed,Object? status = freezed,Object? items = null,Object? totalQty = freezed,Object? totalAmount = freezed,Object? createdAt = freezed,Object? completedAt = freezed,Object? createdByUserId = freezed,}) {
  return _then(_ResellerVoucherSaleDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,saleNo: freezed == saleNo ? _self.saleNo : saleNo // ignore: cast_nullable_to_non_nullable
as String?,saleDate: freezed == saleDate ? _self.saleDate : saleDate // ignore: cast_nullable_to_non_nullable
as String?,saleMonth: freezed == saleMonth ? _self.saleMonth : saleMonth // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ResellerVoucherSaleItemDto>,totalQty: freezed == totalQty ? _self.totalQty : totalQty // ignore: cast_nullable_to_non_nullable
as int?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdByUserId: freezed == createdByUserId ? _self.createdByUserId : createdByUserId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
