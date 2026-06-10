// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_district_voucher_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(subDistrictVoucherRemoteDatasource)
final subDistrictVoucherRemoteDatasourceProvider =
    SubDistrictVoucherRemoteDatasourceProvider._();

final class SubDistrictVoucherRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          SubDistrictVoucherRemoteDatasource,
          SubDistrictVoucherRemoteDatasource,
          SubDistrictVoucherRemoteDatasource
        >
    with $Provider<SubDistrictVoucherRemoteDatasource> {
  SubDistrictVoucherRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subDistrictVoucherRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$subDistrictVoucherRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<SubDistrictVoucherRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SubDistrictVoucherRemoteDatasource create(Ref ref) {
    return subDistrictVoucherRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubDistrictVoucherRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubDistrictVoucherRemoteDatasource>(
        value,
      ),
    );
  }
}

String _$subDistrictVoucherRemoteDatasourceHash() =>
    r'bcc44171bdd7c463ad37fd86b1b05d445d8e70e0';

@ProviderFor(subDistrictVoucherRepository)
final subDistrictVoucherRepositoryProvider =
    SubDistrictVoucherRepositoryProvider._();

final class SubDistrictVoucherRepositoryProvider
    extends
        $FunctionalProvider<
          SubDistrictVoucherRepository,
          SubDistrictVoucherRepository,
          SubDistrictVoucherRepository
        >
    with $Provider<SubDistrictVoucherRepository> {
  SubDistrictVoucherRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subDistrictVoucherRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subDistrictVoucherRepositoryHash();

  @$internal
  @override
  $ProviderElement<SubDistrictVoucherRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SubDistrictVoucherRepository create(Ref ref) {
    return subDistrictVoucherRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubDistrictVoucherRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubDistrictVoucherRepository>(value),
    );
  }
}

String _$subDistrictVoucherRepositoryHash() =>
    r'd82472f1191580eec0f2caad0ed83859965ed0b0';
