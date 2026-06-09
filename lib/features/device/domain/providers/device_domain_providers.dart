import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/providers/device_data_providers.dart';
import '../usecases/register_device_use_case.dart';
import '../usecases/revoke_device_use_case.dart';

part 'device_domain_providers.g.dart';

@riverpod
RegisterDeviceUseCase deviceRegisterDeviceUseCase(Ref ref) {
  return RegisterDeviceUseCase(ref.watch(deviceRepositoryProvider));
}

@riverpod
RevokeDeviceUseCase deviceRevokeDeviceUseCase(Ref ref) {
  return RevokeDeviceUseCase(ref.watch(deviceRepositoryProvider));
}
