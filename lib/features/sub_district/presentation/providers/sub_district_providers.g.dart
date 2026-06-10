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
    r'e3b003a238799bea6459375424665d8bc7aec207';

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
