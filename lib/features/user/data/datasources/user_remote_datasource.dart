import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/models/base_response.dart';
import '../models/user_dto.dart';
import '../models/user_request.dart';

part 'user_remote_datasource.g.dart';

@RestApi()
abstract class UserRemoteDatasource {
  factory UserRemoteDatasource(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _UserRemoteDatasource;

  @GET('/v1/user')
  Future<BaseResponse<List<UserDto>>> getUsers();

  @POST('/v1/user')
  Future<HttpResponse<void>> createUser(@Body() UserRequest body);

  @PATCH('/v1/user/{id}')
  Future<HttpResponse<void>> updateUser(
    @Path('id') String id,
    @Body() UserRequest body,
  );

  @GET('/v1/user/{id}')
  Future<BaseResponse<UserDto>> getUser(@Path('id') String id);

  @DELETE('/v1/user/{id}')
  Future<HttpResponse<void>> deleteUser(@Path('id') String id);
}
