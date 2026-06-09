import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/failures/device_failure.dart';
import '../../domain/repositories/device_repository.dart';
import '../datasources/device_remote_datasource.dart';
import '../models/register_device_request_dto.dart';
import '../models/revoke_device_request_dto.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  DeviceRepositoryImpl(this._remoteDatasource);

  final DeviceRemoteDatasource _remoteDatasource;

  @override
  Future<Either<DeviceFailure, Unit>> registerDevice({
    required String udid,
    required String fcmToken,
  }) async {
    try {
      final request = RegisterDeviceRequestDto(udid: udid, fcmToken: fcmToken);
      await _remoteDatasource.registerDevice(request);

      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(DeviceFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(DeviceFailure(error.toString()));
    }
  }

  @override
  Future<Either<DeviceFailure, Unit>> revokeDevice({
    required String udid,
  }) async {
    try {
      final request = RevokeDeviceRequestDto(udid: udid);
      await _remoteDatasource.revokeDevice(request);

      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(DeviceFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(DeviceFailure(error.toString()));
    }
  }

  String _mapDioError(DioException error) {
    final responseData = error.response?.data;

    if (responseData is Map<String, dynamic>) {
      final message = responseData['error'];
      if (message is String && message.trim().isNotEmpty) {
        return message;
      }
    }

    if (error.message != null && error.message!.trim().isNotEmpty) {
      return error.message!;
    }

    return 'Terjadi kesalahan. Silakan coba lagi.';
  }
}
