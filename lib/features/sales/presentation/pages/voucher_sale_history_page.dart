import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../shared/widgets/data_error_widget.dart';
import '../../../reseller_voucher_sale/data/models/reseller_voucher_sale_dto.dart';
import '../../../reseller_voucher_sale/presentation/providers/reseller_voucher_sale_providers.dart';
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

class VoucherSaleHistoryPage extends ConsumerStatefulWidget {
  const VoucherSaleHistoryPage({super.key});

  @override
  ConsumerState<VoucherSaleHistoryPage> createState() =>
      _VoucherSaleHistoryPageState();
}

class _VoucherSaleHistoryPageState
    extends ConsumerState<VoucherSaleHistoryPage> {
  static final _skeletonItems = [
    ResellerVoucherSaleDto(
      id: '1',
      saleNo: 'INV-XXXX',
      saleDate: '2026-06-16',
      saleMonth: '2026-06',
      status: 'completed',
      items: const [
        ResellerVoucherSaleItemDto(voucherId: '1', qty: 0, unitPrice: 0),
      ],
      createdAt: DateTime(2024),
      createdByUserId: '1',
    ),
    ResellerVoucherSaleDto(
      id: '2',
      saleNo: 'INV-XXXX',
      saleDate: '2026-06-16',
      saleMonth: '2026-06',
      status: 'draft',
      items: const [
        ResellerVoucherSaleItemDto(voucherId: '2', qty: 0, unitPrice: 0),
      ],
      createdAt: DateTime(2024),
      createdByUserId: '2',
    ),
    ResellerVoucherSaleDto(
      id: '3',
      saleNo: 'INV-XXXX',
      saleDate: '2026-06-16',
      saleMonth: '2026-06',
      status: 'cancelled',
      items: const [
        ResellerVoucherSaleItemDto(voucherId: '3', qty: 0, unitPrice: 0),
      ],
      createdAt: DateTime(2024),
      createdByUserId: '3',
    ),
  ];

  late final VoidCallback _onStateChanged;

  @override
  void initState() {
    super.initState();
    _onStateChanged = () => setState(() {});
    ref.read(saleHistoryPagingProvider).addListener(_onStateChanged);
  }

  @override
  void dispose() {
    ref.read(saleHistoryPagingProvider).removeListener(_onStateChanged);
    super.dispose();
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
                      'Riwayat Penjualan',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 24),
              Expanded(child: _buildBody()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    final pagingController = ref.watch(saleHistoryPagingProvider);
    return RefreshIndicator(
      onRefresh: () async {
        pagingController.refresh();
      },
      backgroundColor: Theme.of(context).colorScheme.surface,
      color: Theme.of(context).colorScheme.primary,
      child: PagedListView<String, ResellerVoucherSaleDto>.separated(
        shrinkWrap: true,
        state: pagingController.value,
        fetchNextPage: () => pagingController.fetchNextPage(),
        builderDelegate: PagedChildBuilderDelegate<ResellerVoucherSaleDto>(
          itemBuilder: (context, item, index) {
            final subtitle = _buildSubtitle(item);
            return _ItemTile(
              item: item,
              subtitle: subtitle,
              status: item.status,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => SalesDetailPage(saleId: item.id),
                ),
              ),
            );
          },
          firstPageProgressIndicatorBuilder: (context) => Skeletonizer(
            enabled: true,
            child: Column(
              children: _skeletonItems.map((item) {
                final subtitle = _buildSubtitle(item);
                return _ItemTile(item: item, subtitle: subtitle);
              }).toList(),
            ),
          ),
          firstPageErrorIndicatorBuilder: (context) =>
              DataErrorWidget(onRetry: () => pagingController.refresh()),
          noItemsFoundIndicatorBuilder: (context) => _buildEmptyState(),
        ),
        separatorBuilder: (context, index) =>
            const Divider(height: 1, indent: 72),
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 80),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(FLucideIcons.clock, size: 48, color: Colors.grey.shade300),
          const Gap(8),
          Text(
            'Belum ada riwayat penjualan',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  /// Total qty & total amount sebuah transaksi.
  /// `totalAmount` dipakai bila disediakan backend; jika tidak, dihitung
  /// client-side dari items.
  String _buildSubtitle(ResellerVoucherSaleDto item) {
    final totalQty =
        item.totalQty ?? item.items.fold<int>(0, (sum, e) => sum + e.qty);
    final totalAmount =
        item.totalAmount ??
        item.items.fold<int>(0, (sum, e) => sum + e.qty * e.unitPrice);
    final parts = <String>['$totalQty qty', 'Rp${_formatPrice(totalAmount)}'];
    return parts.join(' · ');
  }

  static String _statusLabel(String? status) {
    switch (status) {
      case 'draft':
        return 'Draft';
      case 'completed':
        return 'Selesai';
      case 'cancelled':
        return 'Dibatalkan';
      default:
        return status ?? '';
    }
  }

  static Color _statusColor(String? status) {
    switch (status) {
      case 'draft':
        return const Color(0xFFD97706);
      case 'completed':
        return const Color(0xFF059669);
      case 'cancelled':
        return const Color(0xFFDC2626);
      default:
        return Colors.grey;
    }
  }

  static Color _statusBgColor(String? status) {
    switch (status) {
      case 'draft':
        return const Color(0xFFFEF3C7);
      case 'completed':
        return const Color(0xFFD1FAE5);
      case 'cancelled':
        return const Color(0xFFFEE2E2);
      default:
        return Colors.grey.shade100;
    }
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({required this.item, required this.subtitle, this.status, this.onTap});

  final ResellerVoucherSaleDto item;
  final String subtitle;
  final String? status;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // Label utama: nomor invoice. Bila items hanya 1 & ada nama voucher,
    // tampilkan nama voucher sebagai title agar lebih informatif.
    final singleVoucherName = item.items.length == 1
        ? item.items.first.voucher?.name
        : null;
    final title = singleVoucherName ?? item.saleNo ?? 'Penjualan';

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF2563EB).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              FLucideIcons.receiptText,
              color: Color(0xFF2563EB),
              size: 20,
            ),
          ),
          trailing: status != null
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _VoucherSaleHistoryPageState._statusBgColor(status),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    _VoucherSaleHistoryPageState._statusLabel(status!),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: _VoucherSaleHistoryPageState._statusColor(status),
                    ),
                  ),
                )
              : Icon(
                  FLucideIcons.chevronRight,
                  size: 16,
                  color: Colors.grey.shade400,
                ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
