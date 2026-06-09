import 'package:fpdart/fpdart.dart';

import '../failures/device_failure.dart';
import '../repositories/device_repository.dart';

class RevokeDeviceUseCase {
  const RevokeDeviceUseCase(this._repository);

  final DeviceRepository _repository;

  Future<Either<DeviceFailure, Unit>> call(RevokeDeviceParams params) {
    return _repository.revokeDevice(
      udid: params.udid.trim(),
    );
  }
}

class RevokeDeviceParams {
  const RevokeDeviceParams({required this.udid});

  final String udid;
}
