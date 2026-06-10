import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../dev_tool_inspector.dart';
import '../data/models/network_request_record.dart';
import '../network_monitor_registry.dart';
import 'network_request_detail_page.dart';

class NetworkMonitorInspector extends DevToolInspector {
  @override
  Color get color => const Color(0xFF1A73E8);

  @override
  String get description => 'Rekam dan inspect request API';

  @override
  IconData get icon => FLucideIcons.wifi;

  @override
  String get name => 'Network Monitor';

  @override
  List<Widget> get appBarActions => [
    IconButton(
      tooltip: 'Clear',
      icon: const Icon(FLucideIcons.trash2),
      onPressed: NetworkMonitorRegistry.clearRecords.call,
    ),
  ];

  @override
  Widget buildPage(BuildContext context) => const NetworkMonitorPage();
}

class NetworkMonitorPage extends StatelessWidget {
  const NetworkMonitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<List<NetworkRequestRecord>>(
            stream: NetworkMonitorRegistry.observeRecords(),
            builder: (context, snapshot) {
              final records = snapshot.data ?? const <NetworkRequestRecord>[];

              if (records.isEmpty) {
                return const _EmptyNetworkMonitorState();
              }

              return ListView.separated(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
                itemCount: records.length,
                separatorBuilder: (_, _) => const Gap(8),
                itemBuilder: (context, index) {
                  final record = records[index];

                  return _NetworkRecordCard(
                    record: record,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) =>
                            NetworkRequestDetailPage(record: record),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _NetworkRecordCard extends StatelessWidget {
  const _NetworkRecordCard({required this.record, required this.onTap});

  final NetworkRequestRecord record;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final statusText = record.statusCode?.toString() ?? '...';
    final durationText = record.durationMs == null
        ? '-'
        : '${record.durationMs} ms';
    final host = Uri.tryParse(record.url)?.host ?? '';

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _Badge(
                    label: record.method,
                    textColor: Colors.white,
                    backgroundColor: const Color(0xFF111827),
                  ),
                  const Gap(6),
                  _Badge(
                    label: statusText,
                    textColor: _statusTextColor(record),
                    backgroundColor: _statusBackgroundColor(record),
                  ),
                  const Gap(6),
                  Expanded(
                    child: Text(
                      record.path,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ),
                  const Gap(8),
                  Text(
                    durationText,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              const Gap(6),
              Row(
                children: [
                  if (host.isNotEmpty) ...[
                    Expanded(
                      child: Text(
                        host,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ),
                  ] else
                    const Spacer(),
                  const Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                    color: Color(0xFF9CA3AF),
                  ),
                ],
              ),
              if (record.errorMessage != null) ...[
                const Gap(6),
                Text(
                  record.errorMessage!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFFB91C1C),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _statusBackgroundColor(NetworkRequestRecord record) {
    if (record.statusCode == null) {
      return const Color(0xFFE5E7EB);
    }
    if (record.isError || (record.statusCode ?? 0) >= 400) {
      return const Color(0xFFFEE2E2);
    }
    return const Color(0xFFDCFCE7);
  }

  Color _statusTextColor(NetworkRequestRecord record) {
    if (record.statusCode == null) {
      return const Color(0xFF6B7280);
    }
    if (record.isError || (record.statusCode ?? 0) >= 400) {
      return const Color(0xFFB91C1C);
    }
    return const Color(0xFF15803D);
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.label,
    required this.textColor,
    required this.backgroundColor,
  });

  final String label;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }
}

class _EmptyNetworkMonitorState extends StatelessWidget {
  const _EmptyNetworkMonitorState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'Belum ada request yang direkam.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: Color(0xFF6B7280), height: 1.5),
        ),
      ),
    );
  }
}
