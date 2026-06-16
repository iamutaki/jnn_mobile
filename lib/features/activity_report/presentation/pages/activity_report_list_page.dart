import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../models/activity_report_models.dart';
import 'activity_report_detail_page.dart';

final mockSessions = [
  ActivitySession(
    id: '1',
    title: 'Session #1',
    date: DateTime(2026, 6, 10),
    isActive: true,
    items: [
      ActivityItem(
        id: '1',
        status: 'completed',
        description: 'Perbaikan mesin A',
        timestamp: DateTime(2026, 6, 10, 10, 30),
      ),
      ActivityItem(
        id: '2',
        status: 'completed',
        description: 'Pembersihan area produksi',
        timestamp: DateTime(2026, 6, 10, 11, 0),
      ),
    ],
  ),
  ActivitySession(
    id: '2',
    title: 'Session #2',
    date: DateTime(2026, 6, 8),
    isActive: false,
    items: [
      ActivityItem(
        id: '3',
        status: 'completed',
        description: 'Inspeksi harian',
        timestamp: DateTime(2026, 6, 8, 9, 0),
      ),
      ActivityItem(
        id: '4',
        status: 'completed',
        description: 'Ganti oli mesin',
        timestamp: DateTime(2026, 6, 8, 9, 30),
      ),
      ActivityItem(
        id: '5',
        status: 'completed',
        description: 'Kalibrasi alat ukur',
        timestamp: DateTime(2026, 6, 8, 10, 0),
      ),
    ],
  ),
  ActivitySession(
    id: '3',
    title: 'Session #3',
    date: DateTime(2026, 6, 5),
    isActive: false,
    items: [],
  ),
];

class ActivityReportListPage extends ConsumerStatefulWidget {
  const ActivityReportListPage({super.key});

  @override
  ConsumerState<ActivityReportListPage> createState() =>
      _ActivityReportListPageState();
}

class _ActivityReportListPageState
    extends ConsumerState<ActivityReportListPage> {
  final _sessions = List<ActivitySession>.from(mockSessions);

  bool get _hasActiveSession => _sessions.any((s) => s.isActive);

  String _formatDate(DateTime dt) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
      'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des',
    ];
    return '${dt.day} ${months[dt.month - 1]} ${dt.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FScaffold(
        childPad: false,
        child: SafeArea(
          child: Column(
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
                      'Laporan Kegiatan',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              const Divider(height: 24),
              Expanded(child: _buildList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildList() {
    final completed = _sessions.where((s) => !s.isActive).toList();

    return ListView(
      padding: const EdgeInsets.only(bottom: 80),
      children: [
        _buildStartButton(),
        if (_hasActiveSession) ...[
          const Gap(12),
          _buildActiveBanner(_sessions.firstWhere((s) => s.isActive)),
          const Gap(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: FButton(
                onPress: () => _openDetail(_sessions.firstWhere((s) => s.isActive)),
                variant: FButtonVariant.secondary,
                child: const Text('Lanjutkan'),
              ),
            ),
          ),
        ],
        if (completed.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Text(
              'Riwayat',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          ...completed.map(_buildSessionCard),
        ],
      ],
    );
  }

  Widget _buildStartButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: FButton(
          onPress: () {
            setState(() {
              _sessions.insert(
                0,
                ActivitySession(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: 'Session #${_sessions.length + 1}',
                  date: DateTime.now(),
                  isActive: true,
                  items: [],
                ),
              );
            });
          },
          variant: FButtonVariant.primary,
          child: const Text('Mulai Session Baru'),
        ),
      ),
    );
  }

  Widget _buildActiveBanner(ActivitySession session) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1447E6).withAlpha(15),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF1447E6).withAlpha(40),
          ),
        ),
        child: ListTile(
          onTap: () => _openDetail(session),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          title: Text(
            session.title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(2),
              Text(
                _formatDate(session.date),
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
              Text(
                '${session.items.length} item',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFD1FAE5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'Aktif',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF059669),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSessionCard(ActivitySession session) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        margin: const EdgeInsets.only(bottom: 8),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        child: ListTile(
          onTap: () => _openDetail(session),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          title: Text(
            session.title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(2),
              Text(
                '${_formatDate(session.date)} · ${session.items.length} item',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'Selesai',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openDetail(ActivitySession session) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ActivityReportDetailPage(session: session),
      ),
    );
  }
}
