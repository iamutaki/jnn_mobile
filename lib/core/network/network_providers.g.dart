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
        isAutoDispose: false,
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

String _$jnnApiClientHash() => r'1edb5cc4fb19f0072f75a8591e66c3812bc8fe8b';

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
        isAutoDispose: false,
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

String _$dioHash() => r'68437d380068be7adff0e0ddacc7f21c0be0284b';

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
        isAutoDispose: false,
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

String _$authTokenStorageHash() => r'7ba898e695c3ab9eca78fdca659d5a1520de8ebb';

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
        isAutoDispose: false,
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

String _$imgbbApiClientHash() => r'affcd5d7ad8cab67eb23530f659a463c0d1ec57d';

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
        isAutoDispose: false,
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

String _$imgbbDioHash() => r'9af4fdb1c8480b988a06e04cf06f9c6f4b0cc2e8';

@ProviderFor(imagekitApiClient)
final imagekitApiClientProvider = ImagekitApiClientProvider._();

final class ImagekitApiClientProvider
    extends
        $FunctionalProvider<
          ImagekitApiClient,
          ImagekitApiClient,
          ImagekitApiClient
        >
    with $Provider<ImagekitApiClient> {
  ImagekitApiClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imagekitApiClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imagekitApiClientHash();

  @$internal
  @override
  $ProviderElement<ImagekitApiClient> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ImagekitApiClient create(Ref ref) {
    return imagekitApiClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImagekitApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImagekitApiClient>(value),
    );
  }
}

String _$imagekitApiClientHash() => r'33a90ac63b92e241eb742411df447aea4812257b';

@ProviderFor(imagekitDio)
final imagekitDioProvider = ImagekitDioProvider._();

final class ImagekitDioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  ImagekitDioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imagekitDioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imagekitDioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return imagekitDio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$imagekitDioHash() => r'a73ba66c37b2f5b965782811d45cb55b56bd39a5';
