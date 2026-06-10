// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DistrictListNotifier)
final districtListProvider = DistrictListNotifierProvider._();

final class DistrictListNotifierProvider
    extends $AsyncNotifierProvider<DistrictListNotifier, List<DistrictDto>> {
  DistrictListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'districtListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$districtListNotifierHash();

  @$internal
  @override
  DistrictListNotifier create() => DistrictListNotifier();
}

String _$districtListNotifierHash() =>
    r'c8be3228323de39d30b71f8923dc07e93ce1ebb3';

abstract class _$DistrictListNotifier
    extends $AsyncNotifier<List<DistrictDto>> {
  FutureOr<List<DistrictDto>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<DistrictDto>>, List<DistrictDto>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<DistrictDto>>, List<DistrictDto>>,
              AsyncValue<List<DistrictDto>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
