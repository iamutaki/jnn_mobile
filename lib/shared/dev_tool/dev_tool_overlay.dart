import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  /// Apakah DevTool page sedang terbuka.
  bool _isOpen = false;

  /// Apakah sedang di-drag (untuk visual feedback).
  bool _isDragging = false;

  /// Ukuran button.
  static const _size = 48.0;

  @override
  Widget build(BuildContext context) {
    // Tampilkan di non-release build ATAU non-production flavor.
    // Hanya sembunyikan di release + production.
    if (kReleaseMode && F.appFlavor == Flavor.production) {
      return widget.child;
    }

    return PopScope(
      // Saat overlay terbuka, blok route pop agar tidak keluar app.
      canPop: !_isOpen,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop && _isOpen) {
          setState(() => _isOpen = false);
        }
      },
      child: LayoutBuilder(
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

            // DevTool page overlay (full-screen).
            if (_isOpen)
              Positioned.fill(
                child: Material(
                  child: DevToolPage(
                    inspectors: widget.inspectors,
                    onClose: () => setState(() => _isOpen = false),
                  ),
                ),
              ),

            // Floating draggable button.
            if (!_isOpen)
              Positioned(
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
                      setState(() => _isOpen = true);
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
      ),
    );
  }
}
