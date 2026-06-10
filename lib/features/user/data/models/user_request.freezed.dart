// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRequest {

 String get name; String get username; String? get password; String? get phone; String? get email; String? get avatar;@JsonKey(name: 'roleIds') List<String> get roleIds;
/// Create a copy of UserRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRequestCopyWith<UserRequest> get copyWith => _$UserRequestCopyWithImpl<UserRequest>(this as UserRequest, _$identity);

  /// Serializes this UserRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&const DeepCollectionEquality().equals(other.roleIds, roleIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,username,password,phone,email,avatar,const DeepCollectionEquality().hash(roleIds));

@override
String toString() {
  return 'UserRequest(name: $name, username: $username, password: $password, phone: $phone, email: $email, avatar: $avatar, roleIds: $roleIds)';
}


}

/// @nodoc
abstract mixin class $UserRequestCopyWith<$Res>  {
  factory $UserRequestCopyWith(UserRequest value, $Res Function(UserRequest) _then) = _$UserRequestCopyWithImpl;
@useResult
$Res call({
 String name, String username, String? password, String? phone, String? email, String? avatar,@JsonKey(name: 'roleIds') List<String> roleIds
});




}
/// @nodoc
class _$UserRequestCopyWithImpl<$Res>
    implements $UserRequestCopyWith<$Res> {
  _$UserRequestCopyWithImpl(this._self, this._then);

  final UserRequest _self;
  final $Res Function(UserRequest) _then;

/// Create a copy of UserRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? username = null,Object? password = freezed,Object? phone = freezed,Object? email = freezed,Object? avatar = freezed,Object? roleIds = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,roleIds: null == roleIds ? _self.roleIds : roleIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserRequest].
extension UserRequestPatterns on UserRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserRequest value)  $default,){
final _that = this;
switch (_that) {
case _UserRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UserRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String username,  String? password,  String? phone,  String? email,  String? avatar, @JsonKey(name: 'roleIds')  List<String> roleIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserRequest() when $default != null:
return $default(_that.name,_that.username,_that.password,_that.phone,_that.email,_that.avatar,_that.roleIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String username,  String? password,  String? phone,  String? email,  String? avatar, @JsonKey(name: 'roleIds')  List<String> roleIds)  $default,) {final _that = this;
switch (_that) {
case _UserRequest():
return $default(_that.name,_that.username,_that.password,_that.phone,_that.email,_that.avatar,_that.roleIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String username,  String? password,  String? phone,  String? email,  String? avatar, @JsonKey(name: 'roleIds')  List<String> roleIds)?  $default,) {final _that = this;
switch (_that) {
case _UserRequest() when $default != null:
return $default(_that.name,_that.username,_that.password,_that.phone,_that.email,_that.avatar,_that.roleIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserRequest implements UserRequest {
  const _UserRequest({required this.name, required this.username, this.password, this.phone, this.email, this.avatar, @JsonKey(name: 'roleIds') required final  List<String> roleIds}): _roleIds = roleIds;
  factory _UserRequest.fromJson(Map<String, dynamic> json) => _$UserRequestFromJson(json);

@override final  String name;
@override final  String username;
@override final  String? password;
@override final  String? phone;
@override final  String? email;
@override final  String? avatar;
 final  List<String> _roleIds;
@override@JsonKey(name: 'roleIds') List<String> get roleIds {
  if (_roleIds is EqualUnmodifiableListView) return _roleIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roleIds);
}


/// Create a copy of UserRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRequestCopyWith<_UserRequest> get copyWith => __$UserRequestCopyWithImpl<_UserRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&const DeepCollectionEquality().equals(other._roleIds, _roleIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,username,password,phone,email,avatar,const DeepCollectionEquality().hash(_roleIds));

@override
String toString() {
  return 'UserRequest(name: $name, username: $username, password: $password, phone: $phone, email: $email, avatar: $avatar, roleIds: $roleIds)';
}


}

/// @nodoc
abstract mixin class _$UserRequestCopyWith<$Res> implements $UserRequestCopyWith<$Res> {
  factory _$UserRequestCopyWith(_UserRequest value, $Res Function(_UserRequest) _then) = __$UserRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String username, String? password, String? phone, String? email, String? avatar,@JsonKey(name: 'roleIds') List<String> roleIds
});




}
/// @nodoc
class __$UserRequestCopyWithImpl<$Res>
    implements _$UserRequestCopyWith<$Res> {
  __$UserRequestCopyWithImpl(this._self, this._then);

  final _UserRequest _self;
  final $Res Function(_UserRequest) _then;

/// Create a copy of UserRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? username = null,Object? password = freezed,Object? phone = freezed,Object? email = freezed,Object? avatar = freezed,Object? roleIds = null,}) {
  return _then(_UserRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,roleIds: null == roleIds ? _self._roleIds : roleIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
