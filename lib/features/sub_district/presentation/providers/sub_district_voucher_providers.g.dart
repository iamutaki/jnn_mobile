// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_district_voucher_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubDistrictVoucherNotifier)
final subDistrictVoucherProvider = SubDistrictVoucherNotifierFamily._();

final class SubDistrictVoucherNotifierProvider
    extends $AsyncNotifierProvider<SubDistrictVoucherNotifier, List<String>> {
  SubDistrictVoucherNotifierProvider._({
    required SubDistrictVoucherNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'subDistrictVoucherProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$subDistrictVoucherNotifierHash();

  @override
  String toString() {
    return r'subDistrictVoucherProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SubDistrictVoucherNotifier create() => SubDistrictVoucherNotifier();

  @override
  bool operator ==(Object other) {
    return other is SubDistrictVoucherNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$subDistrictVoucherNotifierHash() =>
    r'29a54df3c77f7ca54dcd54f173cd0582c6273e0f';

final class SubDistrictVoucherNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          SubDistrictVoucherNotifier,
          AsyncValue<List<String>>,
          List<String>,
          FutureOr<List<String>>,
          String
        > {
  SubDistrictVoucherNotifierFamily._()
    : super(
        retry: null,
        name: r'subDistrictVoucherProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  SubDistrictVoucherNotifierProvider call(String subDistrictId) =>
      SubDistrictVoucherNotifierProvider._(argument: subDistrictId, from: this);

  @override
  String toString() => r'subDistrictVoucherProvider';
}

abstract class _$SubDistrictVoucherNotifier
    extends $AsyncNotifier<List<String>> {
  late final _$args = ref.$arg as String;
  String get subDistrictId => _$args;

  FutureOr<List<String>> build(String subDistrictId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<String>>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<String>>, List<String>>,
              AsyncValue<List<String>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

/// Sama dengan [SubDistrictVoucherNotifier], tapi mengembalikan [VoucherDto]
/// lengkap (id, nama, harga) — dipakai halaman penjualan untuk menampilkan
/// produk beserta steppernya tanpa perlu intersect dengan master voucher.

@ProviderFor(SubDistrictVouchersNotifier)
final subDistrictVouchersProvider = SubDistrictVouchersNotifierFamily._();

/// Sama dengan [SubDistrictVoucherNotifier], tapi mengembalikan [VoucherDto]
/// lengkap (id, nama, harga) — dipakai halaman penjualan untuk menampilkan
/// produk beserta steppernya tanpa perlu intersect dengan master voucher.
final class SubDistrictVouchersNotifierProvider
    extends
        $AsyncNotifierProvider<SubDistrictVouchersNotifier, List<VoucherDto>> {
  /// Sama dengan [SubDistrictVoucherNotifier], tapi mengembalikan [VoucherDto]
  /// lengkap (id, nama, harga) — dipakai halaman penjualan untuk menampilkan
  /// produk beserta steppernya tanpa perlu intersect dengan master voucher.
  SubDistrictVouchersNotifierProvider._({
    required SubDistrictVouchersNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'subDistrictVouchersProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$subDistrictVouchersNotifierHash();

  @override
  String toString() {
    return r'subDistrictVouchersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SubDistrictVouchersNotifier create() => SubDistrictVouchersNotifier();

  @override
  bool operator ==(Object other) {
    return other is SubDistrictVouchersNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$subDistrictVouchersNotifierHash() =>
    r'187d984b4350b82db46dc257a1159aa57f9a44f8';

/// Sama dengan [SubDistrictVoucherNotifier], tapi mengembalikan [VoucherDto]
/// lengkap (id, nama, harga) — dipakai halaman penjualan untuk menampilkan
/// produk beserta steppernya tanpa perlu intersect dengan master voucher.

final class SubDistrictVouchersNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          SubDistrictVouchersNotifier,
          AsyncValue<List<VoucherDto>>,
          List<VoucherDto>,
          FutureOr<List<VoucherDto>>,
          String
        > {
  SubDistrictVouchersNotifierFamily._()
    : super(
        retry: null,
        name: r'subDistrictVouchersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Sama dengan [SubDistrictVoucherNotifier], tapi mengembalikan [VoucherDto]
  /// lengkap (id, nama, harga) — dipakai halaman penjualan untuk menampilkan
  /// produk beserta steppernya tanpa perlu intersect dengan master voucher.

  SubDistrictVouchersNotifierProvider call(String subDistrictId) =>
      SubDistrictVouchersNotifierProvider._(
        argument: subDistrictId,
        from: this,
      );

  @override
  String toString() => r'subDistrictVouchersProvider';
}

/// Sama dengan [SubDistrictVoucherNotifier], tapi mengembalikan [VoucherDto]
/// lengkap (id, nama, harga) — dipakai halaman penjualan untuk menampilkan
/// produk beserta steppernya tanpa perlu intersect dengan master voucher.

abstract class _$SubDistrictVouchersNotifier
    extends $AsyncNotifier<List<VoucherDto>> {
  late final _$args = ref.$arg as String;
  String get subDistrictId => _$args;

  FutureOr<List<VoucherDto>> build(String subDistrictId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<VoucherDto>>, List<VoucherDto>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<VoucherDto>>, List<VoucherDto>>,
              AsyncValue<List<VoucherDto>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
