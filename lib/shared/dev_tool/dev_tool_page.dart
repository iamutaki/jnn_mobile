import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import 'dev_tool_inspector.dart';

/// Dashboard DevTool yang menampilkan daftar inspector dalam grid.
///
/// Setiap inspector ditampilkan sebagai card dengan icon, nama, dan deskripsi.
/// Tap pada card akan membuka halaman inspector yang bersangkutan.
class DevToolPage extends StatefulWidget {
  const DevToolPage({
    super.key,
    required this.inspectors,
    this.onClose,
  });

  /// Daftar inspector yang ditampilkan di grid.
  final List<DevToolInspector> inspectors;

  /// Callback saat tombol close ditekan.
  /// Jika null, menggunakan Navigator.pop.
  final VoidCallback? onClose;

  @override
  State<DevToolPage> createState() => _DevToolPageState();
}

class _DevToolPageState extends State<DevToolPage> {
  /// Inspector yang sedang dibuka (null = dashboard).
  DevToolInspector? _activeInspector;

  void _close() {
    if (_activeInspector != null) {
      setState(() => _activeInspector = null);
    } else {
      widget.onClose?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final inspector = _activeInspector;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          inspector?.name ?? 'Dev Tools',
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: Icon(
            inspector != null ? Icons.arrow_back : Icons.close,
          ),
          onPressed: _close,
        ),
      ),
      body: inspector != null
          ? inspector.buildPage(context)
          : widget.inspectors.isEmpty
              ? const _EmptyState()
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: widget.inspectors.length,
                  itemBuilder: (context, index) => _InspectorCard(
                    inspector: widget.inspectors[index],
                    onTap: () => setState(
                      () => _activeInspector = widget.inspectors[index],
                    ),
                  ),
                ),
    );
  }
}

/// Card untuk satu inspector di grid — mirip pola _MenuCard di HomePage.
class _InspectorCard extends StatelessWidget {
  const _InspectorCard({
    required this.inspector,
    required this.onTap,
  });

  final DevToolInspector inspector;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              // Icon rounded square.
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: inspector.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(inspector.icon, color: inspector.color, size: 22),
              ),
              const Gap(8),
              // Nama inspector.
              Text(
                inspector.name,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const Gap(2),
              // Deskripsi singkat.
              Expanded(
                child: Text(
                  inspector.description,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF8C8C8C),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Empty state saat belum ada inspector terdaftar.
class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            FLucideIcons.wrench,
            size: 48,
            color: Colors.grey.shade400,
          ),
          const Gap(12),
          Text(
            'Belum ada inspector',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade500,
            ),
          ),
          const Gap(4),
          Text(
            'Tambahkan DevToolInspector ke daftar inspectors',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
