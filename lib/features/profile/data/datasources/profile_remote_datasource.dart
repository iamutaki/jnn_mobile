import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/models/base_response.dart';
import '../models/profile_dto.dart';

part 'profile_remote_datasource.g.dart';

@RestApi()
abstract class ProfileRemoteDatasource {
  factory ProfileRemoteDatasource(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ProfileRemoteDatasource;

  @GET('/v1/profile')
  Future<BaseResponse<ProfileDto>> getProfile();
}
