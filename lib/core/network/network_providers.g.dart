// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(jnnApiClient)
final jnnApiClientProvider = JnnApiClientProvider._();

final class JnnApiClientProvider
    extends $FunctionalProvider<JnnApiClient, JnnApiClient, JnnApiClient>
    with $Provider<JnnApiClient> {
  JnnApiClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'jnnApiClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$jnnApiClientHash();

  @$internal
  @override
  $ProviderElement<JnnApiClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  JnnApiClient create(Ref ref) {
    return jnnApiClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(JnnApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<JnnApiClient>(value),
    );
  }
}

String _$jnnApiClientHash() => r'909560529208acc8f929922b9d97a2ffa5d02d17';

@ProviderFor(dio)
final dioProvider = DioProvider._();

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'00c24523027d3fd4d8aecf050b8098ad061b1f9a';
