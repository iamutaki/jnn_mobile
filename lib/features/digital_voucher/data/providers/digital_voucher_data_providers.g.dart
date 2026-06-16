// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_voucher_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(digitalVoucherRemoteDatasource)
final digitalVoucherRemoteDatasourceProvider =
    DigitalVoucherRemoteDatasourceProvider._();

final class DigitalVoucherRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          DigitalVoucherRemoteDatasource,
          DigitalVoucherRemoteDatasource,
          DigitalVoucherRemoteDatasource
        >
    with $Provider<DigitalVoucherRemoteDatasource> {
  DigitalVoucherRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'digitalVoucherRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$digitalVoucherRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<DigitalVoucherRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DigitalVoucherRemoteDatasource create(Ref ref) {
    return digitalVoucherRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DigitalVoucherRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DigitalVoucherRemoteDatasource>(
        value,
      ),
    );
  }
}

String _$digitalVoucherRemoteDatasourceHash() =>
    r'f725aeb10d5ae824a384e4615b4f32b349ee05d2';

@ProviderFor(digitalVoucherRepository)
final digitalVoucherRepositoryProvider = DigitalVoucherRepositoryProvider._();

final class DigitalVoucherRepositoryProvider
    extends
        $FunctionalProvider<
          DigitalVoucherRepository,
          DigitalVoucherRepository,
          DigitalVoucherRepository
        >
    with $Provider<DigitalVoucherRepository> {
  DigitalVoucherRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'digitalVoucherRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$digitalVoucherRepositoryHash();

  @$internal
  @override
  $ProviderElement<DigitalVoucherRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DigitalVoucherRepository create(Ref ref) {
    return digitalVoucherRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DigitalVoucherRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DigitalVoucherRepository>(value),
    );
  }
}

String _$digitalVoucherRepositoryHash() =>
    r'a90ae433b18539f747877c4b45ee82fe2c603606';
