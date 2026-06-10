import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/models/base_response.dart';
import '../models/district_dto.dart';
import '../models/district_request.dart';

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
  Future<HttpResponse<void>> createDistrict(@Body() DistrictRequest body);

  @PATCH('/v1/district/{id}')
  Future<HttpResponse<void>> updateDistrict(
    @Path('id') String id,
    @Body() DistrictRequest body,
  );

  @DELETE('/v1/district/{id}')
  Future<HttpResponse<void>> deleteDistrict(@Path('id') String id);
}
