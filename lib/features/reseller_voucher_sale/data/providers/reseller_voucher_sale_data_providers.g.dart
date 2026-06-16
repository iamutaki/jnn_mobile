// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reseller_voucher_sale_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(resellerVoucherSaleRemoteDatasource)
final resellerVoucherSaleRemoteDatasourceProvider =
    ResellerVoucherSaleRemoteDatasourceProvider._();

final class ResellerVoucherSaleRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          ResellerVoucherSaleRemoteDatasource,
          ResellerVoucherSaleRemoteDatasource,
          ResellerVoucherSaleRemoteDatasource
        >
    with $Provider<ResellerVoucherSaleRemoteDatasource> {
  ResellerVoucherSaleRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resellerVoucherSaleRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$resellerVoucherSaleRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<ResellerVoucherSaleRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResellerVoucherSaleRemoteDatasource create(Ref ref) {
    return resellerVoucherSaleRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResellerVoucherSaleRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResellerVoucherSaleRemoteDatasource>(
        value,
      ),
    );
  }
}

String _$resellerVoucherSaleRemoteDatasourceHash() =>
    r'52d5017f78e47a7ce9432ee9228d3355372f5503';

@ProviderFor(resellerVoucherSaleRepository)
final resellerVoucherSaleRepositoryProvider =
    ResellerVoucherSaleRepositoryProvider._();

final class ResellerVoucherSaleRepositoryProvider
    extends
        $FunctionalProvider<
          ResellerVoucherSaleRepository,
          ResellerVoucherSaleRepository,
          ResellerVoucherSaleRepository
        >
    with $Provider<ResellerVoucherSaleRepository> {
  ResellerVoucherSaleRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resellerVoucherSaleRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resellerVoucherSaleRepositoryHash();

  @$internal
  @override
  $ProviderElement<ResellerVoucherSaleRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResellerVoucherSaleRepository create(Ref ref) {
    return resellerVoucherSaleRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResellerVoucherSaleRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResellerVoucherSaleRepository>(
        value,
      ),
    );
  }
}

String _$resellerVoucherSaleRepositoryHash() =>
    r'06cc54c9211826426a73b2bc1ea74bba73fb82e8';
