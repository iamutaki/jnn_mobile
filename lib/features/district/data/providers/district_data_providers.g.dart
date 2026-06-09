// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(districtRemoteDatasource)
final districtRemoteDatasourceProvider = DistrictRemoteDatasourceProvider._();

final class DistrictRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          DistrictRemoteDatasource,
          DistrictRemoteDatasource,
          DistrictRemoteDatasource
        >
    with $Provider<DistrictRemoteDatasource> {
  DistrictRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'districtRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$districtRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<DistrictRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DistrictRemoteDatasource create(Ref ref) {
    return districtRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DistrictRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DistrictRemoteDatasource>(value),
    );
  }
}

String _$districtRemoteDatasourceHash() =>
    r'6a8545ac9f723f216f38b9f39dca286be6656825';

@ProviderFor(districtRepository)
final districtRepositoryProvider = DistrictRepositoryProvider._();

final class DistrictRepositoryProvider
    extends
        $FunctionalProvider<
          DistrictRepository,
          DistrictRepository,
          DistrictRepository
        >
    with $Provider<DistrictRepository> {
  DistrictRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'districtRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$districtRepositoryHash();

  @$internal
  @override
  $ProviderElement<DistrictRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DistrictRepository create(Ref ref) {
    return districtRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DistrictRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DistrictRepository>(value),
    );
  }
}

String _$districtRepositoryHash() =>
    r'8dc00c68813be9f72c8a9cc138b652c86bdaadb0';
