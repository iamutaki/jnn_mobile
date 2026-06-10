// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(voucherRemoteDatasource)
final voucherRemoteDatasourceProvider = VoucherRemoteDatasourceProvider._();

final class VoucherRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          VoucherRemoteDatasource,
          VoucherRemoteDatasource,
          VoucherRemoteDatasource
        >
    with $Provider<VoucherRemoteDatasource> {
  VoucherRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'voucherRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$voucherRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<VoucherRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  VoucherRemoteDatasource create(Ref ref) {
    return voucherRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VoucherRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VoucherRemoteDatasource>(value),
    );
  }
}

String _$voucherRemoteDatasourceHash() =>
    r'3902af457088913816484ff4cfc1f7f92ce2ccba';

@ProviderFor(voucherRepository)
final voucherRepositoryProvider = VoucherRepositoryProvider._();

final class VoucherRepositoryProvider
    extends
        $FunctionalProvider<
          VoucherRepository,
          VoucherRepository,
          VoucherRepository
        >
    with $Provider<VoucherRepository> {
  VoucherRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'voucherRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$voucherRepositoryHash();

  @$internal
  @override
  $ProviderElement<VoucherRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  VoucherRepository create(Ref ref) {
    return voucherRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VoucherRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VoucherRepository>(value),
    );
  }
}

String _$voucherRepositoryHash() => r'2e90fe2b04dc751630a572801bf2ff361058981d';
