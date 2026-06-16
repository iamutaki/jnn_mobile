// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserListNotifier)
final userListProvider = UserListNotifierProvider._();

final class UserListNotifierProvider
    extends $AsyncNotifierProvider<UserListNotifier, List<UserDto>> {
  UserListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userListNotifierHash();

  @$internal
  @override
  UserListNotifier create() => UserListNotifier();
}

String _$userListNotifierHash() => r'87727b1f9f2fe5b9bfd5cbb3cd03e3f4ce81d0da';

abstract class _$UserListNotifier extends $AsyncNotifier<List<UserDto>> {
  FutureOr<List<UserDto>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<UserDto>>, List<UserDto>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<UserDto>>, List<UserDto>>,
              AsyncValue<List<UserDto>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
