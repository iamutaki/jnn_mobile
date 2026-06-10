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
