import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../flavors.dart';
import '../../../master_data/master_data_router.dart';
import '../../../profile/presentation/providers/profile_providers.dart';

/// Menu item model untuk grid menu.
class _MenuItem {
  final String label;
  final IconData icon;
  final Color color;

  const _MenuItem({
    required this.label,
    required this.icon,
    required this.color,
  });
}

/// Jumlah menu yang ditampilkan secara default (2 baris × 3 kolom).
const _defaultVisibleCount = 8;

/// Halaman utama (Home tab) dengan konsep banking app.
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  /// Semua menu yang tersedia (9+ items).
  static const _menus = [
    _MenuItem(
      label: 'Kirim Voucher',
      icon: FLucideIcons.ticketPlus,
      color: Color(0xFFE8710A),
    ),
    _MenuItem(
      label: 'Penjualan',
      icon: FLucideIcons.grid2X2Check,
      color: Color(0xFF0EA573),
    ),
    _MenuItem(
      label: 'Laporan Kegiatan',
      icon: FLucideIcons.notebookPen,
      color: Color(0xFF1A73E8),
    ),
    _MenuItem(
      label: 'Master Data',
      icon: FLucideIcons.database,
      color: Color(0xFFDC2626),
    ),
  ];

  bool _isExpanded = false;

  String _formatUsername() {
    final profile = ref.watch(profileProvider);
    if (profile != null) return '@${profile.username}';
    return '@username';
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  /// Menu yang ditampilkan: default 6, expanded semua.
  List<_MenuItem> get _visibleMenus {
    if (_isExpanded) return _menus.toList();
    return _menus.take(_defaultVisibleCount).toList();
  }

  /// Apakah ada menu tersembunyi yang bisa di-expand.
  bool get _hasMore => _menus.length > _defaultVisibleCount;

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      childPad: false,
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(12),

                // ── Header: Logo + Nama App ──
                _buildHeader(),
                const Gap(20),

                // ── Menu Section (dengan background) ──
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      // Grid menu
                      _buildMenuGrid(),
                      const Gap(8),

                      // Tombol Lihat Semua / Sembunyikan
                      if (_hasMore) _buildToggleButton(),
                    ],
                  ),
                ),
                const Gap(24),

                // ── Info Section ──
                _buildInfoSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Header dengan logo dan nama aplikasi.
  Widget _buildHeader() {
    final logo = F.appFlavor == Flavor.staging
        ? 'assets/icons/logo.staging.png'
        : 'assets/icons/logo.png';

    return Row(
      children: [
        // Logo
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              logo,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.phone_android_rounded,
                size: 24,
                color: Color(0xFF1A73E8),
              ),
            ),
          ),
        ),
        const Gap(12),

        // Nama Aplikasi & Greeting
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                F.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const Gap(2),
              Text(
                _formatUsername(),
                style: const TextStyle(fontSize: 13, color: Color(0xFF8C8C8C)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Grid menu 3 kolom — menampilkan [_defaultVisibleCount] atau semua.
  Widget _buildMenuGrid() {
    final menus = _visibleMenus;

    return AnimatedCrossFade(
      firstChild: _buildGrid(menus.take(_defaultVisibleCount).toList()),
      secondChild: _buildGrid(_menus.toList()),
      crossFadeState: _isExpanded
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 300),
    );
  }

  /// Membangun GridView dari list menu.
  Widget _buildGrid(List<_MenuItem> menus) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.7,
      ),
      itemCount: menus.length,
      itemBuilder: (context, index) {
        return _MenuCard(menu: menus[index]);
      },
    );
  }

  /// Tombol toggle untuk expand/collapse menu.
  Widget _buildToggleButton() {
    return Center(
      child: TextButton.icon(
        onPressed: () => setState(() => _isExpanded = !_isExpanded),
        icon: AnimatedRotation(
          turns: _isExpanded ? 0.5 : 0,
          duration: const Duration(milliseconds: 300),
          child: const Icon(Icons.expand_more, size: 20),
        ),
        label: Text(
          _isExpanded ? 'Sembunyikan' : 'Lihat Semua Menu',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A73E8),
          ),
        ),
      ),
    );
  }

  /// Section info di bawah menu.
  Widget _buildInfoSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Aktivitas Terbaru',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const Gap(12),
          Center(
            child: Column(
              children: [
                Icon(
                  FLucideIcons.bellOff,
                  size: 40,
                  color: Colors.grey.shade400,
                ),
                const Gap(8),
                Text(
                  'Belum ada aktivitas',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Kartu menu individual — compact & minimalis.
class _MenuCard extends StatelessWidget {
  final _MenuItem menu;

  const _MenuCard({required this.menu});

  void _onTap(BuildContext context) {
    switch (menu.label) {
      case 'Master Data':
        context.push(MasterDataRouter.masterData.path);
      case 'Kirim Voucher':
      case 'Penjualan':
      case 'Laporan Kegiatan':
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _onTap(context),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              // Icon rounded square — fixed position dari atas
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: menu.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(menu.icon, color: menu.color, size: 20),
              ),
              const Gap(6),

              // Label — Expanded agar mengisi sisa ruang
              Expanded(
                child: Text(
                  menu.label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    color: Color(0xFF4A4A4A),
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
