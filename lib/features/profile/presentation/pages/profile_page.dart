import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../../core/network/auth_token_storage.dart';
import '../../../../core/services/device_id_service.dart';
import '../../../device/domain/providers/device_domain_providers.dart';
import '../../../device/domain/usecases/revoke_device_use_case.dart';
import '../providers/profile_providers.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);

    return FScaffold(
      childPad: false,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(8),
              Text(
                'Profil',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Gap(24),
              profileAsync.when(
                loading: () => const Center(
                  child: FCircularProgress.loader(),
                ),
                error: (error, _) => Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: const Color(0xFFE8E8E8),
                        child: Icon(
                          FLucideIcons.user,
                          size: 48,
                          color: const Color(0xFF8C8C8C),
                        ),
                      ),
                      const Gap(12),
                      const Text(
                        'Gagal memuat profil',
                        style: TextStyle(fontSize: 13, color: Color(0xFF8C8C8C)),
                      ),
                    ],
                  ),
                ),
                data: (profile) => Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: profile.avatar != null
                            ? NetworkImage(profile.avatar!)
                            : null,
                        backgroundColor: const Color(0xFFE8E8E8),
                        child: profile.avatar == null
                            ? Icon(
                                FLucideIcons.user,
                                size: 48,
                                color: const Color(0xFF8C8C8C),
                              )
                            : null,
                      ),
                      const Gap(12),
                      Text(
                        profile.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        '@${profile.username}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF8C8C8C),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: FButton(
                    size: FButtonSizeVariant.sm,
                    variant: .destructive,
                    onPress: () => _onLogout(context, ref),
                    prefix: const Icon(FLucideIcons.logOut),
                    child: const Text('Keluar'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onLogout(BuildContext context, WidgetRef ref) async {
    final confirmed = await showFDialog<String>(
      context: context,
      builder: (context, dialogStyle, animation) => FDialog(
        title: const Text('Keluar'),
        body: const Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          FButton(
            variant: .outline,
            onPress: () => Navigator.of(context).pop('cancel'),
            child: const Text('Batal'),
          ),
          FButton(
            variant: .destructive,
            onPress: () => Navigator.of(context).pop('logout'),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );

    if (confirmed != 'logout') return;

    try {
      final udid = await DeviceIdService().getDeviceId();
      await ref.read(deviceRevokeDeviceUseCaseProvider)(
        RevokeDeviceParams(udid: udid),
      );
    } catch (_) {}

    await AuthTokenStorage.instance.clearTokens();
  }
}
