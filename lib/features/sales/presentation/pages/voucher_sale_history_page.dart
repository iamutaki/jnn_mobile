import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../shared/widgets/data_error_widget.dart';
import '../../../reseller_voucher_sale/data/models/reseller_voucher_sale_dto.dart';
import '../../../reseller_voucher_sale/domain/providers/reseller_voucher_sale_domain_providers.dart';
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
      items: const [
        ResellerVoucherSaleItemDto(voucherId: '3', qty: 0, unitPrice: 0),
      ],
      createdAt: DateTime(2024),
      createdByUserId: '3',
    ),
  ];

  String? _nextCursor;
  late final PagingController<String, ResellerVoucherSaleDto> _pagingController;
  late final VoidCallback _onStateChanged;

  @override
  void initState() {
    super.initState();
    _onStateChanged = () => setState(() {});
    _pagingController = PagingController<String, ResellerVoucherSaleDto>(
      getNextPageKey: (state) {
        if (state.keys == null || state.keys!.isEmpty) return '';
        return _nextCursor;
      },
      fetchPage: _fetchPage,
    );
    _pagingController.addListener(_onStateChanged);
  }

  Future<List<ResellerVoucherSaleDto>> _fetchPage(String pageKey) async {
    final useCase = ref.read(getResellerVoucherSaleHistoryUseCaseProvider);
    final cursor = pageKey.isEmpty ? null : pageKey;
    final result = await useCase(cursor);
    return result.fold((failure) => throw Exception(failure.message), (page) {
      _nextCursor = page.nextCursor;
      return page.items;
    });
  }

  @override
  void dispose() {
    _pagingController.removeListener(_onStateChanged);
    _pagingController.dispose();
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
    return RefreshIndicator(
      onRefresh: () async {
        _pagingController.refresh();
      },
      backgroundColor: Theme.of(context).colorScheme.surface,
      color: Theme.of(context).colorScheme.primary,
      child: PagedListView<String, ResellerVoucherSaleDto>.separated(
        shrinkWrap: true,
        state: _pagingController.value,
        fetchNextPage: () => _pagingController.fetchNextPage(),
        builderDelegate: PagedChildBuilderDelegate<ResellerVoucherSaleDto>(
          itemBuilder: (context, item, index) {
            final subtitle = _buildSubtitle(item);
            return _ItemTile(
              item: item,
              subtitle: subtitle,
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
              DataErrorWidget(onRetry: () => _pagingController.refresh()),
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
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({required this.item, required this.subtitle, this.onTap});

  final ResellerVoucherSaleDto item;
  final String subtitle;
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
          trailing: Icon(
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
