import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/models/base_response.dart';
import '../models/profile_dto.dart';
import '../models/reseller_profile_dto.dart';

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

  @GET('/v1/profile/reseller')
  Future<BaseResponse<ResellerProfileDto>> getResellerProfile();

  @PATCH('/v1/profile/avatar')
  Future<void> updateAvatar(@Body() Map<String, dynamic> body);
}
