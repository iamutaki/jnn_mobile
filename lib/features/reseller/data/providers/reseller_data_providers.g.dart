// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reseller_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(resellerRemoteDatasource)
final resellerRemoteDatasourceProvider = ResellerRemoteDatasourceProvider._();

final class ResellerRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          ResellerRemoteDatasource,
          ResellerRemoteDatasource,
          ResellerRemoteDatasource
        >
    with $Provider<ResellerRemoteDatasource> {
  ResellerRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resellerRemoteDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resellerRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<ResellerRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResellerRemoteDatasource create(Ref ref) {
    return resellerRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResellerRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResellerRemoteDatasource>(value),
    );
  }
}

String _$resellerRemoteDatasourceHash() =>
    r'427115c11a9ff8279e1a905dbc91ee8358d944c8';

@ProviderFor(resellerRepository)
final resellerRepositoryProvider = ResellerRepositoryProvider._();

final class ResellerRepositoryProvider
    extends
        $FunctionalProvider<
          ResellerRepository,
          ResellerRepository,
          ResellerRepository
        >
    with $Provider<ResellerRepository> {
  ResellerRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resellerRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resellerRepositoryHash();

  @$internal
  @override
  $ProviderElement<ResellerRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResellerRepository create(Ref ref) {
    return resellerRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResellerRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResellerRepository>(value),
    );
  }
}

String _$resellerRepositoryHash() =>
    r'97317d8b003ede88ca0d6ebacf192c7b63fe5cc1';
