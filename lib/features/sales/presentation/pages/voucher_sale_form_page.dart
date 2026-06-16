import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../shared/widgets/data_error_widget.dart';
import '../../../profile/presentation/providers/reseller_profile_providers.dart';
import '../../../reseller_voucher_sale/data/models/reseller_voucher_sale_request.dart';
import '../../../reseller_voucher_sale/presentation/providers/reseller_voucher_sale_providers.dart';
import '../../../sub_district/presentation/providers/sub_district_voucher_providers.dart';
import '../../../voucher/data/models/voucher_dto.dart';
import 'sales_detail_page.dart';

/// Format harga ke ribuan pemisah '.' (tanpa simbol), cth: 5000 -> "5.000".
/// Duplikat sesuai konvensi codebase (lihat _formatPrice di voucher pages).
String _formatPrice(int price) {
  final str = price.toString();
  final buffer = StringBuffer();
  for (var i = 0; i < str.length; i++) {
    if (i > 0 && (str.length - i) % 3 == 0) buffer.write('.');
    buffer.write(str[i]);
  }
  return buffer.toString();
}

String _formatDate(DateTime d) =>
    '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

String _formatMonth(DateTime d) =>
    '${d.year}-${d.month.toString().padLeft(2, '0')}';

const _shortMonths = <String>[
  'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
  'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des',
];

/// Tampilan tanggal yang ramah dibaca, cth: 28 Mar 2026.
/// Berbeda dengan [_formatDate] (payload "YYYY-MM-DD" ke backend).
String _formatDateDisplay(DateTime d) =>
    '${d.day} ${_shortMonths[d.month - 1]} ${d.year}';

/// Halaman input transaksi penjualan voucher reseller.
///
/// Desa (sub-district) reseller diambil otomatis dari `v1/profile/reseller`,
/// lalu voucher yang boleh dijual diambil dari
/// `v1/sub-district/{subDistrictId}/voucher`. User **tidak** mengetik nomor
/// invoice (di-generate backend) maupun harga (mengikuti harga voucher) —
/// cukup menekan `-` / `+` pada stepper tiap produk yang ingin dibeli.
class VoucherSaleFormPage extends ConsumerStatefulWidget {
  const VoucherSaleFormPage({super.key, this.showBackButton = true});

  final bool showBackButton;

  @override
  ConsumerState<VoucherSaleFormPage> createState() =>
      _VoucherSaleFormPageState();
}

class _VoucherSaleFormPageState extends ConsumerState<VoucherSaleFormPage> {
  static final _skeletonVouchers = List<VoucherDto>.generate(
    4,
    (i) => VoucherDto(id: 'sk$i', name: 'Memuat voucher…', price: 0),
  );

  DateTime _saleDate = DateTime.now();
  final Map<String, int> _quantities = {};
  bool _isSubmitting = false;

  int _qtyOf(String id) => _quantities[id] ?? 0;

  void _setQty(String id, int qty) {
    setState(() {
      if (qty <= 0) {
        _quantities.remove(id);
      } else {
        _quantities[id] = qty;
      }
    });
  }

  Future<void> _pickSaleDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _saleDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _saleDate = picked);
    }
  }

  Future<void> _onSimpan() async {
    // Ambil voucher desa terbaru lewat provider (bukan dari state build).
    final profile = ref.read(resellerProfileProvider).asData?.value;
    final subDistrictId = profile?.subDistrictId;
    final List<VoucherDto> vouchers;
    if (subDistrictId == null || subDistrictId.isEmpty) {
      vouchers = const [];
    } else {
      vouchers = ref
              .read(subDistrictVouchersProvider(subDistrictId))
              .asData
              ?.value ??
          const <VoucherDto>[];
    }

    final items = vouchers
        .where((v) => _qtyOf(v.id) > 0)
        .map(
          (v) => ResellerVoucherSaleItem(
            voucherId: v.id,
            qty: _qtyOf(v.id),
            unitPrice: v.price,
          ),
        )
        .toList();

    if (items.isEmpty) {
      _showToast('Pilih minimal satu produk', destructive: true);
      return;
    }

    setState(() => _isSubmitting = true);
    try {
      final saleId =
          await ref.read(resellerVoucherSaleProvider.notifier).create(
                saleDate: _formatDate(_saleDate),
                saleMonth: _formatMonth(_saleDate),
                items: items,
              );

      if (!mounted) return;
      setState(() {
        _isSubmitting = false;
        _quantities.clear();
      });
      // Arahkan ke detail; form diganti agar back langsung ke menu sales.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => SalesDetailPage(saleId: saleId),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      _showToast(
        e.toString().replaceFirst('Exception: ', ''),
        destructive: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final resellerProfileAsync = ref.watch(resellerProfileProvider);
    final subDistrictId = resellerProfileAsync.asData?.value.subDistrictId;
    final hasDesa = subDistrictId != null && subDistrictId.isNotEmpty;

    final vouchersAsync = hasDesa
        ? ref.watch(subDistrictVouchersProvider(subDistrictId))
        : const AsyncValue<List<VoucherDto>>.data(<VoucherDto>[]);

    final bool loading =
        resellerProfileAsync.isLoading || vouchersAsync.isLoading;
    final vouchers = vouchersAsync.asData?.value ?? const <VoucherDto>[];

    final grandTotal = vouchers.fold<int>(
      0,
      (sum, v) => sum + v.price * _qtyOf(v.id),
    );

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
                    if (widget.showBackButton) ...[
                      GestureDetector(
                        onTap: () => Navigator.of(context).maybePop(),
                        child: const Icon(FLucideIcons.arrowLeft, size: 24),
                      ),
                      const Gap(12),
                    ],
                    Text(
                      'Penjualan Voucher',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 24),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  children: [
                    // ── Tanggal Penjualan ──
                    _buildDateField(),
                    const Gap(16),

                    // ── Header section produk ──
                    Text(
                      'Pilih Produk',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const Gap(8),

                    // ── Daftar produk (voucher) sesuai desa reseller ──
                    _buildProductSection(
                      resellerProfileAsync: resellerProfileAsync,
                      vouchersAsync: vouchersAsync,
                      loading: loading,
                      hasDesa: hasDesa,
                      vouchers: vouchers,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border(
              top: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── Total ──
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Rp${_formatPrice(grandTotal)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0EA573),
                    ),
                  ),
                ],
              ),
              const Gap(12),
              // ── Tombol Simpan (full width) ──
              FButton(
                onPress: _isSubmitting ? null : _onSimpan,
                variant: FButtonVariant.primary,
                child: _isSubmitting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: FCircularProgress.loader(),
                      )
                    : const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Menampilkan kondisi yang sesuai: loading, error, tanpa desa, kosong,
  /// atau daftar voucher beserta steppernya.
  Widget _buildProductSection({
    required AsyncValue resellerProfileAsync,
    required AsyncValue<List<VoucherDto>> vouchersAsync,
    required bool loading,
    required bool hasDesa,
    required List<VoucherDto> vouchers,
  }) {
    if (resellerProfileAsync.hasError) {
      return DataErrorWidget(
        onRetry: () => ref.read(resellerProfileProvider.notifier).refresh(),
      );
    }

    if (vouchersAsync.hasError) {
      return DataErrorWidget(
        onRetry: () => ref.invalidate(
          subDistrictVouchersProvider(
            resellerProfileAsync.asData!.value.subDistrictId!,
          ),
        ),
      );
    }

    if (loading) {
      return Skeletonizer(
        enabled: true,
        containersColor: const Color(0xFFEBEBF4),
        child: Column(
          children: _skeletonVouchers
              .map(
                (v) => _VoucherCard(
                  voucher: v,
                  qty: 0,
                  enabled: false,
                  onDecrement: () {},
                  onIncrement: () {},
                ),
              )
              .toList(),
        ),
      );
    }

    if (!hasDesa) {
      return _buildInfoBanner(
        icon: FLucideIcons.mapPin,
        message: 'Desa reseller belum diatur. Hubungi admin.',
      );
    }

    if (vouchers.isEmpty) {
      return _buildInfoBanner(
        icon: FLucideIcons.packageOpen,
        message: 'Belum ada voucher untuk desa Anda.',
      );
    }

    return Column(
      children: vouchers
          .map(
            (v) => _VoucherCard(
              key: ValueKey(v.id),
              voucher: v,
              qty: _qtyOf(v.id),
              enabled: !_isSubmitting,
              onDecrement: () => _setQty(v.id, _qtyOf(v.id) - 1),
              onIncrement: () => _setQty(v.id, _qtyOf(v.id) + 1),
            ),
          )
          .toList(),
    );
  }

  Widget _buildInfoBanner({required IconData icon, required String message}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade400),
          const Gap(10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateField() {
    return GestureDetector(
      onTap: _isSubmitting ? null : _pickSaleDate,
      child: AbsorbPointer(
        child: FTextField(
          control: FTextFieldControl.managed(
            controller: TextEditingController(text: _formatDateDisplay(_saleDate)),
          ),
          label: const Text('Tanggal Penjualan'),
          hint: 'Pilih tanggal',
        ),
      ),
    );
  }

  void _showToast(String message, {bool destructive = false}) {
    showFToast(
      context: context,
      variant: destructive ? FToastVariant.destructive : FToastVariant.primary,
      icon: Icon(
        destructive ? FLucideIcons.alertCircle : FLucideIcons.checkCircle2,
        size: 16,
      ),
      title: Text(message),
    );
  }
}

/// Kartu satu produk: nama + harga voucher + stepper qty.
class _VoucherCard extends StatelessWidget {
  const _VoucherCard({
    super.key,
    required this.voucher,
    required this.qty,
    required this.enabled,
    required this.onDecrement,
    required this.onIncrement,
  });

  final VoucherDto voucher;
  final int qty;
  final bool enabled;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    final subtotal = voucher.price * qty;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: qty > 0
            ? const Color(0xFF0EA573).withAlpha(15)
            : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: qty > 0
              ? const Color(0xFF0EA573).withAlpha(80)
              : Colors.grey.shade200,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  voucher.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(4),
                Text(
                  qty > 0
                      ? 'Rp${_formatPrice(voucher.price)} x $qty = ${_formatPrice(subtotal)}'
                      : 'Rp${_formatPrice(voucher.price)}',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          const Gap(8),
          _QtyStepper(
            qty: qty,
            enabled: enabled,
            onDecrement: onDecrement,
            onIncrement: onIncrement,
          ),
        ],
      ),
    );
  }
}

/// Stepper `-` [qty] `+`. Tombol `-` nonaktif saat qty 0.
class _QtyStepper extends StatelessWidget {
  const _QtyStepper({
    required this.qty,
    required this.enabled,
    required this.onDecrement,
    required this.onIncrement,
  });

  final int qty;
  final bool enabled;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _StepButton(
          icon: FLucideIcons.minus,
          onTap: enabled && qty > 0 ? onDecrement : null,
        ),
        SizedBox(
          width: 40,
          child: Center(
            child: Text(
              '$qty',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        _StepButton(
          icon: FLucideIcons.plus,
          onTap: enabled ? onIncrement : null,
        ),
      ],
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final active = onTap != null;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: active
              ? const Color(0xFF0EA573).withValues(alpha: 0.1)
              : Colors.grey.shade200,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 16,
          color: active ? const Color(0xFF0EA573) : Colors.grey.shade400,
        ),
      ),
    );
  }
}
