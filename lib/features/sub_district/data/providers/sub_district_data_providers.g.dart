// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_district_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(subDistrictRemoteDatasource)
final subDistrictRemoteDatasourceProvider =
    SubDistrictRemoteDatasourceProvider._();

final class SubDistrictRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          SubDistrictRemoteDatasource,
          SubDistrictRemoteDatasource,
          SubDistrictRemoteDatasource
        >
    with $Provider<SubDistrictRemoteDatasource> {
  SubDistrictRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subDistrictRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subDistrictRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<SubDistrictRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SubDistrictRemoteDatasource create(Ref ref) {
    return subDistrictRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubDistrictRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubDistrictRemoteDatasource>(value),
    );
  }
}

String _$subDistrictRemoteDatasourceHash() =>
    r'cb587e5c8369c9cfba0bcf7deedbc4bf9e1080ef';

@ProviderFor(subDistrictRepository)
final subDistrictRepositoryProvider = SubDistrictRepositoryProvider._();

final class SubDistrictRepositoryProvider
    extends
        $FunctionalProvider<
          SubDistrictRepository,
          SubDistrictRepository,
          SubDistrictRepository
        >
    with $Provider<SubDistrictRepository> {
  SubDistrictRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subDistrictRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subDistrictRepositoryHash();

  @$internal
  @override
  $ProviderElement<SubDistrictRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SubDistrictRepository create(Ref ref) {
    return subDistrictRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubDistrictRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubDistrictRepository>(value),
    );
  }
}

String _$subDistrictRepositoryHash() =>
    r'e4abf6550b3a026d44224c3a30d33716e4766ebb';
