import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/profile_dto.dart';
import '../../domain/providers/profile_domain_providers.dart';

part 'profile_providers.g.dart';

@Riverpod(keepAlive: true)
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<ProfileDto> build() {
    return _fetchProfile();
  }

  Future<ProfileDto> _fetchProfile() async {
    final useCase = ref.read(profileGetProfileUseCaseProvider);
    final result = await useCase();
    return result.fold(
      (failure) => throw Exception(failure.message),
      (profile) => profile,
    );
  }

  Future<void> refresh() {
    return _fetchProfile().then((profile) => state = AsyncData(profile));
  }
}
