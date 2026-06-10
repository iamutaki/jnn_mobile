// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RoleListNotifier)
final roleListProvider = RoleListNotifierProvider._();

final class RoleListNotifierProvider
    extends $AsyncNotifierProvider<RoleListNotifier, List<RoleDto>> {
  RoleListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roleListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roleListNotifierHash();

  @$internal
  @override
  RoleListNotifier create() => RoleListNotifier();
}

String _$roleListNotifierHash() => r'ec670ddb151d5f00f02417258cc50b4ddbe09a5c';

abstract class _$RoleListNotifier extends $AsyncNotifier<List<RoleDto>> {
  FutureOr<List<RoleDto>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<RoleDto>>, List<RoleDto>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<RoleDto>>, List<RoleDto>>,
              AsyncValue<List<RoleDto>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
