import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:forui/forui.dart';

import '../../../core/services/device_id_service.dart';
import '../dev_tool_inspector.dart';

class UdidInspector extends DevToolInspector {
  @override
  Color get color => const Color(0xFF8E44AD);

  @override
  String get description => 'Lihat device ID (UDID)';

  @override
  IconData get icon => Icons.phone_android_rounded;

  @override
  String get name => 'UDID';

  @override
  Widget buildPage(BuildContext context) => const _UdidPage();
}

class _UdidPage extends StatelessWidget {
  const _UdidPage();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: DeviceIdService().getDeviceId(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: FCircularProgress.loader());
        }

        final udid = snapshot.data ?? 'Gagal memuat';

        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Device ID',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade600,
                ),
              ),
              const Gap(8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SelectableText(
                  udid,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Gap(16),
              FButton(
                size: FButtonSizeVariant.xs,
                onPress: () {
                  Clipboard.setData(ClipboardData(text: udid));
                  showFToast(
                    context: context,
                    variant: FToastVariant.primary,
                    icon: const Icon(Icons.check, size: 16),
                    title: const Text('UDID disalin'),
                  );
                },
                child: const Text('Salin UDID'),
              ),
            ],
          ),
        );
      },
    );
  }
}
