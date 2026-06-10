import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/network/auth_token_storage.dart';
import '../../../../core/network/imgbb_api_client.dart';
import '../../../../core/services/device_id_service.dart';
import '../../../../shared/utils/image_compressor.dart';
import '../../../../shared/utils/image_source_picker.dart';
import '../../../device/domain/providers/device_domain_providers.dart';
import '../../../device/domain/usecases/revoke_device_use_case.dart';
import '../../data/models/profile_dto.dart';
import '../../data/providers/profile_data_providers.dart';
import '../providers/profile_providers.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);
    final profile = profileAsync.asData?.value;

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
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => _onAvatarTap(context, ref),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: ClipOval(child: _buildAvatar(profile)),
                      ),
                    ),
                    const Gap(12),
                    Skeletonizer(
                      enabled: profileAsync.isLoading,
                      child: Column(
                        children: [
                          Text(
                            profile?.name ?? 'Nama Pengguna',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(4),
                          Text(
                            profile != null
                                ? '@${profile.username}'
                                : '@username',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF8C8C8C),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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

  Widget _buildAvatar(ProfileDto? profile) {
    final avatarUrl = profile?.avatar;
    final isValidUrl =
        avatarUrl != null &&
        (avatarUrl.startsWith('http://') || avatarUrl.startsWith('https://'));

    if (isValidUrl) {
      return CachedNetworkImage(
        imageUrl: avatarUrl,
        fit: BoxFit.cover,
        width: 80,
        height: 80,
        errorWidget: (_, _, _) => const _AvatarFallback(),
      );
    }

    return const _AvatarFallback();
  }

  Future<void> _onAvatarTap(BuildContext context, WidgetRef ref) async {
    final primaryColor = Theme.of(context).colorScheme.primary;

    final file = await showImageSourcePicker(context);
    if (file == null) return;

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Foto',
          toolbarColor: primaryColor,
          statusBarLight: true,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Crop Foto',
          aspectRatioLockEnabled: true,
          resetAspectRatioEnabled: false,
        ),
      ],
    );
    if (croppedFile == null) return;

    final compressed = compressImage(
      file: File(croppedFile.path),
      quality: 80,
      maxWidth: 620,
    );

    if (!context.mounted) return;

    showFDialog(
      context: context,
      builder: (context, _, _) =>
          const Center(child: FCircularProgress.loader()),
    );

    try {
      final uploadResponse = await ImgbbApiClient.instance.uploadImage(
        file: compressed,
      );

      final imageUrl = uploadResponse.data.image?.url;
      if (imageUrl == null || imageUrl.isEmpty) {
        throw Exception('Image URL not found in response');
      }

      final repository = ref.read(profileRepositoryProvider);
      final result = await repository.updateAvatar(imageUrl);

      if (!context.mounted) return;
      Navigator.of(context).pop();

      result.fold(
        (failure) {
          showFToast(
            context: context,
            variant: FToastVariant.destructive,
            title: Text(failure.message),
          );
        },
        (_) {
          ref.invalidate(profileProvider);
          showFToast(
            context: context,
            variant: FToastVariant.primary,
            title: const Text('Avatar berhasil diperbarui'),
          );
        },
      );
    } catch (e, st) {
      debugPrint('[ProfilePage] Avatar upload error: $e\n$st');
      if (!context.mounted) return;
      Navigator.of(context).pop();
      showFToast(
        context: context,
        variant: FToastVariant.destructive,
        title: Text('Gagal mengunggah avatar: $e'),
      );
    }
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

class _AvatarFallback extends StatelessWidget {
  const _AvatarFallback();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE8E8E8),
      alignment: Alignment.center,
      child: const Icon(FLucideIcons.user, size: 48, color: Color(0xFF8C8C8C)),
    );
  }
}
