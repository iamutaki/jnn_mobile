import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:qr_flutter/qr_flutter.dart';

import '../../../../shared/widgets/data_error_widget.dart';
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
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'Mei',
  'Jun',
  'Jul',
  'Agu',
  'Sep',
  'Okt',
  'Nov',
  'Des',
];

/// Format "YYYY-MM-DD" → "16 Jun 2026".
String _formatSaleDate(String iso) {
  final d = DateTime.tryParse(iso);
  if (d == null) return iso;
  return '${d.day} ${_shortMonths[d.month - 1]} ${d.year}';
}

/// Halaman detail sale.
///
/// Kode voucher dibaca langsung dari `allocatedCodes[].code` di response sales
/// detail (tidak ada fetch terpisah):
/// - Default tampilkan `••••••`, tap pada kartu untuk reveal kode (hanya saat
///   `status == completed` dan kode tersedia).
/// - `status == draft` → tersedia tombol **Pembayaran Diterima**.
/// - `status == cancelled` → tampilkan catatan.
class SalesDetailPage extends ConsumerStatefulWidget {
  const SalesDetailPage({
    super.key,
    required this.saleId,
    this.showBackButton = true,
  });

  final String saleId;
  final bool showBackButton;

  @override
  ConsumerState<SalesDetailPage> createState() => _SalesDetailPageState();
}

class _SalesDetailPageState extends ConsumerState<SalesDetailPage> {
  bool _isCompleting = false;
  bool _isCancelling = false;

  Future<void> _onConfirmPayment() async {
    // Tombol ini hanya tampil saat status `draft`. complete() memicu re-fetch
    // → status jadi `completed` → kode tampil plain di build berikutnya.
    final isDraft =
        ref
            .read(resellerVoucherSaleDetailProvider(widget.saleId))
            .asData
            ?.value
            .status ==
        'draft';

    if (!isDraft) return;

    setState(() => _isCompleting = true);
    try {
      await ref
          .read(resellerVoucherSaleDetailProvider(widget.saleId).notifier)
          .complete();
      ref.read(saleHistoryPagingProvider).refresh();
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

  Future<void> _onCancel() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Batalkan Transaksi'),
        content: const Text('Yakin ingin membatalkan transaksi ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Tidak'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(
              'Ya, Batalkan',
              style: TextStyle(color: Colors.red.shade600),
            ),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    if (!mounted) return;

    setState(() => _isCancelling = true);
    try {
      await ref
          .read(resellerVoucherSaleDetailProvider(widget.saleId).notifier)
          .cancel();
      ref.read(saleHistoryPagingProvider).refresh();
    } catch (e) {
      if (!mounted) return;
      setState(() => _isCancelling = false);
      _showToast(
        e.toString().replaceFirst('Exception: ', ''),
        destructive: true,
      );
      return;
    }
    if (!mounted) return;
    setState(() => _isCancelling = false);
  }

  void _copyCode(String code) {
    Clipboard.setData(ClipboardData(text: code));
    _showToast('Kode $code disalin');
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

  @override
  Widget build(BuildContext context) {
    final detailAsync = ref.watch(
      resellerVoucherSaleDetailProvider(widget.saleId),
    );
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
                        .read(
                          resellerVoucherSaleDetailProvider(
                            widget.saleId,
                          ).notifier,
                        )
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

  int _itemsTotal(ResellerVoucherSaleDetailDto detail) => detail.items
      .fold<int>(0, (s, i) => s + (i.totalAmount ?? i.qty * i.unitPrice));

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
  /// - `cancelled` → banner.
  /// - `completed` → voucher tampil, kode **plain**.
  /// - `draft` → info + tombol **Pembayaran Diterima**; kode `******`.
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

    final hasCodes = detail.items.any((i) => i.allocatedCodes.isNotEmpty);
    final completed = detail.status == 'completed';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (detail.status == 'draft') ...[
          _buildInfoBanner(
            icon: FLucideIcons.ticket,
            message: 'Selesaikan transaksi untuk membuka kode voucher.',
          ),
          const Gap(12),
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: FButton(
                  onPress: _isCancelling ? null : _onCancel,
                  variant: FButtonVariant.destructive,
                  child: _isCancelling
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: FCircularProgress.loader(),
                        )
                      : const Text('Batalkan'),
                ),
              ),
              const Gap(12),
              SizedBox(
                width: double.infinity,
                child: FButton(
                  onPress: _isCompleting ? null : _onConfirmPayment,
                  variant: FButtonVariant.primary,
                  child: _isCompleting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: FCircularProgress.loader(),
                        )
                      : const Text('Pembayaran Diterima'),
                ),
              ),
            ],
          ),
          if (hasCodes) const Gap(16),
        ],
        if (hasCodes) _buildCodes(detail, nameMap, completed: completed),
      ],
    );
  }

  /// Daftar voucher (per item → per allocatedCode). [completed] menentukan
  /// apakah reveal kode diperbolehkan.
  Widget _buildCodes(
    ResellerVoucherSaleDetailDto detail,
    Map<String, String> nameMap, {
    required bool completed,
  }) {
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
          _VoucherGroup(
            item: item,
            nameMap: nameMap,
            completed: completed,
            onCopy: _copyCode,
          ),
          const Gap(16),
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

/// Satu grup voucher: header "{nama} ({n} Voucher)" lalu satu kartu tiket
/// per `allocatedCode`.
class _VoucherGroup extends StatelessWidget {
  const _VoucherGroup({
    required this.item,
    required this.nameMap,
    required this.completed,
    required this.onCopy,
  });

  final ResellerVoucherSaleDetailItemDto item;
  final Map<String, String> nameMap;
  final bool completed;
  final void Function(String code) onCopy;

  @override
  Widget build(BuildContext context) {
    final name = nameMap[item.voucherId] ?? item.voucherId;
    final count = item.allocatedCodes.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
              ),
              const Gap(8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: _VoucherTicket.accent.withAlpha(20),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  '$count Voucher',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: _VoucherTicket.accent,
                  ),
                ),
              ),
            ],
          ),
        ),
        for (final ac in item.allocatedCodes)
          _VoucherTicket(
            voucherName: name,
            code: ac.code,
            unitPrice: item.unitPrice,
            completed: completed,
            onCopy: onCopy,
          ),
      ],
    );
  }
}

/// Kartu tiket voucher per `allocatedCode`.
///
/// Default menampilkan `••••••`, tap pada area info untuk reveal kode.
/// QR code di kiri, tap untuk preview/zoom. Tinggi konsisten antara state.
class _VoucherTicket extends StatefulWidget {
  const _VoucherTicket({
    required this.voucherName,
    required this.code,
    required this.unitPrice,
    required this.completed,
    required this.onCopy,
  });

  final String voucherName;
  final String? code;
  final int unitPrice;
  final bool completed;
  final void Function(String code) onCopy;

  static const Color accent = Color(0xFF1447E6);

  @override
  State<_VoucherTicket> createState() => _VoucherTicketState();
}

class _VoucherTicketState extends State<_VoucherTicket> {
  bool _revealed = false;
  static const double _qrSize = 96.0;
  static const double _qrAreaWidth = 120.0;

  @override
  Widget build(BuildContext context) {
    final hasCode =
        widget.completed && widget.code != null && widget.code!.isNotEmpty;
    final display = _revealed && hasCode ? widget.code! : '••••••';

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 30),
                _buildQrSection(hasCode),
                Expanded(child: _buildInfoContent(hasCode, display)),
                const SizedBox(width: 30),
              ],
            ),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: 30,
              child: _buildAccentStrip(),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: 30,
              child: Container(
                decoration: BoxDecoration(
                  color: _VoucherTicket.accent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  ),
                ),
                alignment: Alignment.center,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    'JNN WiFi',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccentStrip() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14),
          bottomLeft: Radius.circular(14),
        ),
      ),
      child: Center(
        child: RotatedBox(
          quarterTurns: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              _formatPrice(widget.unitPrice),
              style: TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQrSection(bool hasCode) {
    return GestureDetector(
      onTap: hasCode ? () => _showQrPreview(context) : null,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: _qrAreaWidth,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: 'https://jnn.net/login.html?code=${widget.code ?? ''}',
              version: QrVersions.auto,
              size: _qrSize,
              backgroundColor: Colors.white,
              eyeStyle: const QrEyeStyle(
                eyeShape: QrEyeShape.square,
                color: Colors.black,
              ),
              dataModuleStyle: const QrDataModuleStyle(
                dataModuleShape: QrDataModuleShape.square,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoContent(bool hasCode, String display) {
    return GestureDetector(
      onTap: hasCode ? () => setState(() => _revealed = !_revealed) : null,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.voucherName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade800,
              ),
            ),
            const Gap(8),
            SizedBox(
              height: 34,
              child: Row(
                children: [
                  Icon(
                    hasCode && _revealed
                        ? FLucideIcons.eye
                        : FLucideIcons.eyeOff,
                    size: 17,
                    color: _VoucherTicket.accent.withAlpha(180),
                  ),
                  const Gap(8),
                  Expanded(
                    child: Text(
                      display,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                        color: hasCode ? const Color(0xFF111827) : Colors.grey,
                      ),
                    ),
                  ),
                  if (hasCode)
                    GestureDetector(
                      onTap: () => widget.onCopy(widget.code!),
                      child: Icon(
                        FLucideIcons.copy,
                        size: 18,
                        color: _VoucherTicket.accent,
                      ),
                    )
                  else
                    const SizedBox(width: 24, height: 24),
                ],
              ),
            ),
            if (hasCode) ...[
              const Gap(3),
              Text(
                _revealed ? 'Tap untuk sembunyikan' : 'Tap untuk lihat kode',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade400),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showQrPreview(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.voucherName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(ctx).pop(),
                    child: const Icon(FLucideIcons.x, size: 20),
                  ),
                ],
              ),
              const Gap(20),
              Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                clipBehavior: Clip.antiAlias,
                child: InteractiveViewer(
                  minScale: 0.5,
                  maxScale: 4.0,
                  child: Center(
                    child: QrImageView(
                      data: 'https://jnn.net/login.html?code=${widget.code!}',
                      version: QrVersions.auto,
                      size: 290,
                      backgroundColor: Colors.white,
                      eyeStyle: const QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: Colors.black,
                      ),
                      dataModuleStyle: const QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.square,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SelectableText(
                  widget.code!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const Gap(16),
              SizedBox(
                width: double.infinity,
                child: FButton(
                  onPress: () => Navigator.of(ctx).pop(),
                  variant: FButtonVariant.secondary,
                  child: const Text('Tutup'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
