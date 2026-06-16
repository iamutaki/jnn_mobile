// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_domain_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(profileGetProfileUseCase)
final profileGetProfileUseCaseProvider = ProfileGetProfileUseCaseProvider._();

final class ProfileGetProfileUseCaseProvider
    extends
        $FunctionalProvider<
          GetProfileUseCase,
          GetProfileUseCase,
          GetProfileUseCase
        >
    with $Provider<GetProfileUseCase> {
  ProfileGetProfileUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileGetProfileUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileGetProfileUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetProfileUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProfileUseCase create(Ref ref) {
    return profileGetProfileUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProfileUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProfileUseCase>(value),
    );
  }
}

String _$profileGetProfileUseCaseHash() =>
    r'0ee62cd1a35a896f12ad313c3622571811b067e2';

@ProviderFor(profileGetResellerProfileUseCase)
final profileGetResellerProfileUseCaseProvider =
    ProfileGetResellerProfileUseCaseProvider._();

final class ProfileGetResellerProfileUseCaseProvider
    extends
        $FunctionalProvider<
          GetResellerProfileUseCase,
          GetResellerProfileUseCase,
          GetResellerProfileUseCase
        >
    with $Provider<GetResellerProfileUseCase> {
  ProfileGetResellerProfileUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileGetResellerProfileUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileGetResellerProfileUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetResellerProfileUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetResellerProfileUseCase create(Ref ref) {
    return profileGetResellerProfileUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetResellerProfileUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetResellerProfileUseCase>(value),
    );
  }
}

String _$profileGetResellerProfileUseCaseHash() =>
    r'23ad642a95f37ec950c5aee0503d33fb7b200cb8';
