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
    r'cc88f33b25dcc706e3e4e4008728d46475479fd4';

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
