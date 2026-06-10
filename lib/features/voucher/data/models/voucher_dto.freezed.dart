// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VoucherDto {

 String get id; String get name;@JsonKey(fromJson: _priceFromJson) int get price; String? get description;
/// Create a copy of VoucherDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoucherDtoCopyWith<VoucherDto> get copyWith => _$VoucherDtoCopyWithImpl<VoucherDto>(this as VoucherDto, _$identity);

  /// Serializes this VoucherDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoucherDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,description);

@override
String toString() {
  return 'VoucherDto(id: $id, name: $name, price: $price, description: $description)';
}


}

/// @nodoc
abstract mixin class $VoucherDtoCopyWith<$Res>  {
  factory $VoucherDtoCopyWith(VoucherDto value, $Res Function(VoucherDto) _then) = _$VoucherDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(fromJson: _priceFromJson) int price, String? description
});




}
/// @nodoc
class _$VoucherDtoCopyWithImpl<$Res>
    implements $VoucherDtoCopyWith<$Res> {
  _$VoucherDtoCopyWithImpl(this._self, this._then);

  final VoucherDto _self;
  final $Res Function(VoucherDto) _then;

/// Create a copy of VoucherDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? price = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VoucherDto].
extension VoucherDtoPatterns on VoucherDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoucherDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoucherDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoucherDto value)  $default,){
final _that = this;
switch (_that) {
case _VoucherDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoucherDto value)?  $default,){
final _that = this;
switch (_that) {
case _VoucherDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(fromJson: _priceFromJson)  int price,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoucherDto() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(fromJson: _priceFromJson)  int price,  String? description)  $default,) {final _that = this;
switch (_that) {
case _VoucherDto():
return $default(_that.id,_that.name,_that.price,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(fromJson: _priceFromJson)  int price,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _VoucherDto() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoucherDto implements VoucherDto {
  const _VoucherDto({this.id = '', required this.name, @JsonKey(fromJson: _priceFromJson) required this.price, this.description});
  factory _VoucherDto.fromJson(Map<String, dynamic> json) => _$VoucherDtoFromJson(json);

@override@JsonKey() final  String id;
@override final  String name;
@override@JsonKey(fromJson: _priceFromJson) final  int price;
@override final  String? description;

/// Create a copy of VoucherDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoucherDtoCopyWith<_VoucherDto> get copyWith => __$VoucherDtoCopyWithImpl<_VoucherDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoucherDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoucherDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,description);

@override
String toString() {
  return 'VoucherDto(id: $id, name: $name, price: $price, description: $description)';
}


}

/// @nodoc
abstract mixin class _$VoucherDtoCopyWith<$Res> implements $VoucherDtoCopyWith<$Res> {
  factory _$VoucherDtoCopyWith(_VoucherDto value, $Res Function(_VoucherDto) _then) = __$VoucherDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(fromJson: _priceFromJson) int price, String? description
});




}
/// @nodoc
class __$VoucherDtoCopyWithImpl<$Res>
    implements _$VoucherDtoCopyWith<$Res> {
  __$VoucherDtoCopyWithImpl(this._self, this._then);

  final _VoucherDto _self;
  final $Res Function(_VoucherDto) _then;

/// Create a copy of VoucherDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? price = null,Object? description = freezed,}) {
  return _then(_VoucherDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
