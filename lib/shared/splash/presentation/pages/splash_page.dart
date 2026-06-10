import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../flavors.dart';
import '../../../../features/profile/presentation/providers/profile_providers.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAndNavigate();
  }

  Future<void> _loadAndNavigate() async {
    try {
      await ref.read(profileProvider.notifier).loadProfile();
    } catch (e) {
      debugPrint('[Splash] loadProfile gagal: $e');
    }

    if (!mounted) return;

    setState(() => _isLoading = false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    final logo = F.appFlavor == Flavor.staging
        ? 'assets/icons/logo.staging.png'
        : 'assets/icons/logo.png';

    return FScaffold(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  logo,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade200,
                    ),
                    child: const Icon(
                      Icons.phone_android_rounded,
                      size: 48,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            const Gap(32),
            SizedBox(
              height: 20,
              child: _isLoading ? const FCircularProgress.loader() : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
