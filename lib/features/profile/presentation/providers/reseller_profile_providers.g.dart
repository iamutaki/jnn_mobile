// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reseller_profile_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Profil reseller yang sedang login (endpoint `v1/profile/reseller`).
///
/// Auto-fetch saat pertama di-watch; [keepAlive: true] agar konteks desa
/// (sub-district) bertahan selama app hidup. Dipakai halaman penjualan untuk
/// menentukan voucher mana yang boleh dijual reseller.

@ProviderFor(ResellerProfileNotifier)
final resellerProfileProvider = ResellerProfileNotifierProvider._();

/// Profil reseller yang sedang login (endpoint `v1/profile/reseller`).
///
/// Auto-fetch saat pertama di-watch; [keepAlive: true] agar konteks desa
/// (sub-district) bertahan selama app hidup. Dipakai halaman penjualan untuk
/// menentukan voucher mana yang boleh dijual reseller.
final class ResellerProfileNotifierProvider
    extends
        $AsyncNotifierProvider<ResellerProfileNotifier, ResellerProfileDto> {
  /// Profil reseller yang sedang login (endpoint `v1/profile/reseller`).
  ///
  /// Auto-fetch saat pertama di-watch; [keepAlive: true] agar konteks desa
  /// (sub-district) bertahan selama app hidup. Dipakai halaman penjualan untuk
  /// menentukan voucher mana yang boleh dijual reseller.
  ResellerProfileNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resellerProfileProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resellerProfileNotifierHash();

  @$internal
  @override
  ResellerProfileNotifier create() => ResellerProfileNotifier();
}

String _$resellerProfileNotifierHash() =>
    r'6ad1297d015d64cdfb3d5c9ab7ea39b8652c84c7';

/// Profil reseller yang sedang login (endpoint `v1/profile/reseller`).
///
/// Auto-fetch saat pertama di-watch; [keepAlive: true] agar konteks desa
/// (sub-district) bertahan selama app hidup. Dipakai halaman penjualan untuk
/// menentukan voucher mana yang boleh dijual reseller.

abstract class _$ResellerProfileNotifier
    extends $AsyncNotifier<ResellerProfileDto> {
  FutureOr<ResellerProfileDto> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ResellerProfileDto>, ResellerProfileDto>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ResellerProfileDto>, ResellerProfileDto>,
              AsyncValue<ResellerProfileDto>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
