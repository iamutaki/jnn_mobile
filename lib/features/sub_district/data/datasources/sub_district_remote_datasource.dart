import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/models/base_response.dart';
import '../models/sub_district_dto.dart';
import '../models/sub_district_request.dart';

part 'sub_district_remote_datasource.g.dart';

@RestApi()
abstract class SubDistrictRemoteDatasource {
  factory SubDistrictRemoteDatasource(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _SubDistrictRemoteDatasource;

  @GET('/v1/sub-district')
  Future<BaseResponse<List<SubDistrictDto>>> getSubDistricts();

  @POST('/v1/sub-district')
  Future<HttpResponse<void>> createSubDistrict(
    @Body() SubDistrictRequest body,
  );

  @PATCH('/v1/sub-district/{id}')
  Future<HttpResponse<void>> updateSubDistrict(
    @Path('id') String id,
    @Body() SubDistrictRequest body,
  );

  @DELETE('/v1/sub-district/{id}')
  Future<HttpResponse<void>> deleteSubDistrict(@Path('id') String id);
}
