// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(roleRemoteDatasource)
final roleRemoteDatasourceProvider = RoleRemoteDatasourceProvider._();

final class RoleRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          RoleRemoteDatasource,
          RoleRemoteDatasource,
          RoleRemoteDatasource
        >
    with $Provider<RoleRemoteDatasource> {
  RoleRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roleRemoteDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roleRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<RoleRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RoleRemoteDatasource create(Ref ref) {
    return roleRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoleRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoleRemoteDatasource>(value),
    );
  }
}

String _$roleRemoteDatasourceHash() =>
    r'09737118f4f809417e0fe609652b8ca2ab30056a';
