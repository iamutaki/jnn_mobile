import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/models/base_response.dart';
import '../models/role_dto.dart';

part 'role_remote_datasource.g.dart';

@RestApi()
abstract class RoleRemoteDatasource {
  factory RoleRemoteDatasource(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _RoleRemoteDatasource;

  @GET('/v1/role')
  Future<BaseResponse<List<RoleDto>>> getRoles();
}
