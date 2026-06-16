import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/models/base_response.dart';
import '../models/digital_voucher_dto.dart';
import '../models/digital_voucher_import_dto.dart';
import '../models/digital_voucher_request.dart';

part 'digital_voucher_remote_datasource.g.dart';

@RestApi()
abstract class DigitalVoucherRemoteDatasource {
  factory DigitalVoucherRemoteDatasource(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _DigitalVoucherRemoteDatasource;

  @POST('/v1/digital-voucher/bulk')
  Future<HttpResponse<void>> createBulk(@Body() DigitalVoucherBulkRequest body);

  @GET('/v1/digital-voucher/imports')
  Future<BaseResponse<List<DigitalVoucherImportDto>>> getImportHistory(
    @Query('cursor') String? cursor,
  );

  @GET('/v1/digital-voucher/{id}')
  Future<BaseResponse<DigitalVoucherDto>> getById(@Path('id') String id);
}
