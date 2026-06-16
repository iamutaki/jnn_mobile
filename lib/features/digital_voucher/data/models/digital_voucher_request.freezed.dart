// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'digital_voucher_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DigitalVoucherBulkRequest {

 List<DigitalVoucherItem> get items;
/// Create a copy of DigitalVoucherBulkRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DigitalVoucherBulkRequestCopyWith<DigitalVoucherBulkRequest> get copyWith => _$DigitalVoucherBulkRequestCopyWithImpl<DigitalVoucherBulkRequest>(this as DigitalVoucherBulkRequest, _$identity);

  /// Serializes this DigitalVoucherBulkRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DigitalVoucherBulkRequest&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'DigitalVoucherBulkRequest(items: $items)';
}


}

/// @nodoc
abstract mixin class $DigitalVoucherBulkRequestCopyWith<$Res>  {
  factory $DigitalVoucherBulkRequestCopyWith(DigitalVoucherBulkRequest value, $Res Function(DigitalVoucherBulkRequest) _then) = _$DigitalVoucherBulkRequestCopyWithImpl;
@useResult
$Res call({
 List<DigitalVoucherItem> items
});




}
/// @nodoc
class _$DigitalVoucherBulkRequestCopyWithImpl<$Res>
    implements $DigitalVoucherBulkRequestCopyWith<$Res> {
  _$DigitalVoucherBulkRequestCopyWithImpl(this._self, this._then);

  final DigitalVoucherBulkRequest _self;
  final $Res Function(DigitalVoucherBulkRequest) _then;

/// Create a copy of DigitalVoucherBulkRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<DigitalVoucherItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [DigitalVoucherBulkRequest].
extension DigitalVoucherBulkRequestPatterns on DigitalVoucherBulkRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DigitalVoucherBulkRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DigitalVoucherBulkRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DigitalVoucherBulkRequest value)  $default,){
final _that = this;
switch (_that) {
case _DigitalVoucherBulkRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DigitalVoucherBulkRequest value)?  $default,){
final _that = this;
switch (_that) {
case _DigitalVoucherBulkRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DigitalVoucherItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DigitalVoucherBulkRequest() when $default != null:
return $default(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DigitalVoucherItem> items)  $default,) {final _that = this;
switch (_that) {
case _DigitalVoucherBulkRequest():
return $default(_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DigitalVoucherItem> items)?  $default,) {final _that = this;
switch (_that) {
case _DigitalVoucherBulkRequest() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DigitalVoucherBulkRequest implements DigitalVoucherBulkRequest {
  const _DigitalVoucherBulkRequest({required final  List<DigitalVoucherItem> items}): _items = items;
  factory _DigitalVoucherBulkRequest.fromJson(Map<String, dynamic> json) => _$DigitalVoucherBulkRequestFromJson(json);

 final  List<DigitalVoucherItem> _items;
@override List<DigitalVoucherItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of DigitalVoucherBulkRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DigitalVoucherBulkRequestCopyWith<_DigitalVoucherBulkRequest> get copyWith => __$DigitalVoucherBulkRequestCopyWithImpl<_DigitalVoucherBulkRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DigitalVoucherBulkRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DigitalVoucherBulkRequest&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'DigitalVoucherBulkRequest(items: $items)';
}


}

/// @nodoc
abstract mixin class _$DigitalVoucherBulkRequestCopyWith<$Res> implements $DigitalVoucherBulkRequestCopyWith<$Res> {
  factory _$DigitalVoucherBulkRequestCopyWith(_DigitalVoucherBulkRequest value, $Res Function(_DigitalVoucherBulkRequest) _then) = __$DigitalVoucherBulkRequestCopyWithImpl;
@override @useResult
$Res call({
 List<DigitalVoucherItem> items
});




}
/// @nodoc
class __$DigitalVoucherBulkRequestCopyWithImpl<$Res>
    implements _$DigitalVoucherBulkRequestCopyWith<$Res> {
  __$DigitalVoucherBulkRequestCopyWithImpl(this._self, this._then);

  final _DigitalVoucherBulkRequest _self;
  final $Res Function(_DigitalVoucherBulkRequest) _then;

/// Create a copy of DigitalVoucherBulkRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_DigitalVoucherBulkRequest(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<DigitalVoucherItem>,
  ));
}


}


/// @nodoc
mixin _$DigitalVoucherItem {

 String get voucherId; String get code; String? get subDistrictId;
/// Create a copy of DigitalVoucherItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DigitalVoucherItemCopyWith<DigitalVoucherItem> get copyWith => _$DigitalVoucherItemCopyWithImpl<DigitalVoucherItem>(this as DigitalVoucherItem, _$identity);

  /// Serializes this DigitalVoucherItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DigitalVoucherItem&&(identical(other.voucherId, voucherId) || other.voucherId == voucherId)&&(identical(other.code, code) || other.code == code)&&(identical(other.subDistrictId, subDistrictId) || other.subDistrictId == subDistrictId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,voucherId,code,subDistrictId);

@override
String toString() {
  return 'DigitalVoucherItem(voucherId: $voucherId, code: $code, subDistrictId: $subDistrictId)';
}


}

/// @nodoc
abstract mixin class $DigitalVoucherItemCopyWith<$Res>  {
  factory $DigitalVoucherItemCopyWith(DigitalVoucherItem value, $Res Function(DigitalVoucherItem) _then) = _$DigitalVoucherItemCopyWithImpl;
@useResult
$Res call({
 String voucherId, String code, String? subDistrictId
});




}
/// @nodoc
class _$DigitalVoucherItemCopyWithImpl<$Res>
    implements $DigitalVoucherItemCopyWith<$Res> {
  _$DigitalVoucherItemCopyWithImpl(this._self, this._then);

  final DigitalVoucherItem _self;
  final $Res Function(DigitalVoucherItem) _then;

/// Create a copy of DigitalVoucherItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? voucherId = null,Object? code = null,Object? subDistrictId = freezed,}) {
  return _then(_self.copyWith(
voucherId: null == voucherId ? _self.voucherId : voucherId // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,subDistrictId: freezed == subDistrictId ? _self.subDistrictId : subDistrictId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DigitalVoucherItem].
extension DigitalVoucherItemPatterns on DigitalVoucherItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DigitalVoucherItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DigitalVoucherItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DigitalVoucherItem value)  $default,){
final _that = this;
switch (_that) {
case _DigitalVoucherItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DigitalVoucherItem value)?  $default,){
final _that = this;
switch (_that) {
case _DigitalVoucherItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String voucherId,  String code,  String? subDistrictId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DigitalVoucherItem() when $default != null:
return $default(_that.voucherId,_that.code,_that.subDistrictId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String voucherId,  String code,  String? subDistrictId)  $default,) {final _that = this;
switch (_that) {
case _DigitalVoucherItem():
return $default(_that.voucherId,_that.code,_that.subDistrictId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String voucherId,  String code,  String? subDistrictId)?  $default,) {final _that = this;
switch (_that) {
case _DigitalVoucherItem() when $default != null:
return $default(_that.voucherId,_that.code,_that.subDistrictId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DigitalVoucherItem implements DigitalVoucherItem {
  const _DigitalVoucherItem({required this.voucherId, required this.code, this.subDistrictId});
  factory _DigitalVoucherItem.fromJson(Map<String, dynamic> json) => _$DigitalVoucherItemFromJson(json);

@override final  String voucherId;
@override final  String code;
@override final  String? subDistrictId;

/// Create a copy of DigitalVoucherItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DigitalVoucherItemCopyWith<_DigitalVoucherItem> get copyWith => __$DigitalVoucherItemCopyWithImpl<_DigitalVoucherItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DigitalVoucherItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DigitalVoucherItem&&(identical(other.voucherId, voucherId) || other.voucherId == voucherId)&&(identical(other.code, code) || other.code == code)&&(identical(other.subDistrictId, subDistrictId) || other.subDistrictId == subDistrictId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,voucherId,code,subDistrictId);

@override
String toString() {
  return 'DigitalVoucherItem(voucherId: $voucherId, code: $code, subDistrictId: $subDistrictId)';
}


}

/// @nodoc
abstract mixin class _$DigitalVoucherItemCopyWith<$Res> implements $DigitalVoucherItemCopyWith<$Res> {
  factory _$DigitalVoucherItemCopyWith(_DigitalVoucherItem value, $Res Function(_DigitalVoucherItem) _then) = __$DigitalVoucherItemCopyWithImpl;
@override @useResult
$Res call({
 String voucherId, String code, String? subDistrictId
});




}
/// @nodoc
class __$DigitalVoucherItemCopyWithImpl<$Res>
    implements _$DigitalVoucherItemCopyWith<$Res> {
  __$DigitalVoucherItemCopyWithImpl(this._self, this._then);

  final _DigitalVoucherItem _self;
  final $Res Function(_DigitalVoucherItem) _then;

/// Create a copy of DigitalVoucherItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? voucherId = null,Object? code = null,Object? subDistrictId = freezed,}) {
  return _then(_DigitalVoucherItem(
voucherId: null == voucherId ? _self.voucherId : voucherId // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,subDistrictId: freezed == subDistrictId ? _self.subDistrictId : subDistrictId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
