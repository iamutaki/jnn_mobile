import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/models/base_response.dart';
import '../models/district_dto.dart';

part 'district_remote_datasource.g.dart';

@RestApi()
abstract class DistrictRemoteDatasource {
  factory DistrictRemoteDatasource(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _DistrictRemoteDatasource;

  @GET('/v1/district')
  Future<BaseResponse<List<DistrictDto>>> getDistricts();

  @POST('/v1/district')
  Future<BaseResponse<DistrictDto>> createDistrict(
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/v1/district/{id}')
  Future<BaseResponse<DistrictDto>> updateDistrict(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/v1/district/{id}')
  Future<BaseResponse<Object?>> deleteDistrict(@Path('id') String id);
}
