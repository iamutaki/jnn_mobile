import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/models/base_response.dart';
import '../../../voucher/data/models/voucher_dto.dart';
import '../models/sub_district_voucher_request.dart';

part 'sub_district_voucher_remote_datasource.g.dart';

@RestApi()
abstract class SubDistrictVoucherRemoteDatasource {
  factory SubDistrictVoucherRemoteDatasource(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _SubDistrictVoucherRemoteDatasource;

  @GET('/v1/sub-district/{subDistrictId}/voucher')
  Future<BaseResponse<List<VoucherDto>>> getSubDistrictVouchers(
    @Path('subDistrictId') String subDistrictId,
  );

  @PUT('/v1/sub-district/{subDistrictId}/voucher')
  Future<HttpResponse<void>> replaceSubDistrictVouchers(
    @Path('subDistrictId') String subDistrictId,
    @Body() SubDistrictVoucherRequest body,
  );
}
