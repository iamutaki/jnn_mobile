// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_voucher_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DigitalVoucherNotifier)
final digitalVoucherProvider = DigitalVoucherNotifierProvider._();

final class DigitalVoucherNotifierProvider
    extends $AsyncNotifierProvider<DigitalVoucherNotifier, void> {
  DigitalVoucherNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'digitalVoucherProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$digitalVoucherNotifierHash();

  @$internal
  @override
  DigitalVoucherNotifier create() => DigitalVoucherNotifier();
}

String _$digitalVoucherNotifierHash() =>
    r'30e928b9bb3cc6c365fa36e67c1f4edf6aab1aff';

abstract class _$DigitalVoucherNotifier extends $AsyncNotifier<void> {
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

/// Satu instance digital voucher by id (family). Dipakai halaman detail
/// sale untuk menampilkan kode tiap allocatedCode setelah sale di-complete.

@ProviderFor(DigitalVoucherDetailNotifier)
final digitalVoucherDetailProvider = DigitalVoucherDetailNotifierFamily._();

/// Satu instance digital voucher by id (family). Dipakai halaman detail
/// sale untuk menampilkan kode tiap allocatedCode setelah sale di-complete.
final class DigitalVoucherDetailNotifierProvider
    extends
        $AsyncNotifierProvider<
          DigitalVoucherDetailNotifier,
          DigitalVoucherDto
        > {
  /// Satu instance digital voucher by id (family). Dipakai halaman detail
  /// sale untuk menampilkan kode tiap allocatedCode setelah sale di-complete.
  DigitalVoucherDetailNotifierProvider._({
    required DigitalVoucherDetailNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'digitalVoucherDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$digitalVoucherDetailNotifierHash();

  @override
  String toString() {
    return r'digitalVoucherDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DigitalVoucherDetailNotifier create() => DigitalVoucherDetailNotifier();

  @override
  bool operator ==(Object other) {
    return other is DigitalVoucherDetailNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$digitalVoucherDetailNotifierHash() =>
    r'a7eee8899ecd83eb683722a57114ef735e144b0e';

/// Satu instance digital voucher by id (family). Dipakai halaman detail
/// sale untuk menampilkan kode tiap allocatedCode setelah sale di-complete.

final class DigitalVoucherDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          DigitalVoucherDetailNotifier,
          AsyncValue<DigitalVoucherDto>,
          DigitalVoucherDto,
          FutureOr<DigitalVoucherDto>,
          String
        > {
  DigitalVoucherDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'digitalVoucherDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Satu instance digital voucher by id (family). Dipakai halaman detail
  /// sale untuk menampilkan kode tiap allocatedCode setelah sale di-complete.

  DigitalVoucherDetailNotifierProvider call(String id) =>
      DigitalVoucherDetailNotifierProvider._(argument: id, from: this);

  @override
  String toString() => r'digitalVoucherDetailProvider';
}

/// Satu instance digital voucher by id (family). Dipakai halaman detail
/// sale untuk menampilkan kode tiap allocatedCode setelah sale di-complete.

abstract class _$DigitalVoucherDetailNotifier
    extends $AsyncNotifier<DigitalVoucherDto> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<DigitalVoucherDto> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<DigitalVoucherDto>, DigitalVoucherDto>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DigitalVoucherDto>, DigitalVoucherDto>,
              AsyncValue<DigitalVoucherDto>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
