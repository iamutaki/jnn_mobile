import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/reseller_profile_dto.dart';
import '../../domain/providers/profile_domain_providers.dart';

part 'reseller_profile_providers.g.dart';

/// Profil reseller yang sedang login (endpoint `v1/profile/reseller`).
///
/// Auto-fetch saat pertama di-watch; [keepAlive: true] agar konteks desa
/// (sub-district) bertahan selama app hidup. Dipakai halaman penjualan untuk
/// menentukan voucher mana yang boleh dijual reseller.
@Riverpod(keepAlive: true)
class ResellerProfileNotifier extends _$ResellerProfileNotifier {
  @override
  Future<ResellerProfileDto> build() => _fetch();

  Future<ResellerProfileDto> _fetch() async {
    final useCase = ref.read(profileGetResellerProfileUseCaseProvider);
    final result = await useCase();
    return result.fold(
      (failure) => throw Exception(failure.message),
      (resellerProfile) => resellerProfile,
    );
  }

  /// Force re-fetch profil reseller.
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}
