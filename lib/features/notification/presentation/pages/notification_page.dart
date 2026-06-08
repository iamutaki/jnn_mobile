import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

/// Halaman notifikasi (Notif tab).
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      childPad: false,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(8),
              Text(
                'Notifikasi',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Gap(16),
              Center(
                child: Column(
                  children: [
                    Icon(
                      FLucideIcons.bellOff,
                      size: 64,
                      color: const Color(0xFFCCCCCC),
                    ),
                    const Gap(12),
                    const Text(
                      'Belum ada notifikasi',
                      style: TextStyle(fontSize: 14, color: Color(0xFF8C8C8C)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
