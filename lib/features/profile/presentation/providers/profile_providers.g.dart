// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Session holder untuk profile user.
///
/// - [keepAlive: true] → state bertahan selama app hidup
/// - Tidak auto-fetch — harus panggil [loadProfile()] secara eksplisit
/// - Menggunakan shared [Future] agar semua caller menunggu fetch yang sama

@ProviderFor(ProfileNotifier)
final profileProvider = ProfileNotifierProvider._();

/// Session holder untuk profile user.
///
/// - [keepAlive: true] → state bertahan selama app hidup
/// - Tidak auto-fetch — harus panggil [loadProfile()] secara eksplisit
/// - Menggunakan shared [Future] agar semua caller menunggu fetch yang sama
final class ProfileNotifierProvider
    extends $NotifierProvider<ProfileNotifier, ProfileDto?> {
  /// Session holder untuk profile user.
  ///
  /// - [keepAlive: true] → state bertahan selama app hidup
  /// - Tidak auto-fetch — harus panggil [loadProfile()] secara eksplisit
  /// - Menggunakan shared [Future] agar semua caller menunggu fetch yang sama
  ProfileNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileNotifierHash();

  @$internal
  @override
  ProfileNotifier create() => ProfileNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileDto? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileDto?>(value),
    );
  }
}

String _$profileNotifierHash() => r'3996e92fe3799ba6b80d507a50bd47e1691f35e1';

/// Session holder untuk profile user.
///
/// - [keepAlive: true] → state bertahan selama app hidup
/// - Tidak auto-fetch — harus panggil [loadProfile()] secara eksplisit
/// - Menggunakan shared [Future] agar semua caller menunggu fetch yang sama

abstract class _$ProfileNotifier extends $Notifier<ProfileDto?> {
  ProfileDto? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProfileDto?, ProfileDto?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProfileDto?, ProfileDto?>,
              ProfileDto?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
