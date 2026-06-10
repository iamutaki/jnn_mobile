import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/providers/profile_data_providers.dart';
import '../usecases/get_profile_use_case.dart';

part 'profile_domain_providers.g.dart';

@Riverpod(keepAlive: true)
GetProfileUseCase profileGetProfileUseCase(Ref ref) {
  return GetProfileUseCase(ref.watch(profileRepositoryProvider));
}
