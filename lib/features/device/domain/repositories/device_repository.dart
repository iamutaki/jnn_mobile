import 'package:fpdart/fpdart.dart';

import '../failures/device_failure.dart';

abstract interface class DeviceRepository {
  Future<Either<DeviceFailure, Unit>> registerDevice({
    required String udid,
    required String fcmToken,
  });

  Future<Either<DeviceFailure, Unit>> revokeDevice({
    required String udid,
  });
}
