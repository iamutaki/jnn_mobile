import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/models/base_response.dart';
import '../models/login_request_dto.dart';
import '../models/login_response_dto.dart';
import '../models/refresh_token_request_dto.dart';

part 'auth_remote_datasource.g.dart';

@RestApi()
abstract class AuthRemoteDatasource {
  factory AuthRemoteDatasource(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _AuthRemoteDatasource;

  @POST('/v1/auth/login')
  Future<BaseResponse<LoginResponseDto>> login(
    @Body() LoginRequestDto body,
  );

  @POST('/v1/auth/refresh')
  Future<BaseResponse<LoginResponseDto>> refresh(
    @Body() RefreshTokenRequestDto body,
  );
}
