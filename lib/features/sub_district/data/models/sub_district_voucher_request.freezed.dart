// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_district_voucher_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubDistrictVoucherRequest {

 List<String> get voucherIds;
/// Create a copy of SubDistrictVoucherRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubDistrictVoucherRequestCopyWith<SubDistrictVoucherRequest> get copyWith => _$SubDistrictVoucherRequestCopyWithImpl<SubDistrictVoucherRequest>(this as SubDistrictVoucherRequest, _$identity);

  /// Serializes this SubDistrictVoucherRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubDistrictVoucherRequest&&const DeepCollectionEquality().equals(other.voucherIds, voucherIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(voucherIds));

@override
String toString() {
  return 'SubDistrictVoucherRequest(voucherIds: $voucherIds)';
}


}

/// @nodoc
abstract mixin class $SubDistrictVoucherRequestCopyWith<$Res>  {
  factory $SubDistrictVoucherRequestCopyWith(SubDistrictVoucherRequest value, $Res Function(SubDistrictVoucherRequest) _then) = _$SubDistrictVoucherRequestCopyWithImpl;
@useResult
$Res call({
 List<String> voucherIds
});




}
/// @nodoc
class _$SubDistrictVoucherRequestCopyWithImpl<$Res>
    implements $SubDistrictVoucherRequestCopyWith<$Res> {
  _$SubDistrictVoucherRequestCopyWithImpl(this._self, this._then);

  final SubDistrictVoucherRequest _self;
  final $Res Function(SubDistrictVoucherRequest) _then;

/// Create a copy of SubDistrictVoucherRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? voucherIds = null,}) {
  return _then(_self.copyWith(
voucherIds: null == voucherIds ? _self.voucherIds : voucherIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SubDistrictVoucherRequest].
extension SubDistrictVoucherRequestPatterns on SubDistrictVoucherRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubDistrictVoucherRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubDistrictVoucherRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubDistrictVoucherRequest value)  $default,){
final _that = this;
switch (_that) {
case _SubDistrictVoucherRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubDistrictVoucherRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SubDistrictVoucherRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> voucherIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubDistrictVoucherRequest() when $default != null:
return $default(_that.voucherIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> voucherIds)  $default,) {final _that = this;
switch (_that) {
case _SubDistrictVoucherRequest():
return $default(_that.voucherIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> voucherIds)?  $default,) {final _that = this;
switch (_that) {
case _SubDistrictVoucherRequest() when $default != null:
return $default(_that.voucherIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubDistrictVoucherRequest implements SubDistrictVoucherRequest {
  const _SubDistrictVoucherRequest({final  List<String> voucherIds = const []}): _voucherIds = voucherIds;
  factory _SubDistrictVoucherRequest.fromJson(Map<String, dynamic> json) => _$SubDistrictVoucherRequestFromJson(json);

 final  List<String> _voucherIds;
@override@JsonKey() List<String> get voucherIds {
  if (_voucherIds is EqualUnmodifiableListView) return _voucherIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_voucherIds);
}


/// Create a copy of SubDistrictVoucherRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubDistrictVoucherRequestCopyWith<_SubDistrictVoucherRequest> get copyWith => __$SubDistrictVoucherRequestCopyWithImpl<_SubDistrictVoucherRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubDistrictVoucherRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubDistrictVoucherRequest&&const DeepCollectionEquality().equals(other._voucherIds, _voucherIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_voucherIds));

@override
String toString() {
  return 'SubDistrictVoucherRequest(voucherIds: $voucherIds)';
}


}

/// @nodoc
abstract mixin class _$SubDistrictVoucherRequestCopyWith<$Res> implements $SubDistrictVoucherRequestCopyWith<$Res> {
  factory _$SubDistrictVoucherRequestCopyWith(_SubDistrictVoucherRequest value, $Res Function(_SubDistrictVoucherRequest) _then) = __$SubDistrictVoucherRequestCopyWithImpl;
@override @useResult
$Res call({
 List<String> voucherIds
});




}
/// @nodoc
class __$SubDistrictVoucherRequestCopyWithImpl<$Res>
    implements _$SubDistrictVoucherRequestCopyWith<$Res> {
  __$SubDistrictVoucherRequestCopyWithImpl(this._self, this._then);

  final _SubDistrictVoucherRequest _self;
  final $Res Function(_SubDistrictVoucherRequest) _then;

/// Create a copy of SubDistrictVoucherRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? voucherIds = null,}) {
  return _then(_SubDistrictVoucherRequest(
voucherIds: null == voucherIds ? _self._voucherIds : voucherIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
