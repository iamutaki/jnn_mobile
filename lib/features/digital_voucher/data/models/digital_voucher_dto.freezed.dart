// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'digital_voucher_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DigitalVoucherDto {

 String get id; String? get voucherId; String? get subDistrictId; String? get importId; String? get status; String? get soldToResellerId; String? get soldSaleId; DateTime? get soldAt; String? get code;
/// Create a copy of DigitalVoucherDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DigitalVoucherDtoCopyWith<DigitalVoucherDto> get copyWith => _$DigitalVoucherDtoCopyWithImpl<DigitalVoucherDto>(this as DigitalVoucherDto, _$identity);

  /// Serializes this DigitalVoucherDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DigitalVoucherDto&&(identical(other.id, id) || other.id == id)&&(identical(other.voucherId, voucherId) || other.voucherId == voucherId)&&(identical(other.subDistrictId, subDistrictId) || other.subDistrictId == subDistrictId)&&(identical(other.importId, importId) || other.importId == importId)&&(identical(other.status, status) || other.status == status)&&(identical(other.soldToResellerId, soldToResellerId) || other.soldToResellerId == soldToResellerId)&&(identical(other.soldSaleId, soldSaleId) || other.soldSaleId == soldSaleId)&&(identical(other.soldAt, soldAt) || other.soldAt == soldAt)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,voucherId,subDistrictId,importId,status,soldToResellerId,soldSaleId,soldAt,code);

@override
String toString() {
  return 'DigitalVoucherDto(id: $id, voucherId: $voucherId, subDistrictId: $subDistrictId, importId: $importId, status: $status, soldToResellerId: $soldToResellerId, soldSaleId: $soldSaleId, soldAt: $soldAt, code: $code)';
}


}

/// @nodoc
abstract mixin class $DigitalVoucherDtoCopyWith<$Res>  {
  factory $DigitalVoucherDtoCopyWith(DigitalVoucherDto value, $Res Function(DigitalVoucherDto) _then) = _$DigitalVoucherDtoCopyWithImpl;
@useResult
$Res call({
 String id, String? voucherId, String? subDistrictId, String? importId, String? status, String? soldToResellerId, String? soldSaleId, DateTime? soldAt, String? code
});




}
/// @nodoc
class _$DigitalVoucherDtoCopyWithImpl<$Res>
    implements $DigitalVoucherDtoCopyWith<$Res> {
  _$DigitalVoucherDtoCopyWithImpl(this._self, this._then);

  final DigitalVoucherDto _self;
  final $Res Function(DigitalVoucherDto) _then;

/// Create a copy of DigitalVoucherDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? voucherId = freezed,Object? subDistrictId = freezed,Object? importId = freezed,Object? status = freezed,Object? soldToResellerId = freezed,Object? soldSaleId = freezed,Object? soldAt = freezed,Object? code = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,voucherId: freezed == voucherId ? _self.voucherId : voucherId // ignore: cast_nullable_to_non_nullable
as String?,subDistrictId: freezed == subDistrictId ? _self.subDistrictId : subDistrictId // ignore: cast_nullable_to_non_nullable
as String?,importId: freezed == importId ? _self.importId : importId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,soldToResellerId: freezed == soldToResellerId ? _self.soldToResellerId : soldToResellerId // ignore: cast_nullable_to_non_nullable
as String?,soldSaleId: freezed == soldSaleId ? _self.soldSaleId : soldSaleId // ignore: cast_nullable_to_non_nullable
as String?,soldAt: freezed == soldAt ? _self.soldAt : soldAt // ignore: cast_nullable_to_non_nullable
as DateTime?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DigitalVoucherDto].
extension DigitalVoucherDtoPatterns on DigitalVoucherDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DigitalVoucherDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DigitalVoucherDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DigitalVoucherDto value)  $default,){
final _that = this;
switch (_that) {
case _DigitalVoucherDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DigitalVoucherDto value)?  $default,){
final _that = this;
switch (_that) {
case _DigitalVoucherDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? voucherId,  String? subDistrictId,  String? importId,  String? status,  String? soldToResellerId,  String? soldSaleId,  DateTime? soldAt,  String? code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DigitalVoucherDto() when $default != null:
return $default(_that.id,_that.voucherId,_that.subDistrictId,_that.importId,_that.status,_that.soldToResellerId,_that.soldSaleId,_that.soldAt,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? voucherId,  String? subDistrictId,  String? importId,  String? status,  String? soldToResellerId,  String? soldSaleId,  DateTime? soldAt,  String? code)  $default,) {final _that = this;
switch (_that) {
case _DigitalVoucherDto():
return $default(_that.id,_that.voucherId,_that.subDistrictId,_that.importId,_that.status,_that.soldToResellerId,_that.soldSaleId,_that.soldAt,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? voucherId,  String? subDistrictId,  String? importId,  String? status,  String? soldToResellerId,  String? soldSaleId,  DateTime? soldAt,  String? code)?  $default,) {final _that = this;
switch (_that) {
case _DigitalVoucherDto() when $default != null:
return $default(_that.id,_that.voucherId,_that.subDistrictId,_that.importId,_that.status,_that.soldToResellerId,_that.soldSaleId,_that.soldAt,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DigitalVoucherDto implements DigitalVoucherDto {
  const _DigitalVoucherDto({required this.id, this.voucherId, this.subDistrictId, this.importId, this.status, this.soldToResellerId, this.soldSaleId, this.soldAt, this.code});
  factory _DigitalVoucherDto.fromJson(Map<String, dynamic> json) => _$DigitalVoucherDtoFromJson(json);

@override final  String id;
@override final  String? voucherId;
@override final  String? subDistrictId;
@override final  String? importId;
@override final  String? status;
@override final  String? soldToResellerId;
@override final  String? soldSaleId;
@override final  DateTime? soldAt;
@override final  String? code;

/// Create a copy of DigitalVoucherDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DigitalVoucherDtoCopyWith<_DigitalVoucherDto> get copyWith => __$DigitalVoucherDtoCopyWithImpl<_DigitalVoucherDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DigitalVoucherDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DigitalVoucherDto&&(identical(other.id, id) || other.id == id)&&(identical(other.voucherId, voucherId) || other.voucherId == voucherId)&&(identical(other.subDistrictId, subDistrictId) || other.subDistrictId == subDistrictId)&&(identical(other.importId, importId) || other.importId == importId)&&(identical(other.status, status) || other.status == status)&&(identical(other.soldToResellerId, soldToResellerId) || other.soldToResellerId == soldToResellerId)&&(identical(other.soldSaleId, soldSaleId) || other.soldSaleId == soldSaleId)&&(identical(other.soldAt, soldAt) || other.soldAt == soldAt)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,voucherId,subDistrictId,importId,status,soldToResellerId,soldSaleId,soldAt,code);

@override
String toString() {
  return 'DigitalVoucherDto(id: $id, voucherId: $voucherId, subDistrictId: $subDistrictId, importId: $importId, status: $status, soldToResellerId: $soldToResellerId, soldSaleId: $soldSaleId, soldAt: $soldAt, code: $code)';
}


}

/// @nodoc
abstract mixin class _$DigitalVoucherDtoCopyWith<$Res> implements $DigitalVoucherDtoCopyWith<$Res> {
  factory _$DigitalVoucherDtoCopyWith(_DigitalVoucherDto value, $Res Function(_DigitalVoucherDto) _then) = __$DigitalVoucherDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String? voucherId, String? subDistrictId, String? importId, String? status, String? soldToResellerId, String? soldSaleId, DateTime? soldAt, String? code
});




}
/// @nodoc
class __$DigitalVoucherDtoCopyWithImpl<$Res>
    implements _$DigitalVoucherDtoCopyWith<$Res> {
  __$DigitalVoucherDtoCopyWithImpl(this._self, this._then);

  final _DigitalVoucherDto _self;
  final $Res Function(_DigitalVoucherDto) _then;

/// Create a copy of DigitalVoucherDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? voucherId = freezed,Object? subDistrictId = freezed,Object? importId = freezed,Object? status = freezed,Object? soldToResellerId = freezed,Object? soldSaleId = freezed,Object? soldAt = freezed,Object? code = freezed,}) {
  return _then(_DigitalVoucherDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,voucherId: freezed == voucherId ? _self.voucherId : voucherId // ignore: cast_nullable_to_non_nullable
as String?,subDistrictId: freezed == subDistrictId ? _self.subDistrictId : subDistrictId // ignore: cast_nullable_to_non_nullable
as String?,importId: freezed == importId ? _self.importId : importId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,soldToResellerId: freezed == soldToResellerId ? _self.soldToResellerId : soldToResellerId // ignore: cast_nullable_to_non_nullable
as String?,soldSaleId: freezed == soldSaleId ? _self.soldSaleId : soldSaleId // ignore: cast_nullable_to_non_nullable
as String?,soldAt: freezed == soldAt ? _self.soldAt : soldAt // ignore: cast_nullable_to_non_nullable
as DateTime?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
