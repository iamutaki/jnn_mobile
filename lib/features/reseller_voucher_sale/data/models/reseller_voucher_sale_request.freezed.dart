// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reseller_voucher_sale_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResellerVoucherSaleRequest {

 String get saleDate; String get saleMonth; List<ResellerVoucherSaleItem> get items;
/// Create a copy of ResellerVoucherSaleRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResellerVoucherSaleRequestCopyWith<ResellerVoucherSaleRequest> get copyWith => _$ResellerVoucherSaleRequestCopyWithImpl<ResellerVoucherSaleRequest>(this as ResellerVoucherSaleRequest, _$identity);

  /// Serializes this ResellerVoucherSaleRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResellerVoucherSaleRequest&&(identical(other.saleDate, saleDate) || other.saleDate == saleDate)&&(identical(other.saleMonth, saleMonth) || other.saleMonth == saleMonth)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,saleDate,saleMonth,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ResellerVoucherSaleRequest(saleDate: $saleDate, saleMonth: $saleMonth, items: $items)';
}


}

/// @nodoc
abstract mixin class $ResellerVoucherSaleRequestCopyWith<$Res>  {
  factory $ResellerVoucherSaleRequestCopyWith(ResellerVoucherSaleRequest value, $Res Function(ResellerVoucherSaleRequest) _then) = _$ResellerVoucherSaleRequestCopyWithImpl;
@useResult
$Res call({
 String saleDate, String saleMonth, List<ResellerVoucherSaleItem> items
});




}
/// @nodoc
class _$ResellerVoucherSaleRequestCopyWithImpl<$Res>
    implements $ResellerVoucherSaleRequestCopyWith<$Res> {
  _$ResellerVoucherSaleRequestCopyWithImpl(this._self, this._then);

  final ResellerVoucherSaleRequest _self;
  final $Res Function(ResellerVoucherSaleRequest) _then;

/// Create a copy of ResellerVoucherSaleRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? saleDate = null,Object? saleMonth = null,Object? items = null,}) {
  return _then(_self.copyWith(
saleDate: null == saleDate ? _self.saleDate : saleDate // ignore: cast_nullable_to_non_nullable
as String,saleMonth: null == saleMonth ? _self.saleMonth : saleMonth // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ResellerVoucherSaleItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [ResellerVoucherSaleRequest].
extension ResellerVoucherSaleRequestPatterns on ResellerVoucherSaleRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResellerVoucherSaleRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResellerVoucherSaleRequest value)  $default,){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResellerVoucherSaleRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String saleDate,  String saleMonth,  List<ResellerVoucherSaleItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleRequest() when $default != null:
return $default(_that.saleDate,_that.saleMonth,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String saleDate,  String saleMonth,  List<ResellerVoucherSaleItem> items)  $default,) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleRequest():
return $default(_that.saleDate,_that.saleMonth,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String saleDate,  String saleMonth,  List<ResellerVoucherSaleItem> items)?  $default,) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleRequest() when $default != null:
return $default(_that.saleDate,_that.saleMonth,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResellerVoucherSaleRequest implements ResellerVoucherSaleRequest {
  const _ResellerVoucherSaleRequest({required this.saleDate, required this.saleMonth, required final  List<ResellerVoucherSaleItem> items}): _items = items;
  factory _ResellerVoucherSaleRequest.fromJson(Map<String, dynamic> json) => _$ResellerVoucherSaleRequestFromJson(json);

@override final  String saleDate;
@override final  String saleMonth;
 final  List<ResellerVoucherSaleItem> _items;
@override List<ResellerVoucherSaleItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ResellerVoucherSaleRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResellerVoucherSaleRequestCopyWith<_ResellerVoucherSaleRequest> get copyWith => __$ResellerVoucherSaleRequestCopyWithImpl<_ResellerVoucherSaleRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResellerVoucherSaleRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResellerVoucherSaleRequest&&(identical(other.saleDate, saleDate) || other.saleDate == saleDate)&&(identical(other.saleMonth, saleMonth) || other.saleMonth == saleMonth)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,saleDate,saleMonth,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ResellerVoucherSaleRequest(saleDate: $saleDate, saleMonth: $saleMonth, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ResellerVoucherSaleRequestCopyWith<$Res> implements $ResellerVoucherSaleRequestCopyWith<$Res> {
  factory _$ResellerVoucherSaleRequestCopyWith(_ResellerVoucherSaleRequest value, $Res Function(_ResellerVoucherSaleRequest) _then) = __$ResellerVoucherSaleRequestCopyWithImpl;
@override @useResult
$Res call({
 String saleDate, String saleMonth, List<ResellerVoucherSaleItem> items
});




}
/// @nodoc
class __$ResellerVoucherSaleRequestCopyWithImpl<$Res>
    implements _$ResellerVoucherSaleRequestCopyWith<$Res> {
  __$ResellerVoucherSaleRequestCopyWithImpl(this._self, this._then);

  final _ResellerVoucherSaleRequest _self;
  final $Res Function(_ResellerVoucherSaleRequest) _then;

/// Create a copy of ResellerVoucherSaleRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? saleDate = null,Object? saleMonth = null,Object? items = null,}) {
  return _then(_ResellerVoucherSaleRequest(
saleDate: null == saleDate ? _self.saleDate : saleDate // ignore: cast_nullable_to_non_nullable
as String,saleMonth: null == saleMonth ? _self.saleMonth : saleMonth // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ResellerVoucherSaleItem>,
  ));
}


}


/// @nodoc
mixin _$ResellerVoucherSaleItem {

 String get voucherId; int get qty; int get unitPrice;
/// Create a copy of ResellerVoucherSaleItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResellerVoucherSaleItemCopyWith<ResellerVoucherSaleItem> get copyWith => _$ResellerVoucherSaleItemCopyWithImpl<ResellerVoucherSaleItem>(this as ResellerVoucherSaleItem, _$identity);

  /// Serializes this ResellerVoucherSaleItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResellerVoucherSaleItem&&(identical(other.voucherId, voucherId) || other.voucherId == voucherId)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,voucherId,qty,unitPrice);

@override
String toString() {
  return 'ResellerVoucherSaleItem(voucherId: $voucherId, qty: $qty, unitPrice: $unitPrice)';
}


}

/// @nodoc
abstract mixin class $ResellerVoucherSaleItemCopyWith<$Res>  {
  factory $ResellerVoucherSaleItemCopyWith(ResellerVoucherSaleItem value, $Res Function(ResellerVoucherSaleItem) _then) = _$ResellerVoucherSaleItemCopyWithImpl;
@useResult
$Res call({
 String voucherId, int qty, int unitPrice
});




}
/// @nodoc
class _$ResellerVoucherSaleItemCopyWithImpl<$Res>
    implements $ResellerVoucherSaleItemCopyWith<$Res> {
  _$ResellerVoucherSaleItemCopyWithImpl(this._self, this._then);

  final ResellerVoucherSaleItem _self;
  final $Res Function(ResellerVoucherSaleItem) _then;

/// Create a copy of ResellerVoucherSaleItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? voucherId = null,Object? qty = null,Object? unitPrice = null,}) {
  return _then(_self.copyWith(
voucherId: null == voucherId ? _self.voucherId : voucherId // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ResellerVoucherSaleItem].
extension ResellerVoucherSaleItemPatterns on ResellerVoucherSaleItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResellerVoucherSaleItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResellerVoucherSaleItem value)  $default,){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResellerVoucherSaleItem value)?  $default,){
final _that = this;
switch (_that) {
case _ResellerVoucherSaleItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String voucherId,  int qty,  int unitPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleItem() when $default != null:
return $default(_that.voucherId,_that.qty,_that.unitPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String voucherId,  int qty,  int unitPrice)  $default,) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleItem():
return $default(_that.voucherId,_that.qty,_that.unitPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String voucherId,  int qty,  int unitPrice)?  $default,) {final _that = this;
switch (_that) {
case _ResellerVoucherSaleItem() when $default != null:
return $default(_that.voucherId,_that.qty,_that.unitPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResellerVoucherSaleItem implements ResellerVoucherSaleItem {
  const _ResellerVoucherSaleItem({required this.voucherId, required this.qty, required this.unitPrice});
  factory _ResellerVoucherSaleItem.fromJson(Map<String, dynamic> json) => _$ResellerVoucherSaleItemFromJson(json);

@override final  String voucherId;
@override final  int qty;
@override final  int unitPrice;

/// Create a copy of ResellerVoucherSaleItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResellerVoucherSaleItemCopyWith<_ResellerVoucherSaleItem> get copyWith => __$ResellerVoucherSaleItemCopyWithImpl<_ResellerVoucherSaleItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResellerVoucherSaleItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResellerVoucherSaleItem&&(identical(other.voucherId, voucherId) || other.voucherId == voucherId)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,voucherId,qty,unitPrice);

@override
String toString() {
  return 'ResellerVoucherSaleItem(voucherId: $voucherId, qty: $qty, unitPrice: $unitPrice)';
}


}

/// @nodoc
abstract mixin class _$ResellerVoucherSaleItemCopyWith<$Res> implements $ResellerVoucherSaleItemCopyWith<$Res> {
  factory _$ResellerVoucherSaleItemCopyWith(_ResellerVoucherSaleItem value, $Res Function(_ResellerVoucherSaleItem) _then) = __$ResellerVoucherSaleItemCopyWithImpl;
@override @useResult
$Res call({
 String voucherId, int qty, int unitPrice
});




}
/// @nodoc
class __$ResellerVoucherSaleItemCopyWithImpl<$Res>
    implements _$ResellerVoucherSaleItemCopyWith<$Res> {
  __$ResellerVoucherSaleItemCopyWithImpl(this._self, this._then);

  final _ResellerVoucherSaleItem _self;
  final $Res Function(_ResellerVoucherSaleItem) _then;

/// Create a copy of ResellerVoucherSaleItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? voucherId = null,Object? qty = null,Object? unitPrice = null,}) {
  return _then(_ResellerVoucherSaleItem(
voucherId: null == voucherId ? _self.voucherId : voucherId // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
