// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reseller_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResellerRequest {

 String get name; String get username; String? get password; String? get phone; String? get avatar;@JsonKey(name: 'venuePhoto') String? get venuePhoto;@JsonKey(name: 'subDistrictId') String? get subDistrictId;@JsonKey(name: 'commissionRate') int? get commissionRate;@JsonKey(name: 'commissionAmount') int? get commissionAmount; double? get lat; double? get lng;
/// Create a copy of ResellerRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResellerRequestCopyWith<ResellerRequest> get copyWith => _$ResellerRequestCopyWithImpl<ResellerRequest>(this as ResellerRequest, _$identity);

  /// Serializes this ResellerRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResellerRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.venuePhoto, venuePhoto) || other.venuePhoto == venuePhoto)&&(identical(other.subDistrictId, subDistrictId) || other.subDistrictId == subDistrictId)&&(identical(other.commissionRate, commissionRate) || other.commissionRate == commissionRate)&&(identical(other.commissionAmount, commissionAmount) || other.commissionAmount == commissionAmount)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,username,password,phone,avatar,venuePhoto,subDistrictId,commissionRate,commissionAmount,lat,lng);

@override
String toString() {
  return 'ResellerRequest(name: $name, username: $username, password: $password, phone: $phone, avatar: $avatar, venuePhoto: $venuePhoto, subDistrictId: $subDistrictId, commissionRate: $commissionRate, commissionAmount: $commissionAmount, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $ResellerRequestCopyWith<$Res>  {
  factory $ResellerRequestCopyWith(ResellerRequest value, $Res Function(ResellerRequest) _then) = _$ResellerRequestCopyWithImpl;
@useResult
$Res call({
 String name, String username, String? password, String? phone, String? avatar,@JsonKey(name: 'venuePhoto') String? venuePhoto,@JsonKey(name: 'subDistrictId') String? subDistrictId,@JsonKey(name: 'commissionRate') int? commissionRate,@JsonKey(name: 'commissionAmount') int? commissionAmount, double? lat, double? lng
});




}
/// @nodoc
class _$ResellerRequestCopyWithImpl<$Res>
    implements $ResellerRequestCopyWith<$Res> {
  _$ResellerRequestCopyWithImpl(this._self, this._then);

  final ResellerRequest _self;
  final $Res Function(ResellerRequest) _then;

/// Create a copy of ResellerRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? username = null,Object? password = freezed,Object? phone = freezed,Object? avatar = freezed,Object? venuePhoto = freezed,Object? subDistrictId = freezed,Object? commissionRate = freezed,Object? commissionAmount = freezed,Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,venuePhoto: freezed == venuePhoto ? _self.venuePhoto : venuePhoto // ignore: cast_nullable_to_non_nullable
as String?,subDistrictId: freezed == subDistrictId ? _self.subDistrictId : subDistrictId // ignore: cast_nullable_to_non_nullable
as String?,commissionRate: freezed == commissionRate ? _self.commissionRate : commissionRate // ignore: cast_nullable_to_non_nullable
as int?,commissionAmount: freezed == commissionAmount ? _self.commissionAmount : commissionAmount // ignore: cast_nullable_to_non_nullable
as int?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResellerRequest].
extension ResellerRequestPatterns on ResellerRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResellerRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResellerRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResellerRequest value)  $default,){
final _that = this;
switch (_that) {
case _ResellerRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResellerRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ResellerRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String username,  String? password,  String? phone,  String? avatar, @JsonKey(name: 'venuePhoto')  String? venuePhoto, @JsonKey(name: 'subDistrictId')  String? subDistrictId, @JsonKey(name: 'commissionRate')  int? commissionRate, @JsonKey(name: 'commissionAmount')  int? commissionAmount,  double? lat,  double? lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResellerRequest() when $default != null:
return $default(_that.name,_that.username,_that.password,_that.phone,_that.avatar,_that.venuePhoto,_that.subDistrictId,_that.commissionRate,_that.commissionAmount,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String username,  String? password,  String? phone,  String? avatar, @JsonKey(name: 'venuePhoto')  String? venuePhoto, @JsonKey(name: 'subDistrictId')  String? subDistrictId, @JsonKey(name: 'commissionRate')  int? commissionRate, @JsonKey(name: 'commissionAmount')  int? commissionAmount,  double? lat,  double? lng)  $default,) {final _that = this;
switch (_that) {
case _ResellerRequest():
return $default(_that.name,_that.username,_that.password,_that.phone,_that.avatar,_that.venuePhoto,_that.subDistrictId,_that.commissionRate,_that.commissionAmount,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String username,  String? password,  String? phone,  String? avatar, @JsonKey(name: 'venuePhoto')  String? venuePhoto, @JsonKey(name: 'subDistrictId')  String? subDistrictId, @JsonKey(name: 'commissionRate')  int? commissionRate, @JsonKey(name: 'commissionAmount')  int? commissionAmount,  double? lat,  double? lng)?  $default,) {final _that = this;
switch (_that) {
case _ResellerRequest() when $default != null:
return $default(_that.name,_that.username,_that.password,_that.phone,_that.avatar,_that.venuePhoto,_that.subDistrictId,_that.commissionRate,_that.commissionAmount,_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResellerRequest implements ResellerRequest {
  const _ResellerRequest({required this.name, required this.username, this.password, this.phone, this.avatar, @JsonKey(name: 'venuePhoto') this.venuePhoto, @JsonKey(name: 'subDistrictId') this.subDistrictId, @JsonKey(name: 'commissionRate') this.commissionRate, @JsonKey(name: 'commissionAmount') this.commissionAmount, this.lat, this.lng});
  factory _ResellerRequest.fromJson(Map<String, dynamic> json) => _$ResellerRequestFromJson(json);

@override final  String name;
@override final  String username;
@override final  String? password;
@override final  String? phone;
@override final  String? avatar;
@override@JsonKey(name: 'venuePhoto') final  String? venuePhoto;
@override@JsonKey(name: 'subDistrictId') final  String? subDistrictId;
@override@JsonKey(name: 'commissionRate') final  int? commissionRate;
@override@JsonKey(name: 'commissionAmount') final  int? commissionAmount;
@override final  double? lat;
@override final  double? lng;

/// Create a copy of ResellerRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResellerRequestCopyWith<_ResellerRequest> get copyWith => __$ResellerRequestCopyWithImpl<_ResellerRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResellerRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResellerRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.venuePhoto, venuePhoto) || other.venuePhoto == venuePhoto)&&(identical(other.subDistrictId, subDistrictId) || other.subDistrictId == subDistrictId)&&(identical(other.commissionRate, commissionRate) || other.commissionRate == commissionRate)&&(identical(other.commissionAmount, commissionAmount) || other.commissionAmount == commissionAmount)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,username,password,phone,avatar,venuePhoto,subDistrictId,commissionRate,commissionAmount,lat,lng);

@override
String toString() {
  return 'ResellerRequest(name: $name, username: $username, password: $password, phone: $phone, avatar: $avatar, venuePhoto: $venuePhoto, subDistrictId: $subDistrictId, commissionRate: $commissionRate, commissionAmount: $commissionAmount, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$ResellerRequestCopyWith<$Res> implements $ResellerRequestCopyWith<$Res> {
  factory _$ResellerRequestCopyWith(_ResellerRequest value, $Res Function(_ResellerRequest) _then) = __$ResellerRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String username, String? password, String? phone, String? avatar,@JsonKey(name: 'venuePhoto') String? venuePhoto,@JsonKey(name: 'subDistrictId') String? subDistrictId,@JsonKey(name: 'commissionRate') int? commissionRate,@JsonKey(name: 'commissionAmount') int? commissionAmount, double? lat, double? lng
});




}
/// @nodoc
class __$ResellerRequestCopyWithImpl<$Res>
    implements _$ResellerRequestCopyWith<$Res> {
  __$ResellerRequestCopyWithImpl(this._self, this._then);

  final _ResellerRequest _self;
  final $Res Function(_ResellerRequest) _then;

/// Create a copy of ResellerRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? username = null,Object? password = freezed,Object? phone = freezed,Object? avatar = freezed,Object? venuePhoto = freezed,Object? subDistrictId = freezed,Object? commissionRate = freezed,Object? commissionAmount = freezed,Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_ResellerRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,venuePhoto: freezed == venuePhoto ? _self.venuePhoto : venuePhoto // ignore: cast_nullable_to_non_nullable
as String?,subDistrictId: freezed == subDistrictId ? _self.subDistrictId : subDistrictId // ignore: cast_nullable_to_non_nullable
as String?,commissionRate: freezed == commissionRate ? _self.commissionRate : commissionRate // ignore: cast_nullable_to_non_nullable
as int?,commissionAmount: freezed == commissionAmount ? _self.commissionAmount : commissionAmount // ignore: cast_nullable_to_non_nullable
as int?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
