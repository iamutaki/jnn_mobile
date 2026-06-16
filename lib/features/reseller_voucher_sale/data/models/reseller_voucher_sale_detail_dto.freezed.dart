// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reseller_voucher_sale_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AllocatedCodeDto {

 String get id; String? get status; String? get code;
/// Create a copy of AllocatedCodeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllocatedCodeDtoCopyWith<AllocatedCodeDto> get copyWith => _$AllocatedCodeDtoCopyWithImpl<AllocatedCodeDto>(this as AllocatedCodeDto, _$identity);

  /// Serializes this AllocatedCodeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllocatedCodeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,code);

@override
String toString() {
  return 'AllocatedCodeDto(id: $id, status: $status, code: $code)';
}


}

/// @nodoc
abstract mixin class $AllocatedCodeDtoCopyWith<$Res>  {
  factory $AllocatedCodeDtoCopyWith(AllocatedCodeDto value, $Res Function(AllocatedCodeDto) _then) = _$AllocatedCodeDtoCopyWithImpl;
@useResult
$Res call({
 String id, String? status, String? code
});




}
/// @nodoc
class _$AllocatedCodeDtoCopyWithImpl<$Res>
    implements $AllocatedCodeDtoCopyWith<$Res> {
  _$AllocatedCodeDtoCopyWithImpl(this._self, this._then);

  final AllocatedCodeDto _self;
  final $Res Function(AllocatedCodeDto) _then;

/// Create a copy of AllocatedCodeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = freezed,Object? code = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AllocatedCodeDto].
extension AllocatedCodeDtoPatterns on AllocatedCodeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AllocatedCodeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AllocatedCodeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AllocatedCodeDto value)  $default,){
final _that = this;
switch (_that) {
case _AllocatedCodeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AllocatedCodeDto value)?  $default,){
final _that = this;
switch (_that) {
case _AllocatedCodeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? status,  String? code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AllocatedCodeDto() when $default != null:
return $default(_that.id,_that.status,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? status,  String? code)  $default,) {final _that = this;
switch (_that) {
case _AllocatedCodeDto():
return $default(_that.id,_that.status,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? status,  String? code)?  $default,) {final _that = this;
switch (_that) {
case _AllocatedCodeDto() when $default != null:
return $default(_that.id,_that.status,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AllocatedCodeDto implements AllocatedCodeDto {
  const _AllocatedCodeDto({required this.id, this.status, this.code});
  factory _AllocatedCodeDto.fromJson(Map<String, dynamic> json) => _$AllocatedCodeDtoFromJson(json);

@override final  String id;
@override final  String? status;
@override final  String? code;

/// Create a copy of AllocatedCodeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AllocatedCodeDtoCopyWith<_AllocatedCodeDto> get copyWith => __$AllocatedCodeDtoCopyWithImpl<_AllocatedCodeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AllocatedCodeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllocatedCodeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,code);

@override
String toString() {
  return 'AllocatedCodeDto(id: $id, status: $status, code: $code)';
}


}

/// @nodoc
abstract mixin class _$AllocatedCodeDtoCopyWith<$Res> implements $AllocatedCodeDtoCopyWith<$Res> {
  factory _$AllocatedCodeDtoCopyWith(_AllocatedCodeDto value, $Res Function(_AllocatedCodeDto) _then) = __$AllocatedCodeDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String? status, String? code
});




}
/// @nodoc
class __$AllocatedCodeDtoCopyWithImpl<$Res>
    implements _$AllocatedCodeDtoCopyWith<$Res> {
  __$AllocatedCodeDtoCopyWithImpl(this._self, this._then);

  final _AllocatedCodeDto _self;
  final $Res Function(_AllocatedCodeDto) _then;

/// Create a copy of AllocatedCodeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = freezed,Object? code = freezed,}) {
  return _then(_AllocatedCodeDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ResellerVoucherSaleDetailItemDto {

 String? get id; String get voucherId; int get qty; int get unitPrice; int? get totalAmount; List<AllocatedCodeDto> get allocatedCodes;
/// Create a copy of ResellerVoucherSaleDetailItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResellerVoucherSaleDetailItemDtoCopyWith<ResellerVoucherSaleDetailItemDto> get copyWith => _$ResellerVoucherSaleDetailItemDtoCopyWithImpl<ResellerVoucherSaleDetailItemDto>(this as ResellerVoucherSaleDetailItemDto, _$identity);

  /// Serializes this ResellerVoucherSaleDetailItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResellerVoucherSaleDetailItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.voucherId, voucherId) || other.voucherId == voucherId)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&const DeepCollectionEquality().equals(other.allocatedCodes, allocatedCodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,voucherId,qty,unitPrice,totalAmount,const DeepCollectionEquality().hash(allocatedCodes));

@override
String toString() {
  return 'ResellerVoucherSaleDetailItemDto(id: $id, voucherId: $voucherId, qty: $qty, unitPrice: $unitPrice, totalAmount: $totalAmount, allocatedCodes: $allocatedCodes)';
}


}

/// @nodoc
abstract mixin class $ResellerVoucherSaleDetailItemDtoCopyWith<$Res>  {
  factory $ResellerVoucherSaleDetailItemDtoCopyWith(ResellerVoucherSaleDetailItemDto value, $Res Function(ResellerVoucherSaleDetailItemDto) _then) = _$ResellerVoucherSaleDetailItemDtoCopyWithImpl;
@useResult
$Res call({
 String? id, String voucherId, int qty, int unitPrice, int? totalAmount, List<AllocatedCodeDto> allocatedCodes
});




}
/// @nodoc
class _$ResellerVoucherSaleDetailItemDtoCopyWithImpl<$Res>
    implements $ResellerVoucherSaleDetailItemDtoCopyWith<$Res> {
  _$ResellerVoucherSaleDetailItemDtoCopyWithImpl(this._self, this._then);

  final ResellerVoucherSaleDetailItemDto _self;
  final $Res Function(ResellerVoucherSaleDetailItemDto) _then;

/// Create a copy of ResellerVoucherSaleDetailItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? voucherId = null,Object? qty = null,Object? unitPrice = null,Object? totalAmount = freezed,Object? allocatedCodes = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,voucherId: null == voucherId ? _self.voucherId : voucherId // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int?,allocatedCodes: null == allocatedCodes ? _self.allocatedCodes : allocatedCodes // ignore: cast_nullable_to_non_nullable
as List<AllocatedCodeDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ResellerVoucherSaleDetailItemDto].
extension ResellerVoucherSaleDetailItemDtoPatterns on ResellerVoucherSaleDetailItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResellerVoucherSaleDetailItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleDetailItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResellerVoucherSaleDetailItemDto value)  $default,){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleDetailItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResellerVoucherSaleDetailItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleDetailItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String voucherId,  int qty,  int unitPrice,  int? totalAmount,  List<AllocatedCodeDto> allocatedCodes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleDetailItemDto() when $default != null:
return $default(_that.id,_that.voucherId,_that.qty,_that.unitPrice,_that.totalAmount,_that.allocatedCodes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String voucherId,  int qty,  int unitPrice,  int? totalAmount,  List<AllocatedCodeDto> allocatedCodes)  $default,) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleDetailItemDto():
return $default(_that.id,_that.voucherId,_that.qty,_that.unitPrice,_that.totalAmount,_that.allocatedCodes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String voucherId,  int qty,  int unitPrice,  int? totalAmount,  List<AllocatedCodeDto> allocatedCodes)?  $default,) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleDetailItemDto() when $default != null:
return $default(_that.id,_that.voucherId,_that.qty,_that.unitPrice,_that.totalAmount,_that.allocatedCodes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResellerVoucherSaleDetailItemDto implements ResellerVoucherSaleDetailItemDto {
  const _ResellerVoucherSaleDetailItemDto({this.id, required this.voucherId, required this.qty, required this.unitPrice, this.totalAmount, final  List<AllocatedCodeDto> allocatedCodes = const <AllocatedCodeDto>[]}): _allocatedCodes = allocatedCodes;
  factory _ResellerVoucherSaleDetailItemDto.fromJson(Map<String, dynamic> json) => _$ResellerVoucherSaleDetailItemDtoFromJson(json);

@override final  String? id;
@override final  String voucherId;
@override final  int qty;
@override final  int unitPrice;
@override final  int? totalAmount;
 final  List<AllocatedCodeDto> _allocatedCodes;
@override@JsonKey() List<AllocatedCodeDto> get allocatedCodes {
  if (_allocatedCodes is EqualUnmodifiableListView) return _allocatedCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allocatedCodes);
}


/// Create a copy of ResellerVoucherSaleDetailItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResellerVoucherSaleDetailItemDtoCopyWith<_ResellerVoucherSaleDetailItemDto> get copyWith => __$ResellerVoucherSaleDetailItemDtoCopyWithImpl<_ResellerVoucherSaleDetailItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResellerVoucherSaleDetailItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResellerVoucherSaleDetailItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.voucherId, voucherId) || other.voucherId == voucherId)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&const DeepCollectionEquality().equals(other._allocatedCodes, _allocatedCodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,voucherId,qty,unitPrice,totalAmount,const DeepCollectionEquality().hash(_allocatedCodes));

@override
String toString() {
  return 'ResellerVoucherSaleDetailItemDto(id: $id, voucherId: $voucherId, qty: $qty, unitPrice: $unitPrice, totalAmount: $totalAmount, allocatedCodes: $allocatedCodes)';
}


}

/// @nodoc
abstract mixin class _$ResellerVoucherSaleDetailItemDtoCopyWith<$Res> implements $ResellerVoucherSaleDetailItemDtoCopyWith<$Res> {
  factory _$ResellerVoucherSaleDetailItemDtoCopyWith(_ResellerVoucherSaleDetailItemDto value, $Res Function(_ResellerVoucherSaleDetailItemDto) _then) = __$ResellerVoucherSaleDetailItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String? id, String voucherId, int qty, int unitPrice, int? totalAmount, List<AllocatedCodeDto> allocatedCodes
});




}
/// @nodoc
class __$ResellerVoucherSaleDetailItemDtoCopyWithImpl<$Res>
    implements _$ResellerVoucherSaleDetailItemDtoCopyWith<$Res> {
  __$ResellerVoucherSaleDetailItemDtoCopyWithImpl(this._self, this._then);

  final _ResellerVoucherSaleDetailItemDto _self;
  final $Res Function(_ResellerVoucherSaleDetailItemDto) _then;

/// Create a copy of ResellerVoucherSaleDetailItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? voucherId = null,Object? qty = null,Object? unitPrice = null,Object? totalAmount = freezed,Object? allocatedCodes = null,}) {
  return _then(_ResellerVoucherSaleDetailItemDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,voucherId: null == voucherId ? _self.voucherId : voucherId // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int?,allocatedCodes: null == allocatedCodes ? _self._allocatedCodes : allocatedCodes // ignore: cast_nullable_to_non_nullable
as List<AllocatedCodeDto>,
  ));
}


}


/// @nodoc
mixin _$ResellerVoucherSaleDetailDto {

 String get id; String? get resellerId; String? get saleNo; String get saleDate; String get saleMonth; int? get totalQty; int? get totalAmount; String get status; DateTime? get completedAt; DateTime? get cancelledAt; List<ResellerVoucherSaleDetailItemDto> get items;
/// Create a copy of ResellerVoucherSaleDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResellerVoucherSaleDetailDtoCopyWith<ResellerVoucherSaleDetailDto> get copyWith => _$ResellerVoucherSaleDetailDtoCopyWithImpl<ResellerVoucherSaleDetailDto>(this as ResellerVoucherSaleDetailDto, _$identity);

  /// Serializes this ResellerVoucherSaleDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResellerVoucherSaleDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.resellerId, resellerId) || other.resellerId == resellerId)&&(identical(other.saleNo, saleNo) || other.saleNo == saleNo)&&(identical(other.saleDate, saleDate) || other.saleDate == saleDate)&&(identical(other.saleMonth, saleMonth) || other.saleMonth == saleMonth)&&(identical(other.totalQty, totalQty) || other.totalQty == totalQty)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,resellerId,saleNo,saleDate,saleMonth,totalQty,totalAmount,status,completedAt,cancelledAt,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ResellerVoucherSaleDetailDto(id: $id, resellerId: $resellerId, saleNo: $saleNo, saleDate: $saleDate, saleMonth: $saleMonth, totalQty: $totalQty, totalAmount: $totalAmount, status: $status, completedAt: $completedAt, cancelledAt: $cancelledAt, items: $items)';
}


}

/// @nodoc
abstract mixin class $ResellerVoucherSaleDetailDtoCopyWith<$Res>  {
  factory $ResellerVoucherSaleDetailDtoCopyWith(ResellerVoucherSaleDetailDto value, $Res Function(ResellerVoucherSaleDetailDto) _then) = _$ResellerVoucherSaleDetailDtoCopyWithImpl;
@useResult
$Res call({
 String id, String? resellerId, String? saleNo, String saleDate, String saleMonth, int? totalQty, int? totalAmount, String status, DateTime? completedAt, DateTime? cancelledAt, List<ResellerVoucherSaleDetailItemDto> items
});




}
/// @nodoc
class _$ResellerVoucherSaleDetailDtoCopyWithImpl<$Res>
    implements $ResellerVoucherSaleDetailDtoCopyWith<$Res> {
  _$ResellerVoucherSaleDetailDtoCopyWithImpl(this._self, this._then);

  final ResellerVoucherSaleDetailDto _self;
  final $Res Function(ResellerVoucherSaleDetailDto) _then;

/// Create a copy of ResellerVoucherSaleDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? resellerId = freezed,Object? saleNo = freezed,Object? saleDate = null,Object? saleMonth = null,Object? totalQty = freezed,Object? totalAmount = freezed,Object? status = null,Object? completedAt = freezed,Object? cancelledAt = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,resellerId: freezed == resellerId ? _self.resellerId : resellerId // ignore: cast_nullable_to_non_nullable
as String?,saleNo: freezed == saleNo ? _self.saleNo : saleNo // ignore: cast_nullable_to_non_nullable
as String?,saleDate: null == saleDate ? _self.saleDate : saleDate // ignore: cast_nullable_to_non_nullable
as String,saleMonth: null == saleMonth ? _self.saleMonth : saleMonth // ignore: cast_nullable_to_non_nullable
as String,totalQty: freezed == totalQty ? _self.totalQty : totalQty // ignore: cast_nullable_to_non_nullable
as int?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ResellerVoucherSaleDetailItemDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ResellerVoucherSaleDetailDto].
extension ResellerVoucherSaleDetailDtoPatterns on ResellerVoucherSaleDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResellerVoucherSaleDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResellerVoucherSaleDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResellerVoucherSaleDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? resellerId,  String? saleNo,  String saleDate,  String saleMonth,  int? totalQty,  int? totalAmount,  String status,  DateTime? completedAt,  DateTime? cancelledAt,  List<ResellerVoucherSaleDetailItemDto> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleDetailDto() when $default != null:
return $default(_that.id,_that.resellerId,_that.saleNo,_that.saleDate,_that.saleMonth,_that.totalQty,_that.totalAmount,_that.status,_that.completedAt,_that.cancelledAt,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? resellerId,  String? saleNo,  String saleDate,  String saleMonth,  int? totalQty,  int? totalAmount,  String status,  DateTime? completedAt,  DateTime? cancelledAt,  List<ResellerVoucherSaleDetailItemDto> items)  $default,) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleDetailDto():
return $default(_that.id,_that.resellerId,_that.saleNo,_that.saleDate,_that.saleMonth,_that.totalQty,_that.totalAmount,_that.status,_that.completedAt,_that.cancelledAt,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? resellerId,  String? saleNo,  String saleDate,  String saleMonth,  int? totalQty,  int? totalAmount,  String status,  DateTime? completedAt,  DateTime? cancelledAt,  List<ResellerVoucherSaleDetailItemDto> items)?  $default,) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleDetailDto() when $default != null:
return $default(_that.id,_that.resellerId,_that.saleNo,_that.saleDate,_that.saleMonth,_that.totalQty,_that.totalAmount,_that.status,_that.completedAt,_that.cancelledAt,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResellerVoucherSaleDetailDto implements ResellerVoucherSaleDetailDto {
  const _ResellerVoucherSaleDetailDto({required this.id, this.resellerId, this.saleNo, required this.saleDate, required this.saleMonth, this.totalQty, this.totalAmount, required this.status, this.completedAt, this.cancelledAt, final  List<ResellerVoucherSaleDetailItemDto> items = const <ResellerVoucherSaleDetailItemDto>[]}): _items = items;
  factory _ResellerVoucherSaleDetailDto.fromJson(Map<String, dynamic> json) => _$ResellerVoucherSaleDetailDtoFromJson(json);

@override final  String id;
@override final  String? resellerId;
@override final  String? saleNo;
@override final  String saleDate;
@override final  String saleMonth;
@override final  int? totalQty;
@override final  int? totalAmount;
@override final  String status;
@override final  DateTime? completedAt;
@override final  DateTime? cancelledAt;
 final  List<ResellerVoucherSaleDetailItemDto> _items;
@override@JsonKey() List<ResellerVoucherSaleDetailItemDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ResellerVoucherSaleDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResellerVoucherSaleDetailDtoCopyWith<_ResellerVoucherSaleDetailDto> get copyWith => __$ResellerVoucherSaleDetailDtoCopyWithImpl<_ResellerVoucherSaleDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResellerVoucherSaleDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResellerVoucherSaleDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.resellerId, resellerId) || other.resellerId == resellerId)&&(identical(other.saleNo, saleNo) || other.saleNo == saleNo)&&(identical(other.saleDate, saleDate) || other.saleDate == saleDate)&&(identical(other.saleMonth, saleMonth) || other.saleMonth == saleMonth)&&(identical(other.totalQty, totalQty) || other.totalQty == totalQty)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,resellerId,saleNo,saleDate,saleMonth,totalQty,totalAmount,status,completedAt,cancelledAt,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ResellerVoucherSaleDetailDto(id: $id, resellerId: $resellerId, saleNo: $saleNo, saleDate: $saleDate, saleMonth: $saleMonth, totalQty: $totalQty, totalAmount: $totalAmount, status: $status, completedAt: $completedAt, cancelledAt: $cancelledAt, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ResellerVoucherSaleDetailDtoCopyWith<$Res> implements $ResellerVoucherSaleDetailDtoCopyWith<$Res> {
  factory _$ResellerVoucherSaleDetailDtoCopyWith(_ResellerVoucherSaleDetailDto value, $Res Function(_ResellerVoucherSaleDetailDto) _then) = __$ResellerVoucherSaleDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String? resellerId, String? saleNo, String saleDate, String saleMonth, int? totalQty, int? totalAmount, String status, DateTime? completedAt, DateTime? cancelledAt, List<ResellerVoucherSaleDetailItemDto> items
});




}
/// @nodoc
class __$ResellerVoucherSaleDetailDtoCopyWithImpl<$Res>
    implements _$ResellerVoucherSaleDetailDtoCopyWith<$Res> {
  __$ResellerVoucherSaleDetailDtoCopyWithImpl(this._self, this._then);

  final _ResellerVoucherSaleDetailDto _self;
  final $Res Function(_ResellerVoucherSaleDetailDto) _then;

/// Create a copy of ResellerVoucherSaleDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? resellerId = freezed,Object? saleNo = freezed,Object? saleDate = null,Object? saleMonth = null,Object? totalQty = freezed,Object? totalAmount = freezed,Object? status = null,Object? completedAt = freezed,Object? cancelledAt = freezed,Object? items = null,}) {
  return _then(_ResellerVoucherSaleDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,resellerId: freezed == resellerId ? _self.resellerId : resellerId // ignore: cast_nullable_to_non_nullable
as String?,saleNo: freezed == saleNo ? _self.saleNo : saleNo // ignore: cast_nullable_to_non_nullable
as String?,saleDate: null == saleDate ? _self.saleDate : saleDate // ignore: cast_nullable_to_non_nullable
as String,saleMonth: null == saleMonth ? _self.saleMonth : saleMonth // ignore: cast_nullable_to_non_nullable
as String,totalQty: freezed == totalQty ? _self.totalQty : totalQty // ignore: cast_nullable_to_non_nullable
as int?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ResellerVoucherSaleDetailItemDto>,
  ));
}


}

// dart format on
