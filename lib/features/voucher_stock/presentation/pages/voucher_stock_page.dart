import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import 'voucher_stock_history_page.dart';
import 'voucher_stock_upload_form_page.dart';

class VoucherStockPage extends StatelessWidget {
  const VoucherStockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      childPad: false,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: const Icon(FLucideIcons.arrowLeft, size: 24),
                  ),
                  const Gap(12),
                  Text(
                    'Stok Voucher',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _SummaryCard(
                icon: FLucideIcons.ticket,
                label: 'Total Voucher Tersedia',
                value: '12.500',
                color: const Color(0xFF2563EB),
              ),
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            const Gap(4),
            Expanded(
              child: ListView.separated(
                itemCount: _MenuType.values.length,
                separatorBuilder: (_, _) =>
                    const Divider(height: 1, indent: 64),
                itemBuilder: (context, index) {
                  final type = _MenuType.values[index];
                  return _MenuTile(type: type);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _MenuType {
  upload(
    icon: FLucideIcons.upload,
    label: 'Upload Voucher',
    description: 'Impor CSV dan distribusikan voucher ke desa',
    color: Color(0xFF0EA573),
  ),
  history(
    icon: FLucideIcons.clock,
    label: 'Riwayat Impor',
    description: 'Lihat histori impor voucher digital',
    color: Color(0xFF2563EB),
  );

  const _MenuType({
    required this.icon,
    required this.label,
    required this.description,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String description;
  final Color color;
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withAlpha(20),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withAlpha(30),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
              const Gap(4),
              Text(
                label,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final _MenuType type;

  const _MenuTile({required this.type});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          final route = switch (type) {
            _MenuType.upload => MaterialPageRoute(
                builder: (_) => const VoucherStockUploadFormPage(),
              ),
            _MenuType.history => MaterialPageRoute(
                builder: (_) => const VoucherStockHistoryPage(),
              ),
          };
          Navigator.of(context).push(route);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: type.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(type.icon, color: type.color, size: 20),
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type.label,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(5),
                    Text(
                      type.description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                FLucideIcons.chevronRight,
                size: 16,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
