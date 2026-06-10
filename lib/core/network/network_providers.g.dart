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

@ProviderFor(authTokenStorage)
final authTokenStorageProvider = AuthTokenStorageProvider._();

final class AuthTokenStorageProvider
    extends
        $FunctionalProvider<
          AuthTokenStorage,
          AuthTokenStorage,
          AuthTokenStorage
        >
    with $Provider<AuthTokenStorage> {
  AuthTokenStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authTokenStorageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authTokenStorageHash();

  @$internal
  @override
  $ProviderElement<AuthTokenStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthTokenStorage create(Ref ref) {
    return authTokenStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthTokenStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthTokenStorage>(value),
    );
  }
}

String _$authTokenStorageHash() => r'e130a4f875fd7c9d293071d8a77c099ae6cad05b';

@ProviderFor(imgbbApiClient)
final imgbbApiClientProvider = ImgbbApiClientProvider._();

final class ImgbbApiClientProvider
    extends $FunctionalProvider<ImgbbApiClient, ImgbbApiClient, ImgbbApiClient>
    with $Provider<ImgbbApiClient> {
  ImgbbApiClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imgbbApiClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imgbbApiClientHash();

  @$internal
  @override
  $ProviderElement<ImgbbApiClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ImgbbApiClient create(Ref ref) {
    return imgbbApiClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImgbbApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImgbbApiClient>(value),
    );
  }
}

String _$imgbbApiClientHash() => r'2ec5116f6668a93d5948807b362bbf9f76b7ec20';

@ProviderFor(imgbbDio)
final imgbbDioProvider = ImgbbDioProvider._();

final class ImgbbDioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  ImgbbDioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imgbbDioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imgbbDioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return imgbbDio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$imgbbDioHash() => r'6de571ce1fa9c8512e99f7e60e5efea75ded83d2';
