import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_user_dto.freezed.dart';
part 'login_user_dto.g.dart';

@freezed
abstract class LoginUserDto with _$LoginUserDto {
  const factory LoginUserDto({
    String? name,
    String? username,
    @Default(<String>[]) List<String> roles,
  }) = _LoginUserDto;

  factory LoginUserDto.fromJson(Map<String, dynamic> json) =>
      _$LoginUserDtoFromJson(json);
}
