// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VoucherListNotifier)
final voucherListProvider = VoucherListNotifierProvider._();

final class VoucherListNotifierProvider
    extends $AsyncNotifierProvider<VoucherListNotifier, List<VoucherDto>> {
  VoucherListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'voucherListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$voucherListNotifierHash();

  @$internal
  @override
  VoucherListNotifier create() => VoucherListNotifier();
}

String _$voucherListNotifierHash() =>
    r'bf444d08aff32cf2356bfc9da8b9b8fdd48b604c';

abstract class _$VoucherListNotifier extends $AsyncNotifier<List<VoucherDto>> {
  FutureOr<List<VoucherDto>> build();
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
    element.handleCreate(ref, build);
  }
}
