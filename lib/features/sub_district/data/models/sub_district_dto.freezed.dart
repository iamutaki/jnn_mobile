// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_district_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubDistrictDto {

 String get id; String get name; String? get code; double? get lat; double? get lng; DistrictDto? get district;
/// Create a copy of SubDistrictDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubDistrictDtoCopyWith<SubDistrictDto> get copyWith => _$SubDistrictDtoCopyWithImpl<SubDistrictDto>(this as SubDistrictDto, _$identity);

  /// Serializes this SubDistrictDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubDistrictDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.district, district) || other.district == district));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,lat,lng,district);

@override
String toString() {
  return 'SubDistrictDto(id: $id, name: $name, code: $code, lat: $lat, lng: $lng, district: $district)';
}


}

/// @nodoc
abstract mixin class $SubDistrictDtoCopyWith<$Res>  {
  factory $SubDistrictDtoCopyWith(SubDistrictDto value, $Res Function(SubDistrictDto) _then) = _$SubDistrictDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? code, double? lat, double? lng, DistrictDto? district
});


$DistrictDtoCopyWith<$Res>? get district;

}
/// @nodoc
class _$SubDistrictDtoCopyWithImpl<$Res>
    implements $SubDistrictDtoCopyWith<$Res> {
  _$SubDistrictDtoCopyWithImpl(this._self, this._then);

  final SubDistrictDto _self;
  final $Res Function(SubDistrictDto) _then;

/// Create a copy of SubDistrictDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = freezed,Object? lat = freezed,Object? lng = freezed,Object? district = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictDto?,
  ));
}
/// Create a copy of SubDistrictDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistrictDtoCopyWith<$Res>? get district {
    if (_self.district == null) {
    return null;
  }

  return $DistrictDtoCopyWith<$Res>(_self.district!, (value) {
    return _then(_self.copyWith(district: value));
  });
}
}


/// Adds pattern-matching-related methods to [SubDistrictDto].
extension SubDistrictDtoPatterns on SubDistrictDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubDistrictDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubDistrictDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubDistrictDto value)  $default,){
final _that = this;
switch (_that) {
case _SubDistrictDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubDistrictDto value)?  $default,){
final _that = this;
switch (_that) {
case _SubDistrictDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? code,  double? lat,  double? lng,  DistrictDto? district)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubDistrictDto() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.lat,_that.lng,_that.district);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? code,  double? lat,  double? lng,  DistrictDto? district)  $default,) {final _that = this;
switch (_that) {
case _SubDistrictDto():
return $default(_that.id,_that.name,_that.code,_that.lat,_that.lng,_that.district);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? code,  double? lat,  double? lng,  DistrictDto? district)?  $default,) {final _that = this;
switch (_that) {
case _SubDistrictDto() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.lat,_that.lng,_that.district);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubDistrictDto implements SubDistrictDto {
  const _SubDistrictDto({this.id = '', required this.name, this.code, this.lat, this.lng, this.district});
  factory _SubDistrictDto.fromJson(Map<String, dynamic> json) => _$SubDistrictDtoFromJson(json);

@override@JsonKey() final  String id;
@override final  String name;
@override final  String? code;
@override final  double? lat;
@override final  double? lng;
@override final  DistrictDto? district;

/// Create a copy of SubDistrictDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubDistrictDtoCopyWith<_SubDistrictDto> get copyWith => __$SubDistrictDtoCopyWithImpl<_SubDistrictDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubDistrictDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubDistrictDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.district, district) || other.district == district));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,lat,lng,district);

@override
String toString() {
  return 'SubDistrictDto(id: $id, name: $name, code: $code, lat: $lat, lng: $lng, district: $district)';
}


}

/// @nodoc
abstract mixin class _$SubDistrictDtoCopyWith<$Res> implements $SubDistrictDtoCopyWith<$Res> {
  factory _$SubDistrictDtoCopyWith(_SubDistrictDto value, $Res Function(_SubDistrictDto) _then) = __$SubDistrictDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? code, double? lat, double? lng, DistrictDto? district
});


@override $DistrictDtoCopyWith<$Res>? get district;

}
/// @nodoc
class __$SubDistrictDtoCopyWithImpl<$Res>
    implements _$SubDistrictDtoCopyWith<$Res> {
  __$SubDistrictDtoCopyWithImpl(this._self, this._then);

  final _SubDistrictDto _self;
  final $Res Function(_SubDistrictDto) _then;

/// Create a copy of SubDistrictDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = freezed,Object? lat = freezed,Object? lng = freezed,Object? district = freezed,}) {
  return _then(_SubDistrictDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictDto?,
  ));
}

/// Create a copy of SubDistrictDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistrictDtoCopyWith<$Res>? get district {
    if (_self.district == null) {
    return null;
  }

  return $DistrictDtoCopyWith<$Res>(_self.district!, (value) {
    return _then(_self.copyWith(district: value));
  });
}
}

// dart format on
