import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

class DataErrorWidget extends StatelessWidget {
  const DataErrorWidget({
    super.key,
    required this.onRetry,
  });

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              FLucideIcons.alertCircle,
              size: 48,
              color: Colors.grey.shade400,
            ),
            const Gap(8),
            Text(
              'Gagal memuat data',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
            const Gap(12),
            FButton(
              size: FButtonSizeVariant.sm,
              variant: FButtonVariant.outline,
              onPress: onRetry,
              child: const Text('Coba Lagi'),
            ),
          ],
        ),
      ),
    );
  }
}
