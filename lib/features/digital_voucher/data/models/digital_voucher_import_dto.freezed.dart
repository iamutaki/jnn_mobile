// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'digital_voucher_import_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DigitalVoucherImportDto {

 String get id; VoucherDto get voucher; SubDistrictDto? get subDistrict; int get totalCodes; String? get notes; DateTime get createdAt; String get createdByUserId;
/// Create a copy of DigitalVoucherImportDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DigitalVoucherImportDtoCopyWith<DigitalVoucherImportDto> get copyWith => _$DigitalVoucherImportDtoCopyWithImpl<DigitalVoucherImportDto>(this as DigitalVoucherImportDto, _$identity);

  /// Serializes this DigitalVoucherImportDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DigitalVoucherImportDto&&(identical(other.id, id) || other.id == id)&&(identical(other.voucher, voucher) || other.voucher == voucher)&&(identical(other.subDistrict, subDistrict) || other.subDistrict == subDistrict)&&(identical(other.totalCodes, totalCodes) || other.totalCodes == totalCodes)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdByUserId, createdByUserId) || other.createdByUserId == createdByUserId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,voucher,subDistrict,totalCodes,notes,createdAt,createdByUserId);

@override
String toString() {
  return 'DigitalVoucherImportDto(id: $id, voucher: $voucher, subDistrict: $subDistrict, totalCodes: $totalCodes, notes: $notes, createdAt: $createdAt, createdByUserId: $createdByUserId)';
}


}

/// @nodoc
abstract mixin class $DigitalVoucherImportDtoCopyWith<$Res>  {
  factory $DigitalVoucherImportDtoCopyWith(DigitalVoucherImportDto value, $Res Function(DigitalVoucherImportDto) _then) = _$DigitalVoucherImportDtoCopyWithImpl;
@useResult
$Res call({
 String id, VoucherDto voucher, SubDistrictDto? subDistrict, int totalCodes, String? notes, DateTime createdAt, String createdByUserId
});


$VoucherDtoCopyWith<$Res> get voucher;$SubDistrictDtoCopyWith<$Res>? get subDistrict;

}
/// @nodoc
class _$DigitalVoucherImportDtoCopyWithImpl<$Res>
    implements $DigitalVoucherImportDtoCopyWith<$Res> {
  _$DigitalVoucherImportDtoCopyWithImpl(this._self, this._then);

  final DigitalVoucherImportDto _self;
  final $Res Function(DigitalVoucherImportDto) _then;

/// Create a copy of DigitalVoucherImportDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? voucher = null,Object? subDistrict = freezed,Object? totalCodes = null,Object? notes = freezed,Object? createdAt = null,Object? createdByUserId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,voucher: null == voucher ? _self.voucher : voucher // ignore: cast_nullable_to_non_nullable
as VoucherDto,subDistrict: freezed == subDistrict ? _self.subDistrict : subDistrict // ignore: cast_nullable_to_non_nullable
as SubDistrictDto?,totalCodes: null == totalCodes ? _self.totalCodes : totalCodes // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdByUserId: null == createdByUserId ? _self.createdByUserId : createdByUserId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of DigitalVoucherImportDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VoucherDtoCopyWith<$Res> get voucher {
  
  return $VoucherDtoCopyWith<$Res>(_self.voucher, (value) {
    return _then(_self.copyWith(voucher: value));
  });
}/// Create a copy of DigitalVoucherImportDto
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


/// Adds pattern-matching-related methods to [DigitalVoucherImportDto].
extension DigitalVoucherImportDtoPatterns on DigitalVoucherImportDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DigitalVoucherImportDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DigitalVoucherImportDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DigitalVoucherImportDto value)  $default,){
final _that = this;
switch (_that) {
case _DigitalVoucherImportDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DigitalVoucherImportDto value)?  $default,){
final _that = this;
switch (_that) {
case _DigitalVoucherImportDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  VoucherDto voucher,  SubDistrictDto? subDistrict,  int totalCodes,  String? notes,  DateTime createdAt,  String createdByUserId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DigitalVoucherImportDto() when $default != null:
return $default(_that.id,_that.voucher,_that.subDistrict,_that.totalCodes,_that.notes,_that.createdAt,_that.createdByUserId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  VoucherDto voucher,  SubDistrictDto? subDistrict,  int totalCodes,  String? notes,  DateTime createdAt,  String createdByUserId)  $default,) {final _that = this;
switch (_that) {
case _DigitalVoucherImportDto():
return $default(_that.id,_that.voucher,_that.subDistrict,_that.totalCodes,_that.notes,_that.createdAt,_that.createdByUserId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  VoucherDto voucher,  SubDistrictDto? subDistrict,  int totalCodes,  String? notes,  DateTime createdAt,  String createdByUserId)?  $default,) {final _that = this;
switch (_that) {
case _DigitalVoucherImportDto() when $default != null:
return $default(_that.id,_that.voucher,_that.subDistrict,_that.totalCodes,_that.notes,_that.createdAt,_that.createdByUserId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DigitalVoucherImportDto implements DigitalVoucherImportDto {
  const _DigitalVoucherImportDto({required this.id, required this.voucher, this.subDistrict, required this.totalCodes, this.notes, required this.createdAt, required this.createdByUserId});
  factory _DigitalVoucherImportDto.fromJson(Map<String, dynamic> json) => _$DigitalVoucherImportDtoFromJson(json);

@override final  String id;
@override final  VoucherDto voucher;
@override final  SubDistrictDto? subDistrict;
@override final  int totalCodes;
@override final  String? notes;
@override final  DateTime createdAt;
@override final  String createdByUserId;

/// Create a copy of DigitalVoucherImportDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DigitalVoucherImportDtoCopyWith<_DigitalVoucherImportDto> get copyWith => __$DigitalVoucherImportDtoCopyWithImpl<_DigitalVoucherImportDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DigitalVoucherImportDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DigitalVoucherImportDto&&(identical(other.id, id) || other.id == id)&&(identical(other.voucher, voucher) || other.voucher == voucher)&&(identical(other.subDistrict, subDistrict) || other.subDistrict == subDistrict)&&(identical(other.totalCodes, totalCodes) || other.totalCodes == totalCodes)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdByUserId, createdByUserId) || other.createdByUserId == createdByUserId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,voucher,subDistrict,totalCodes,notes,createdAt,createdByUserId);

@override
String toString() {
  return 'DigitalVoucherImportDto(id: $id, voucher: $voucher, subDistrict: $subDistrict, totalCodes: $totalCodes, notes: $notes, createdAt: $createdAt, createdByUserId: $createdByUserId)';
}


}

/// @nodoc
abstract mixin class _$DigitalVoucherImportDtoCopyWith<$Res> implements $DigitalVoucherImportDtoCopyWith<$Res> {
  factory _$DigitalVoucherImportDtoCopyWith(_DigitalVoucherImportDto value, $Res Function(_DigitalVoucherImportDto) _then) = __$DigitalVoucherImportDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, VoucherDto voucher, SubDistrictDto? subDistrict, int totalCodes, String? notes, DateTime createdAt, String createdByUserId
});


@override $VoucherDtoCopyWith<$Res> get voucher;@override $SubDistrictDtoCopyWith<$Res>? get subDistrict;

}
/// @nodoc
class __$DigitalVoucherImportDtoCopyWithImpl<$Res>
    implements _$DigitalVoucherImportDtoCopyWith<$Res> {
  __$DigitalVoucherImportDtoCopyWithImpl(this._self, this._then);

  final _DigitalVoucherImportDto _self;
  final $Res Function(_DigitalVoucherImportDto) _then;

/// Create a copy of DigitalVoucherImportDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? voucher = null,Object? subDistrict = freezed,Object? totalCodes = null,Object? notes = freezed,Object? createdAt = null,Object? createdByUserId = null,}) {
  return _then(_DigitalVoucherImportDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,voucher: null == voucher ? _self.voucher : voucher // ignore: cast_nullable_to_non_nullable
as VoucherDto,subDistrict: freezed == subDistrict ? _self.subDistrict : subDistrict // ignore: cast_nullable_to_non_nullable
as SubDistrictDto?,totalCodes: null == totalCodes ? _self.totalCodes : totalCodes // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdByUserId: null == createdByUserId ? _self.createdByUserId : createdByUserId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of DigitalVoucherImportDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VoucherDtoCopyWith<$Res> get voucher {
  
  return $VoucherDtoCopyWith<$Res>(_self.voucher, (value) {
    return _then(_self.copyWith(voucher: value));
  });
}/// Create a copy of DigitalVoucherImportDto
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
