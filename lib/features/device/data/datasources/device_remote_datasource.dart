import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/models/base_response.dart';
import '../models/register_device_request_dto.dart';
import '../models/revoke_device_request_dto.dart';

part 'device_remote_datasource.g.dart';

@RestApi()
abstract class DeviceRemoteDatasource {
  factory DeviceRemoteDatasource(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _DeviceRemoteDatasource;

  @POST('/v1/device/register')
  Future<BaseResponse<Object?>> registerDevice(
    @Body() RegisterDeviceRequestDto body,
  );

  @PATCH('/v1/device/revoke')
  Future<BaseResponse<Object?>> revokeDevice(
    @Body() RevokeDeviceRequestDto body,
  );
}
