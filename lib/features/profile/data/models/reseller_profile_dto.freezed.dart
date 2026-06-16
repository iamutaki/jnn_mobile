// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reseller_profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResellerProfileDto {

/// Bisa `null`/kosong bila reseller belum dipetakan ke desa mana pun.
 String? get subDistrictId; double? get lat; double? get lon;
/// Create a copy of ResellerProfileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResellerProfileDtoCopyWith<ResellerProfileDto> get copyWith => _$ResellerProfileDtoCopyWithImpl<ResellerProfileDto>(this as ResellerProfileDto, _$identity);

  /// Serializes this ResellerProfileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResellerProfileDto&&(identical(other.subDistrictId, subDistrictId) || other.subDistrictId == subDistrictId)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subDistrictId,lat,lon);

@override
String toString() {
  return 'ResellerProfileDto(subDistrictId: $subDistrictId, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class $ResellerProfileDtoCopyWith<$Res>  {
  factory $ResellerProfileDtoCopyWith(ResellerProfileDto value, $Res Function(ResellerProfileDto) _then) = _$ResellerProfileDtoCopyWithImpl;
@useResult
$Res call({
 String? subDistrictId, double? lat, double? lon
});




}
/// @nodoc
class _$ResellerProfileDtoCopyWithImpl<$Res>
    implements $ResellerProfileDtoCopyWith<$Res> {
  _$ResellerProfileDtoCopyWithImpl(this._self, this._then);

  final ResellerProfileDto _self;
  final $Res Function(ResellerProfileDto) _then;

/// Create a copy of ResellerProfileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subDistrictId = freezed,Object? lat = freezed,Object? lon = freezed,}) {
  return _then(_self.copyWith(
subDistrictId: freezed == subDistrictId ? _self.subDistrictId : subDistrictId // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResellerProfileDto].
extension ResellerProfileDtoPatterns on ResellerProfileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResellerProfileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResellerProfileDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResellerProfileDto value)  $default,){
final _that = this;
switch (_that) {
case _ResellerProfileDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResellerProfileDto value)?  $default,){
final _that = this;
switch (_that) {
case _ResellerProfileDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? subDistrictId,  double? lat,  double? lon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResellerProfileDto() when $default != null:
return $default(_that.subDistrictId,_that.lat,_that.lon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? subDistrictId,  double? lat,  double? lon)  $default,) {final _that = this;
switch (_that) {
case _ResellerProfileDto():
return $default(_that.subDistrictId,_that.lat,_that.lon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? subDistrictId,  double? lat,  double? lon)?  $default,) {final _that = this;
switch (_that) {
case _ResellerProfileDto() when $default != null:
return $default(_that.subDistrictId,_that.lat,_that.lon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResellerProfileDto implements ResellerProfileDto {
  const _ResellerProfileDto({this.subDistrictId, this.lat, this.lon});
  factory _ResellerProfileDto.fromJson(Map<String, dynamic> json) => _$ResellerProfileDtoFromJson(json);

/// Bisa `null`/kosong bila reseller belum dipetakan ke desa mana pun.
@override final  String? subDistrictId;
@override final  double? lat;
@override final  double? lon;

/// Create a copy of ResellerProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResellerProfileDtoCopyWith<_ResellerProfileDto> get copyWith => __$ResellerProfileDtoCopyWithImpl<_ResellerProfileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResellerProfileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResellerProfileDto&&(identical(other.subDistrictId, subDistrictId) || other.subDistrictId == subDistrictId)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subDistrictId,lat,lon);

@override
String toString() {
  return 'ResellerProfileDto(subDistrictId: $subDistrictId, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class _$ResellerProfileDtoCopyWith<$Res> implements $ResellerProfileDtoCopyWith<$Res> {
  factory _$ResellerProfileDtoCopyWith(_ResellerProfileDto value, $Res Function(_ResellerProfileDto) _then) = __$ResellerProfileDtoCopyWithImpl;
@override @useResult
$Res call({
 String? subDistrictId, double? lat, double? lon
});




}
/// @nodoc
class __$ResellerProfileDtoCopyWithImpl<$Res>
    implements _$ResellerProfileDtoCopyWith<$Res> {
  __$ResellerProfileDtoCopyWithImpl(this._self, this._then);

  final _ResellerProfileDto _self;
  final $Res Function(_ResellerProfileDto) _then;

/// Create a copy of ResellerProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subDistrictId = freezed,Object? lat = freezed,Object? lon = freezed,}) {
  return _then(_ResellerProfileDto(
subDistrictId: freezed == subDistrictId ? _self.subDistrictId : subDistrictId // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
