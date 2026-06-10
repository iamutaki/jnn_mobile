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
        isAutoDispose: true,
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
    r'48dbbba5783b4871399f6a3c4569293be23a3ac5';

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
        isAutoDispose: true,
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
    r'20d2ca6f0ebf75ca4d5179aba0a7a108a2c5db8a';
