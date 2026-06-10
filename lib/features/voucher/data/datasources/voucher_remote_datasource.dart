import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/models/base_response.dart';
import '../models/voucher_dto.dart';
import '../models/voucher_request.dart';

part 'voucher_remote_datasource.g.dart';

@RestApi()
abstract class VoucherRemoteDatasource {
  factory VoucherRemoteDatasource(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _VoucherRemoteDatasource;

  @GET('/v1/voucher')
  Future<BaseResponse<List<VoucherDto>>> getVouchers();

  @POST('/v1/voucher')
  Future<HttpResponse<void>> createVoucher(@Body() VoucherRequest body);

  @PATCH('/v1/voucher/{id}')
  Future<HttpResponse<void>> updateVoucher(
    @Path('id') String id,
    @Body() VoucherRequest body,
  );

  @DELETE('/v1/voucher/{id}')
  Future<HttpResponse<void>> deleteVoucher(@Path('id') String id);
}
