// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VoucherRequest {

 String get name; int get price; String? get description;
/// Create a copy of VoucherRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoucherRequestCopyWith<VoucherRequest> get copyWith => _$VoucherRequestCopyWithImpl<VoucherRequest>(this as VoucherRequest, _$identity);

  /// Serializes this VoucherRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoucherRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,price,description);

@override
String toString() {
  return 'VoucherRequest(name: $name, price: $price, description: $description)';
}


}

/// @nodoc
abstract mixin class $VoucherRequestCopyWith<$Res>  {
  factory $VoucherRequestCopyWith(VoucherRequest value, $Res Function(VoucherRequest) _then) = _$VoucherRequestCopyWithImpl;
@useResult
$Res call({
 String name, int price, String? description
});




}
/// @nodoc
class _$VoucherRequestCopyWithImpl<$Res>
    implements $VoucherRequestCopyWith<$Res> {
  _$VoucherRequestCopyWithImpl(this._self, this._then);

  final VoucherRequest _self;
  final $Res Function(VoucherRequest) _then;

/// Create a copy of VoucherRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? price = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VoucherRequest].
extension VoucherRequestPatterns on VoucherRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoucherRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoucherRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoucherRequest value)  $default,){
final _that = this;
switch (_that) {
case _VoucherRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoucherRequest value)?  $default,){
final _that = this;
switch (_that) {
case _VoucherRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int price,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoucherRequest() when $default != null:
return $default(_that.name,_that.price,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int price,  String? description)  $default,) {final _that = this;
switch (_that) {
case _VoucherRequest():
return $default(_that.name,_that.price,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int price,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _VoucherRequest() when $default != null:
return $default(_that.name,_that.price,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoucherRequest implements VoucherRequest {
  const _VoucherRequest({required this.name, required this.price, this.description});
  factory _VoucherRequest.fromJson(Map<String, dynamic> json) => _$VoucherRequestFromJson(json);

@override final  String name;
@override final  int price;
@override final  String? description;

/// Create a copy of VoucherRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoucherRequestCopyWith<_VoucherRequest> get copyWith => __$VoucherRequestCopyWithImpl<_VoucherRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoucherRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoucherRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,price,description);

@override
String toString() {
  return 'VoucherRequest(name: $name, price: $price, description: $description)';
}


}

/// @nodoc
abstract mixin class _$VoucherRequestCopyWith<$Res> implements $VoucherRequestCopyWith<$Res> {
  factory _$VoucherRequestCopyWith(_VoucherRequest value, $Res Function(_VoucherRequest) _then) = __$VoucherRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, int price, String? description
});




}
/// @nodoc
class __$VoucherRequestCopyWithImpl<$Res>
    implements _$VoucherRequestCopyWith<$Res> {
  __$VoucherRequestCopyWithImpl(this._self, this._then);

  final _VoucherRequest _self;
  final $Res Function(_VoucherRequest) _then;

/// Create a copy of VoucherRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? price = null,Object? description = freezed,}) {
  return _then(_VoucherRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
