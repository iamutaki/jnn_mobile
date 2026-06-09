// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_domain_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deviceRegisterDeviceUseCase)
final deviceRegisterDeviceUseCaseProvider =
    DeviceRegisterDeviceUseCaseProvider._();

final class DeviceRegisterDeviceUseCaseProvider
    extends
        $FunctionalProvider<
          RegisterDeviceUseCase,
          RegisterDeviceUseCase,
          RegisterDeviceUseCase
        >
    with $Provider<RegisterDeviceUseCase> {
  DeviceRegisterDeviceUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceRegisterDeviceUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceRegisterDeviceUseCaseHash();

  @$internal
  @override
  $ProviderElement<RegisterDeviceUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RegisterDeviceUseCase create(Ref ref) {
    return deviceRegisterDeviceUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterDeviceUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterDeviceUseCase>(value),
    );
  }
}

String _$deviceRegisterDeviceUseCaseHash() =>
    r'c902eed190fcb4cedebc77734445b87aa5f487e0';

@ProviderFor(deviceRevokeDeviceUseCase)
final deviceRevokeDeviceUseCaseProvider = DeviceRevokeDeviceUseCaseProvider._();

final class DeviceRevokeDeviceUseCaseProvider
    extends
        $FunctionalProvider<
          RevokeDeviceUseCase,
          RevokeDeviceUseCase,
          RevokeDeviceUseCase
        >
    with $Provider<RevokeDeviceUseCase> {
  DeviceRevokeDeviceUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceRevokeDeviceUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceRevokeDeviceUseCaseHash();

  @$internal
  @override
  $ProviderElement<RevokeDeviceUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RevokeDeviceUseCase create(Ref ref) {
    return deviceRevokeDeviceUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RevokeDeviceUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RevokeDeviceUseCase>(value),
    );
  }
}

String _$deviceRevokeDeviceUseCaseHash() =>
    r'f4bf65d0b32854ae5b2a055f6aff66ee9a22f30e';
