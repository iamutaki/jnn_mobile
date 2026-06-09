import 'package:fpdart/fpdart.dart';

import '../failures/device_failure.dart';
import '../repositories/device_repository.dart';

class RegisterDeviceUseCase {
  const RegisterDeviceUseCase(this._repository);

  final DeviceRepository _repository;

  Future<Either<DeviceFailure, Unit>> call(RegisterDeviceParams params) {
    return _repository.registerDevice(
      udid: params.udid.trim(),
      fcmToken: params.fcmToken.trim(),
    );
  }
}

class RegisterDeviceParams {
  const RegisterDeviceParams({required this.udid, required this.fcmToken});

  final String udid;
  final String fcmToken;
}
