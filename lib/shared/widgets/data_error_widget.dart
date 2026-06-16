import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../core/exceptions/api_exception.dart';

class DataErrorWidget extends StatelessWidget {
  const DataErrorWidget({
    super.key,
    this.error,
    this.onRetry,
  });

  final Object? error;
  final VoidCallback? onRetry;

  bool get _isForbidden =>
      error is ApiException && (error as ApiException).statusCode == 403;

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
              _isForbidden ? 'Anda tidak memiliki akses' : 'Gagal memuat data',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
            if (!_isForbidden) ...[
              const Gap(12),
              FButton(
                size: FButtonSizeVariant.sm,
                variant: FButtonVariant.outline,
                onPress: onRetry,
                child: const Text('Coba Lagi'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
