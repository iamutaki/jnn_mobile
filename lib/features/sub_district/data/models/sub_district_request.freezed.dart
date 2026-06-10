// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_district_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubDistrictRequest {

 String get districtId; String get name;
/// Create a copy of SubDistrictRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubDistrictRequestCopyWith<SubDistrictRequest> get copyWith => _$SubDistrictRequestCopyWithImpl<SubDistrictRequest>(this as SubDistrictRequest, _$identity);

  /// Serializes this SubDistrictRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubDistrictRequest&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,districtId,name);

@override
String toString() {
  return 'SubDistrictRequest(districtId: $districtId, name: $name)';
}


}

/// @nodoc
abstract mixin class $SubDistrictRequestCopyWith<$Res>  {
  factory $SubDistrictRequestCopyWith(SubDistrictRequest value, $Res Function(SubDistrictRequest) _then) = _$SubDistrictRequestCopyWithImpl;
@useResult
$Res call({
 String districtId, String name
});




}
/// @nodoc
class _$SubDistrictRequestCopyWithImpl<$Res>
    implements $SubDistrictRequestCopyWith<$Res> {
  _$SubDistrictRequestCopyWithImpl(this._self, this._then);

  final SubDistrictRequest _self;
  final $Res Function(SubDistrictRequest) _then;

/// Create a copy of SubDistrictRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? districtId = null,Object? name = null,}) {
  return _then(_self.copyWith(
districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SubDistrictRequest].
extension SubDistrictRequestPatterns on SubDistrictRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubDistrictRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubDistrictRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubDistrictRequest value)  $default,){
final _that = this;
switch (_that) {
case _SubDistrictRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubDistrictRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SubDistrictRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String districtId,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubDistrictRequest() when $default != null:
return $default(_that.districtId,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String districtId,  String name)  $default,) {final _that = this;
switch (_that) {
case _SubDistrictRequest():
return $default(_that.districtId,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String districtId,  String name)?  $default,) {final _that = this;
switch (_that) {
case _SubDistrictRequest() when $default != null:
return $default(_that.districtId,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubDistrictRequest implements SubDistrictRequest {
  const _SubDistrictRequest({required this.districtId, required this.name});
  factory _SubDistrictRequest.fromJson(Map<String, dynamic> json) => _$SubDistrictRequestFromJson(json);

@override final  String districtId;
@override final  String name;

/// Create a copy of SubDistrictRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubDistrictRequestCopyWith<_SubDistrictRequest> get copyWith => __$SubDistrictRequestCopyWithImpl<_SubDistrictRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubDistrictRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubDistrictRequest&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,districtId,name);

@override
String toString() {
  return 'SubDistrictRequest(districtId: $districtId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SubDistrictRequestCopyWith<$Res> implements $SubDistrictRequestCopyWith<$Res> {
  factory _$SubDistrictRequestCopyWith(_SubDistrictRequest value, $Res Function(_SubDistrictRequest) _then) = __$SubDistrictRequestCopyWithImpl;
@override @useResult
$Res call({
 String districtId, String name
});




}
/// @nodoc
class __$SubDistrictRequestCopyWithImpl<$Res>
    implements _$SubDistrictRequestCopyWith<$Res> {
  __$SubDistrictRequestCopyWithImpl(this._self, this._then);

  final _SubDistrictRequest _self;
  final $Res Function(_SubDistrictRequest) _then;

/// Create a copy of SubDistrictRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? districtId = null,Object? name = null,}) {
  return _then(_SubDistrictRequest(
districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
