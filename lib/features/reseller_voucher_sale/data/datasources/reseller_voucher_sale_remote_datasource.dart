import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/models/base_response.dart';
import '../models/reseller_voucher_sale_detail_dto.dart';
import '../models/reseller_voucher_sale_dto.dart';
import '../models/reseller_voucher_sale_request.dart';
import '../models/sale_created_dto.dart';

part 'reseller_voucher_sale_remote_datasource.g.dart';

@RestApi()
abstract class ResellerVoucherSaleRemoteDatasource {
  factory ResellerVoucherSaleRemoteDatasource(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ResellerVoucherSaleRemoteDatasource;

  @POST('/v1/reseller-voucher-sale')
  Future<BaseResponse<SaleCreatedDto>> create(
    @Body() ResellerVoucherSaleRequest body,
    @Header('Idempotency-Key') String idempotencyKey,
  );

  @GET('/v1/reseller-voucher-sale/{id}')
  Future<BaseResponse<ResellerVoucherSaleDetailDto>> getById(
    @Path('id') String id,
  );

  @POST('/v1/reseller-voucher-sale/{id}/complete')
  Future<HttpResponse<void>> complete(@Path('id') String id);

  @GET('/v1/reseller-voucher-sale')
  Future<BaseResponse<List<ResellerVoucherSaleDto>>> getHistory(
    @Query('cursor') String? cursor,
  );
}
