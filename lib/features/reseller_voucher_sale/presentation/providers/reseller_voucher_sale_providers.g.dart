// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reseller_voucher_sale_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ResellerVoucherSaleNotifier)
final resellerVoucherSaleProvider = ResellerVoucherSaleNotifierProvider._();

final class ResellerVoucherSaleNotifierProvider
    extends $AsyncNotifierProvider<ResellerVoucherSaleNotifier, void> {
  ResellerVoucherSaleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resellerVoucherSaleProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resellerVoucherSaleNotifierHash();

  @$internal
  @override
  ResellerVoucherSaleNotifier create() => ResellerVoucherSaleNotifier();
}

String _$resellerVoucherSaleNotifierHash() =>
    r'8cf990d4bb76cd0a62ecce625dd67bf66d312d1c';

abstract class _$ResellerVoucherSaleNotifier extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Detail sebuah sale (family by saleId). Menyediakan [complete] untuk
/// menyelesaikan sale & me-reveal kode voucher.

@ProviderFor(ResellerVoucherSaleDetailNotifier)
final resellerVoucherSaleDetailProvider =
    ResellerVoucherSaleDetailNotifierFamily._();

/// Detail sebuah sale (family by saleId). Menyediakan [complete] untuk
/// menyelesaikan sale & me-reveal kode voucher.
final class ResellerVoucherSaleDetailNotifierProvider
    extends
        $AsyncNotifierProvider<
          ResellerVoucherSaleDetailNotifier,
          ResellerVoucherSaleDetailDto
        > {
  /// Detail sebuah sale (family by saleId). Menyediakan [complete] untuk
  /// menyelesaikan sale & me-reveal kode voucher.
  ResellerVoucherSaleDetailNotifierProvider._({
    required ResellerVoucherSaleDetailNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'resellerVoucherSaleDetailProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() =>
      _$resellerVoucherSaleDetailNotifierHash();

  @override
  String toString() {
    return r'resellerVoucherSaleDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ResellerVoucherSaleDetailNotifier create() =>
      ResellerVoucherSaleDetailNotifier();

  @override
  bool operator ==(Object other) {
    return other is ResellerVoucherSaleDetailNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$resellerVoucherSaleDetailNotifierHash() =>
    r'c00fa823c262ceccf632bc820202c9d16b2876db';

/// Detail sebuah sale (family by saleId). Menyediakan [complete] untuk
/// menyelesaikan sale & me-reveal kode voucher.

final class ResellerVoucherSaleDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ResellerVoucherSaleDetailNotifier,
          AsyncValue<ResellerVoucherSaleDetailDto>,
          ResellerVoucherSaleDetailDto,
          FutureOr<ResellerVoucherSaleDetailDto>,
          String
        > {
  ResellerVoucherSaleDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'resellerVoucherSaleDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Detail sebuah sale (family by saleId). Menyediakan [complete] untuk
  /// menyelesaikan sale & me-reveal kode voucher.

  ResellerVoucherSaleDetailNotifierProvider call(String saleId) =>
      ResellerVoucherSaleDetailNotifierProvider._(argument: saleId, from: this);

  @override
  String toString() => r'resellerVoucherSaleDetailProvider';
}

/// Detail sebuah sale (family by saleId). Menyediakan [complete] untuk
/// menyelesaikan sale & me-reveal kode voucher.

abstract class _$ResellerVoucherSaleDetailNotifier
    extends $AsyncNotifier<ResellerVoucherSaleDetailDto> {
  late final _$args = ref.$arg as String;
  String get saleId => _$args;

  FutureOr<ResellerVoucherSaleDetailDto> build(String saleId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ResellerVoucherSaleDetailDto>,
              ResellerVoucherSaleDetailDto
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ResellerVoucherSaleDetailDto>,
                ResellerVoucherSaleDetailDto
              >,
              AsyncValue<ResellerVoucherSaleDetailDto>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

/// Cursor-based pagination untuk riwayat penjualan (keepAlive agar state
/// tetap ada saat navigasi bolak-balik, mengurangi API call).

@ProviderFor(SaleHistoryPaging)
final saleHistoryPagingProvider = SaleHistoryPagingProvider._();

/// Cursor-based pagination untuk riwayat penjualan (keepAlive agar state
/// tetap ada saat navigasi bolak-balik, mengurangi API call).
final class SaleHistoryPagingProvider
    extends
        $NotifierProvider<
          SaleHistoryPaging,
          PagingController<String, ResellerVoucherSaleDto>
        > {
  /// Cursor-based pagination untuk riwayat penjualan (keepAlive agar state
  /// tetap ada saat navigasi bolak-balik, mengurangi API call).
  SaleHistoryPagingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saleHistoryPagingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saleHistoryPagingHash();

  @$internal
  @override
  SaleHistoryPaging create() => SaleHistoryPaging();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    PagingController<String, ResellerVoucherSaleDto> value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<PagingController<String, ResellerVoucherSaleDto>>(
            value,
          ),
    );
  }
}

String _$saleHistoryPagingHash() => r'3421fa2a24216f31f097a0784d65371639ee3742';

/// Cursor-based pagination untuk riwayat penjualan (keepAlive agar state
/// tetap ada saat navigasi bolak-balik, mengurangi API call).

abstract class _$SaleHistoryPaging
    extends $Notifier<PagingController<String, ResellerVoucherSaleDto>> {
  PagingController<String, ResellerVoucherSaleDto> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              PagingController<String, ResellerVoucherSaleDto>,
              PagingController<String, ResellerVoucherSaleDto>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                PagingController<String, ResellerVoucherSaleDto>,
                PagingController<String, ResellerVoucherSaleDto>
              >,
              PagingController<String, ResellerVoucherSaleDto>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
