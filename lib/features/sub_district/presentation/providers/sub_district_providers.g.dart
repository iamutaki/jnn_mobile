// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_district_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubDistrictListNotifier)
final subDistrictListProvider = SubDistrictListNotifierProvider._();

final class SubDistrictListNotifierProvider
    extends
        $AsyncNotifierProvider<SubDistrictListNotifier, List<SubDistrictDto>> {
  SubDistrictListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subDistrictListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subDistrictListNotifierHash();

  @$internal
  @override
  SubDistrictListNotifier create() => SubDistrictListNotifier();
}

String _$subDistrictListNotifierHash() =>
    r'52731850d61ac5137039e7d0e2a732f1fdc5a81f';

abstract class _$SubDistrictListNotifier
    extends $AsyncNotifier<List<SubDistrictDto>> {
  FutureOr<List<SubDistrictDto>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<SubDistrictDto>>, List<SubDistrictDto>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<SubDistrictDto>>,
                List<SubDistrictDto>
              >,
              AsyncValue<List<SubDistrictDto>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
