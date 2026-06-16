import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../shared/widgets/data_error_widget.dart';
import '../../../digital_voucher/presentation/providers/digital_voucher_providers.dart';
import '../../../reseller_voucher_sale/data/models/reseller_voucher_sale_detail_dto.dart';
import '../../../reseller_voucher_sale/presentation/providers/reseller_voucher_sale_providers.dart';
import '../../../voucher/data/models/voucher_dto.dart';
import '../../../voucher/presentation/providers/voucher_providers.dart';

String _formatPrice(int price) {
  final str = price.toString();
  final buffer = StringBuffer();
  for (var i = 0; i < str.length; i++) {
    if (i > 0 && (str.length - i) % 3 == 0) buffer.write('.');
    buffer.write(str[i]);
  }
  return buffer.toString();
}

const _shortMonths = <String>[
  'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
  'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des',
];

/// Format "YYYY-MM-DD" → "16 Jun 2026".
String _formatSaleDate(String iso) {
  final d = DateTime.tryParse(iso);
  if (d == null) return iso;
  return '${d.day} ${_shortMonths[d.month - 1]} ${d.year}';
}

/// Halaman detail sale.
///
/// - `status == draft` → tampilkan tombol **Tampilkan Kode** (POST
///   `/v1/reseller-voucher-sale/:id/complete`, 204) lalu re-fetch.
/// - `status == completed` → tampilkan kode voucher tiap allocatedCode,
///   di-fetch via `GET /v1/digital-voucher/:id`. Kode bisa di-copy / difoto.
/// - `status == cancelled` → tampilkan catatan.
class SalesDetailPage extends ConsumerStatefulWidget {
  const SalesDetailPage({super.key, required this.saleId, this.showBackButton = true});

  final String saleId;
  final bool showBackButton;

  @override
  ConsumerState<SalesDetailPage> createState() => _SalesDetailPageState();
}

class _SalesDetailPageState extends ConsumerState<SalesDetailPage> {
  bool _isCompleting = false;
  bool _codesRevealed = false;

  Future<void> _onTampilkanKode() async {
    // complete() HANYA dipanggil saat status masih draft (tap pertama).
    // Sale yang sudah completed cukup reveal kode tanpa call complete lagi.
    final isDraft = ref
            .read(resellerVoucherSaleDetailProvider(widget.saleId))
            .asData
            ?.value
            .status ==
        'draft';

    if (isDraft) {
      setState(() => _isCompleting = true);
      try {
        await ref
            .read(resellerVoucherSaleDetailProvider(widget.saleId).notifier)
            .complete();
      } catch (e) {
        if (!mounted) return;
        setState(() => _isCompleting = false);
        _showToast(
          e.toString().replaceFirst('Exception: ', ''),
          destructive: true,
        );
        return;
      }
      if (!mounted) return;
      setState(() => _isCompleting = false);
    }

    // Reveal kode (status kini 'completed').
    setState(() => _codesRevealed = true);
  }

  void _copyCode(String code) {
    Clipboard.setData(ClipboardData(text: code));
    _showToast('Kode disalin');
  }

  void _showToast(String message, {bool destructive = false}) {
    showFToast(
      context: context,
      variant:
          destructive ? FToastVariant.destructive : FToastVariant.primary,
      icon: Icon(
        destructive ? FLucideIcons.alertCircle : FLucideIcons.checkCircle2,
        size: 16,
      ),
      title: Text(message),
    );
  }

  @override
  Widget build(BuildContext context) {
    final detailAsync = ref.watch(resellerVoucherSaleDetailProvider(widget.saleId));
    final vouchersAsync = ref.watch(voucherListProvider);
    final nameMap = <String, String>{
      for (final v in (vouchersAsync.asData?.value ?? const <VoucherDto>[]))
        v.id: v.name,
    };

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
                      'Detail Penjualan',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 24),
              Expanded(
                child: detailAsync.when(
                  loading: () => _buildSkeleton(),
                  error: (e, _) => DataErrorWidget(
                    onRetry: () => ref
                        .read(resellerVoucherSaleDetailProvider(widget.saleId)
                            .notifier)
                        .refresh(),
                  ),
                  data: (detail) => ListView(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                    children: [
                      _buildSummary(detail),
                      const Gap(16),
                      _buildStatusSection(detail, nameMap),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummary(ResellerVoucherSaleDetailDto detail) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  detail.saleNo ?? 'Draft',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              _statusBadge(detail.status),
            ],
          ),
          const Gap(4),
          Text(
            _formatSaleDate(detail.saleDate),
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
          ),
          const Divider(height: 24),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Qty',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const Gap(2),
                    Text(
                      '${detail.totalQty ?? detail.items.fold<int>(0, (s, i) => s + i.qty)}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const Gap(2),
                    Text(
                      'Rp${_formatPrice(detail.totalAmount ?? _itemsTotal(detail))}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0EA573),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  int _itemsTotal(ResellerVoucherSaleDetailDto detail) =>
      detail.items.fold<int>(0, (s, i) => s + (i.totalAmount ?? i.qty * i.unitPrice));

  /// Placeholder loading yang menyerupai layout detail (summary + item).
  Widget _buildSkeleton() {
    return Skeletonizer(
      enabled: true,
      containersColor: const Color(0xFFEBEBF4),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Memuat nomor sale…',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text('Draft'),
                  ],
                ),
                Gap(4),
                Text('16 Jun 2026', style: TextStyle(fontSize: 13)),
              ],
            ),
          ),
          const Gap(16),
          const Text(
            'Memuat detail item…',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  /// Section yang berubah sesuai status.
  ///
  /// Tombol tampil untuk semua status kecuali `cancelled`. Kode hanya tampil
  /// setelah user menekan tombol (reveal). complete() hanya dipanggil saat
  /// status masih `draft` — lihat [_onTampilkanKode].
  Widget _buildStatusSection(
    ResellerVoucherSaleDetailDto detail,
    Map<String, String> nameMap,
  ) {
    if (detail.status == 'cancelled') {
      return _buildInfoBanner(
        icon: FLucideIcons.xCircle,
        message: 'Transaksi dibatalkan.',
        color: const Color(0xFFDC2626),
      );
    }

    // Kode tampil hanya setelah user menekan tombol (reveal).
    if (detail.status == 'completed' && _codesRevealed) {
      return _buildCodes(detail, nameMap);
    }

    // draft (tap pertama → complete) ATAU completed-belum-reveal (cukup reveal).
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildInfoBanner(
          icon: FLucideIcons.ticket,
          message: detail.status == 'draft'
              ? 'Selesaikan transaksi untuk menampilkan kode voucher.'
              : 'Kode voucher siap ditampilkan.',
        ),
        const Gap(12),
        FButton(
          onPress: _isCompleting ? null : _onTampilkanKode,
          variant: FButtonVariant.primary,
          child: _isCompleting
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: FCircularProgress.loader(),
                )
              : const Text('Tampilkan Kode'),
        ),
      ],
    );
  }

  Widget _buildCodes(
    ResellerVoucherSaleDetailDto detail,
    Map<String, String> nameMap,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kode Voucher',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade500,
          ),
        ),
        const Gap(8),
        for (final item in detail.items) ...[
          _ItemCodesCard(item: item, nameMap: nameMap, onCopy: _copyCode),
          const Gap(12),
        ],
      ],
    );
  }

  Widget _buildInfoBanner({
    required IconData icon,
    required String message,
    Color color = const Color(0xFF0EA573),
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(40)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const Gap(10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusBadge(String status) {
    final (label, color) = switch (status) {
      'completed' => ('Selesai', const Color(0xFF0EA573)),
      'cancelled' => ('Dibatalkan', const Color(0xFFDC2626)),
      _ => ('Draft', const Color(0xFFB45309)),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

/// Kartu satu item: header (nama voucher + qty × harga = total) lalu daftar
/// kode (tiap kode di-fetch via digitalVoucherDetailProvider).
class _ItemCodesCard extends ConsumerWidget {
  const _ItemCodesCard({
    required this.item,
    required this.nameMap,
    required this.onCopy,
  });

  final ResellerVoucherSaleDetailItemDto item;
  final Map<String, String> nameMap;
  final void Function(String code) onCopy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = nameMap[item.voucherId] ?? item.voucherId;
    final total = item.totalAmount ?? item.qty * item.unitPrice;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const Gap(2),
          Text(
            '${item.qty} × Rp${_formatPrice(item.unitPrice)} = Rp${_formatPrice(total)}',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          ),
          const Gap(4),
          for (final code in item.allocatedCodes)
            _CodeRow(
              digitalVoucherId: code.id,
              onCopy: onCopy,
            ),
        ],
      ),
    );
  }
}

/// Satu baris kode voucher; menampilkan kode (selectable) + tombol copy.
class _CodeRow extends ConsumerWidget {
  const _CodeRow({required this.digitalVoucherId, required this.onCopy});

  final String digitalVoucherId;
  final void Function(String code) onCopy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(digitalVoucherDetailProvider(digitalVoucherId));
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: async.when(
        loading: () => const Text(
          '••••••••',
          style: TextStyle(
            fontFamily: 'monospace',
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        error: (e, _) => const Text(
          'Gagal memuat kode',
          style: TextStyle(fontSize: 13, color: Colors.red),
        ),
        data: (dv) {
          final code = dv.code;
          return Row(
            children: [
              Expanded(
                child: SelectableText(
                  code ?? '-',
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (code != null && code.isNotEmpty)
                GestureDetector(
                  onTap: () => onCopy(code),
                  child: Icon(
                    FLucideIcons.copy,
                    size: 16,
                    color: Colors.grey.shade500,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
