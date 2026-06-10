import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/models/base_response.dart';
import '../models/reseller_dto.dart';
import '../models/reseller_request.dart';

part 'reseller_remote_datasource.g.dart';

@RestApi()
abstract class ResellerRemoteDatasource {
  factory ResellerRemoteDatasource(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ResellerRemoteDatasource;

  @GET('/v1/reseller')
  Future<BaseResponse<List<ResellerDto>>> getResellers();

  @POST('/v1/reseller')
  Future<HttpResponse<void>> createReseller(@Body() ResellerRequest body);

  @PATCH('/v1/reseller/{id}')
  Future<HttpResponse<void>> updateReseller(
    @Path('id') String id,
    @Body() ResellerRequest body,
  );

  @DELETE('/v1/reseller/{id}')
  Future<HttpResponse<void>> deleteReseller(@Path('id') String id);
}
