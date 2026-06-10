// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reseller_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResellerDto {

 UserDto get user;@JsonKey(name: 'venuePhoto') String? get venuePhoto; SubDistrictDto? get subDistrict;@JsonKey(fromJson: _intFromJson) int get commissionRate;@JsonKey(fromJson: _intFromJson) int get commissionAmount;@JsonKey(fromJson: _doubleFromJson) double? get lat;@JsonKey(fromJson: _doubleFromJson) double? get lng; String? get phone;
/// Create a copy of ResellerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResellerDtoCopyWith<ResellerDto> get copyWith => _$ResellerDtoCopyWithImpl<ResellerDto>(this as ResellerDto, _$identity);

  /// Serializes this ResellerDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResellerDto&&(identical(other.user, user) || other.user == user)&&(identical(other.venuePhoto, venuePhoto) || other.venuePhoto == venuePhoto)&&(identical(other.subDistrict, subDistrict) || other.subDistrict == subDistrict)&&(identical(other.commissionRate, commissionRate) || other.commissionRate == commissionRate)&&(identical(other.commissionAmount, commissionAmount) || other.commissionAmount == commissionAmount)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,venuePhoto,subDistrict,commissionRate,commissionAmount,lat,lng,phone);

@override
String toString() {
  return 'ResellerDto(user: $user, venuePhoto: $venuePhoto, subDistrict: $subDistrict, commissionRate: $commissionRate, commissionAmount: $commissionAmount, lat: $lat, lng: $lng, phone: $phone)';
}


}

/// @nodoc
abstract mixin class $ResellerDtoCopyWith<$Res>  {
  factory $ResellerDtoCopyWith(ResellerDto value, $Res Function(ResellerDto) _then) = _$ResellerDtoCopyWithImpl;
@useResult
$Res call({
 UserDto user,@JsonKey(name: 'venuePhoto') String? venuePhoto, SubDistrictDto? subDistrict,@JsonKey(fromJson: _intFromJson) int commissionRate,@JsonKey(fromJson: _intFromJson) int commissionAmount,@JsonKey(fromJson: _doubleFromJson) double? lat,@JsonKey(fromJson: _doubleFromJson) double? lng, String? phone
});


$UserDtoCopyWith<$Res> get user;$SubDistrictDtoCopyWith<$Res>? get subDistrict;

}
/// @nodoc
class _$ResellerDtoCopyWithImpl<$Res>
    implements $ResellerDtoCopyWith<$Res> {
  _$ResellerDtoCopyWithImpl(this._self, this._then);

  final ResellerDto _self;
  final $Res Function(ResellerDto) _then;

/// Create a copy of ResellerDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? venuePhoto = freezed,Object? subDistrict = freezed,Object? commissionRate = null,Object? commissionAmount = null,Object? lat = freezed,Object? lng = freezed,Object? phone = freezed,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDto,venuePhoto: freezed == venuePhoto ? _self.venuePhoto : venuePhoto // ignore: cast_nullable_to_non_nullable
as String?,subDistrict: freezed == subDistrict ? _self.subDistrict : subDistrict // ignore: cast_nullable_to_non_nullable
as SubDistrictDto?,commissionRate: null == commissionRate ? _self.commissionRate : commissionRate // ignore: cast_nullable_to_non_nullable
as int,commissionAmount: null == commissionAmount ? _self.commissionAmount : commissionAmount // ignore: cast_nullable_to_non_nullable
as int,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ResellerDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res> get user {
  
  return $UserDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of ResellerDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubDistrictDtoCopyWith<$Res>? get subDistrict {
    if (_self.subDistrict == null) {
    return null;
  }

  return $SubDistrictDtoCopyWith<$Res>(_self.subDistrict!, (value) {
    return _then(_self.copyWith(subDistrict: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResellerDto].
extension ResellerDtoPatterns on ResellerDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResellerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResellerDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResellerDto value)  $default,){
final _that = this;
switch (_that) {
case _ResellerDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResellerDto value)?  $default,){
final _that = this;
switch (_that) {
case _ResellerDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserDto user, @JsonKey(name: 'venuePhoto')  String? venuePhoto,  SubDistrictDto? subDistrict, @JsonKey(fromJson: _intFromJson)  int commissionRate, @JsonKey(fromJson: _intFromJson)  int commissionAmount, @JsonKey(fromJson: _doubleFromJson)  double? lat, @JsonKey(fromJson: _doubleFromJson)  double? lng,  String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResellerDto() when $default != null:
return $default(_that.user,_that.venuePhoto,_that.subDistrict,_that.commissionRate,_that.commissionAmount,_that.lat,_that.lng,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserDto user, @JsonKey(name: 'venuePhoto')  String? venuePhoto,  SubDistrictDto? subDistrict, @JsonKey(fromJson: _intFromJson)  int commissionRate, @JsonKey(fromJson: _intFromJson)  int commissionAmount, @JsonKey(fromJson: _doubleFromJson)  double? lat, @JsonKey(fromJson: _doubleFromJson)  double? lng,  String? phone)  $default,) {final _that = this;
switch (_that) {
case _ResellerDto():
return $default(_that.user,_that.venuePhoto,_that.subDistrict,_that.commissionRate,_that.commissionAmount,_that.lat,_that.lng,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserDto user, @JsonKey(name: 'venuePhoto')  String? venuePhoto,  SubDistrictDto? subDistrict, @JsonKey(fromJson: _intFromJson)  int commissionRate, @JsonKey(fromJson: _intFromJson)  int commissionAmount, @JsonKey(fromJson: _doubleFromJson)  double? lat, @JsonKey(fromJson: _doubleFromJson)  double? lng,  String? phone)?  $default,) {final _that = this;
switch (_that) {
case _ResellerDto() when $default != null:
return $default(_that.user,_that.venuePhoto,_that.subDistrict,_that.commissionRate,_that.commissionAmount,_that.lat,_that.lng,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResellerDto implements ResellerDto {
  const _ResellerDto({required this.user, @JsonKey(name: 'venuePhoto') this.venuePhoto, this.subDistrict, @JsonKey(fromJson: _intFromJson) this.commissionRate = 0, @JsonKey(fromJson: _intFromJson) this.commissionAmount = 0, @JsonKey(fromJson: _doubleFromJson) this.lat, @JsonKey(fromJson: _doubleFromJson) this.lng, this.phone});
  factory _ResellerDto.fromJson(Map<String, dynamic> json) => _$ResellerDtoFromJson(json);

@override final  UserDto user;
@override@JsonKey(name: 'venuePhoto') final  String? venuePhoto;
@override final  SubDistrictDto? subDistrict;
@override@JsonKey(fromJson: _intFromJson) final  int commissionRate;
@override@JsonKey(fromJson: _intFromJson) final  int commissionAmount;
@override@JsonKey(fromJson: _doubleFromJson) final  double? lat;
@override@JsonKey(fromJson: _doubleFromJson) final  double? lng;
@override final  String? phone;

/// Create a copy of ResellerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResellerDtoCopyWith<_ResellerDto> get copyWith => __$ResellerDtoCopyWithImpl<_ResellerDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResellerDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResellerDto&&(identical(other.user, user) || other.user == user)&&(identical(other.venuePhoto, venuePhoto) || other.venuePhoto == venuePhoto)&&(identical(other.subDistrict, subDistrict) || other.subDistrict == subDistrict)&&(identical(other.commissionRate, commissionRate) || other.commissionRate == commissionRate)&&(identical(other.commissionAmount, commissionAmount) || other.commissionAmount == commissionAmount)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,venuePhoto,subDistrict,commissionRate,commissionAmount,lat,lng,phone);

@override
String toString() {
  return 'ResellerDto(user: $user, venuePhoto: $venuePhoto, subDistrict: $subDistrict, commissionRate: $commissionRate, commissionAmount: $commissionAmount, lat: $lat, lng: $lng, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$ResellerDtoCopyWith<$Res> implements $ResellerDtoCopyWith<$Res> {
  factory _$ResellerDtoCopyWith(_ResellerDto value, $Res Function(_ResellerDto) _then) = __$ResellerDtoCopyWithImpl;
@override @useResult
$Res call({
 UserDto user,@JsonKey(name: 'venuePhoto') String? venuePhoto, SubDistrictDto? subDistrict,@JsonKey(fromJson: _intFromJson) int commissionRate,@JsonKey(fromJson: _intFromJson) int commissionAmount,@JsonKey(fromJson: _doubleFromJson) double? lat,@JsonKey(fromJson: _doubleFromJson) double? lng, String? phone
});


@override $UserDtoCopyWith<$Res> get user;@override $SubDistrictDtoCopyWith<$Res>? get subDistrict;

}
/// @nodoc
class __$ResellerDtoCopyWithImpl<$Res>
    implements _$ResellerDtoCopyWith<$Res> {
  __$ResellerDtoCopyWithImpl(this._self, this._then);

  final _ResellerDto _self;
  final $Res Function(_ResellerDto) _then;

/// Create a copy of ResellerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? venuePhoto = freezed,Object? subDistrict = freezed,Object? commissionRate = null,Object? commissionAmount = null,Object? lat = freezed,Object? lng = freezed,Object? phone = freezed,}) {
  return _then(_ResellerDto(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDto,venuePhoto: freezed == venuePhoto ? _self.venuePhoto : venuePhoto // ignore: cast_nullable_to_non_nullable
as String?,subDistrict: freezed == subDistrict ? _self.subDistrict : subDistrict // ignore: cast_nullable_to_non_nullable
as SubDistrictDto?,commissionRate: null == commissionRate ? _self.commissionRate : commissionRate // ignore: cast_nullable_to_non_nullable
as int,commissionAmount: null == commissionAmount ? _self.commissionAmount : commissionAmount // ignore: cast_nullable_to_non_nullable
as int,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ResellerDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res> get user {
  
  return $UserDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of ResellerDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubDistrictDtoCopyWith<$Res>? get subDistrict {
    if (_self.subDistrict == null) {
    return null;
  }

  return $SubDistrictDtoCopyWith<$Res>(_self.subDistrict!, (value) {
    return _then(_self.copyWith(subDistrict: value));
  });
}
}

// dart format on
