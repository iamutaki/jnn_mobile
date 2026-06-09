import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/router/app_router.dart';
import '../../../flavors.dart';
import 'dev_tool_inspector.dart';
import 'dev_tool_page.dart';

/// Overlay yang menampilkan floating draggable button untuk mengakses DevTool.
///
/// Hanya aktif pada **non-release build** atau **non-production flavor**.
/// Di release + production, widget ini hanya menampilkan [child] tanpa overlay.
///
/// Digunakan di [App] builder, membungkus seluruh widget tree:
/// ```dart
/// DevToolOverlay(
///   inspectors: [...],
///   child: VersionBanner(child: child),
/// )
/// ```
class DevToolOverlay extends StatefulWidget {
  const DevToolOverlay({
    super.key,
    required this.inspectors,
    required this.child,
  });

  /// Daftar inspector yang tersedia di dashboard.
  final List<DevToolInspector> inspectors;

  /// Widget child yang dibungkus overlay.
  final Widget child;

  @override
  State<DevToolOverlay> createState() => _DevToolOverlayState();
}

class _DevToolOverlayState extends State<DevToolOverlay> {
  /// Posisi floating button.
  Offset _offset = Offset.zero;

  /// Apakah posisi sudah diinisialisasi.
  bool _initialized = false;

  /// Apakah sedang di-drag (untuk visual feedback).
  bool _isDragging = false;

  /// Apakah DevToolPage sedang terbuka.
  bool _isDevToolPageOpen = false;

  /// Ukuran button.
  static const _size = 48.0;

  /// Push DevToolPage sebagai route di root Navigator.
  void _openDevToolPage() {
    final nav = AppRouter.rootNavigatorKey.currentState;
    if (nav == null) return;

    setState(() => _isDevToolPageOpen = true);

    nav.push(
      MaterialPageRoute(
        builder: (_) => DevToolPage(
          inspectors: widget.inspectors,
          onClose: () => nav.pop(),
        ),
      ),
    ).then((_) {
      if (mounted) setState(() => _isDevToolPageOpen = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Tampilkan di non-release build ATAU non-production flavor.
    // Hanya sembunyikan di release + production.
    if (kReleaseMode && F.appFlavor == Flavor.production) {
      return widget.child;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // Inisialisasi posisi default: bottom-right.
        if (!_initialized) {
          _offset = Offset(
            constraints.maxWidth - _size - 16,
            constraints.maxHeight - _size - 100,
          );
          _initialized = true;
        }

        // Clamp agar button tetap di dalam layar.
        final clamped = Offset(
          _offset.dx.clamp(0, constraints.maxWidth - _size),
          _offset.dy.clamp(0, constraints.maxHeight - _size),
        );

        return Stack(
          children: [
            // App content.
            widget.child,

            // Floating button — sembunyikan saat sudah di halaman DevToolPage.
            if (!_isDevToolPageOpen) Positioned(
              left: clamped.dx,
              top: clamped.dy,
              child: GestureDetector(
                onPanStart: (_) => setState(() => _isDragging = true),
                onPanUpdate: (details) {
                  setState(() {
                    _offset = Offset(
                      (_offset.dx + details.delta.dx)
                          .clamp(0, constraints.maxWidth - _size),
                      (_offset.dy + details.delta.dy)
                          .clamp(0, constraints.maxHeight - _size),
                    );
                  });
                },
                onPanEnd: (details) {
                  setState(() => _isDragging = false);

                  // Jika velocity rendah → anggap tap.
                  final velocity = details.primaryVelocity ?? 0;
                  if (velocity.abs() < 100) {
                    _openDevToolPage();
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: _size,
                  height: _size,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE53E3E),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFE53E3E).withValues(alpha: 0.4),
                        blurRadius: _isDragging ? 16 : 8,
                        spreadRadius: _isDragging ? 2 : 0,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.bug_report_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
