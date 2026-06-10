import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/profile_dto.dart';
import '../../domain/providers/profile_domain_providers.dart';

part 'profile_providers.g.dart';

/// Session holder untuk profile user.
///
/// - [keepAlive: true] → state bertahan selama app hidup
/// - Tidak auto-fetch — harus panggil [loadProfile()] secara eksplisit
/// - Menggunakan shared [Future] agar semua caller menunggu fetch yang sama
@Riverpod(keepAlive: true)
class ProfileNotifier extends _$ProfileNotifier {
  Future<void>? _loadFuture;

  @override
  ProfileDto? build() => null;

  /// Fetch profile dari API.
  ///
  /// - Jika state sudah ada → langsung return (no-op)
  /// - Jika sedang loading → tunggu fetch yang sama (no duplicate call)
  /// - Jika gagal → future di-clear, caller berikutnya akan retry
  Future<void> loadProfile() async {
    if (state != null) return;

    _loadFuture ??= _fetchAndSet();

    try {
      await _loadFuture;
    } catch (_) {
      _loadFuture = null;
      rethrow;
    }
  }

  Future<void> _fetchAndSet() async {
    final useCase = ref.read(profileGetProfileUseCaseProvider);
    final result = await useCase();

    result.fold(
      (failure) => throw Exception(failure.message),
      (profile) => state = profile,
    );
  }

  /// Refresh profile dari API (force re-fetch).
  Future<void> refresh() async {
    _loadFuture = null;
    await _fetchAndSet();
  }

  /// Hapus session — dipanggil saat logout.
  void clear() {
    _loadFuture = null;
    state = null;
  }
}
