import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../shared/widgets/data_error_widget.dart';
import '../../../digital_voucher/data/models/digital_voucher_import_dto.dart';
import '../../../digital_voucher/domain/providers/digital_voucher_domain_providers.dart';
import '../../../voucher/data/models/voucher_dto.dart';

class VoucherStockHistoryPage extends ConsumerStatefulWidget {
  const VoucherStockHistoryPage({super.key});

  @override
  ConsumerState<VoucherStockHistoryPage> createState() =>
      _VoucherStockHistoryPageState();
}

class _VoucherStockHistoryPageState
    extends ConsumerState<VoucherStockHistoryPage> {
  static final _skeletonItems = [
    DigitalVoucherImportDto(
      id: '1',
      voucher: const VoucherDto(id: '1', name: 'Memuat…', price: 0),
      totalCodes: 0,
      createdAt: DateTime(2024),
      createdByUserId: '1',
    ),
    DigitalVoucherImportDto(
      id: '2',
      voucher: const VoucherDto(id: '2', name: 'Memuat…', price: 0),
      totalCodes: 0,
      createdAt: DateTime(2024),
      createdByUserId: '2',
    ),
    DigitalVoucherImportDto(
      id: '3',
      voucher: const VoucherDto(id: '3', name: 'Memuat…', price: 0),
      totalCodes: 0,
      createdAt: DateTime(2024),
      createdByUserId: '3',
    ),
    DigitalVoucherImportDto(
      id: '4',
      voucher: const VoucherDto(id: '4', name: 'Memuat…', price: 0),
      totalCodes: 0,
      createdAt: DateTime(2024),
      createdByUserId: '4',
    ),
    DigitalVoucherImportDto(
      id: '5',
      voucher: const VoucherDto(id: '5', name: 'Memuat…', price: 0),
      totalCodes: 0,
      createdAt: DateTime(2024),
      createdByUserId: '5',
    ),
  ];

  String? _nextCursor;
  late final PagingController<String, DigitalVoucherImportDto>
      _pagingController;
  late final VoidCallback _onStateChanged;

  @override
  void initState() {
    super.initState();
    _onStateChanged = () => setState(() {});
    _pagingController = PagingController<String, DigitalVoucherImportDto>(
      getNextPageKey: (state) {
        if (state.keys == null || state.keys!.isEmpty) return '';
        return _nextCursor;
      },
      fetchPage: _fetchPage,
    );
    _pagingController.addListener(_onStateChanged);
  }

  Future<List<DigitalVoucherImportDto>> _fetchPage(String pageKey) async {
    final useCase = ref.read(getImportHistoryUseCaseProvider);
    final cursor = pageKey.isEmpty ? null : pageKey;
    final result = await useCase(cursor);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (page) {
        _nextCursor = page.nextCursor;
        return page.items;
      },
    );
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
                      'Riwayat Impor',
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
      child: PagedListView<String, DigitalVoucherImportDto>.separated(
        shrinkWrap: true,
        state: _pagingController.value,
        fetchNextPage: () => _pagingController.fetchNextPage(),
        builderDelegate: PagedChildBuilderDelegate<DigitalVoucherImportDto>(
          itemBuilder: (context, item, index) {
            final subtitle = _buildSubtitle(item);
            return _ItemTile(item: item, subtitle: subtitle);
          },
          firstPageProgressIndicatorBuilder: (context) => Skeletonizer(
            enabled: true,
            containersColor: const Color(0xFFEBEBF4),
            child: Column(
              children: _skeletonItems.map((item) {
                final subtitle = _buildSubtitle(item);
                return _ItemTile(item: item, subtitle: subtitle);
              }).toList(),
            ),
          ),
          firstPageErrorIndicatorBuilder: (context) => DataErrorWidget(
            onRetry: () => _pagingController.refresh(),
          ),
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
            'Belum ada riwayat impor',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  String _buildSubtitle(DigitalVoucherImportDto item) {
    final parts = <String>[];
    parts.add('${item.totalCodes} kode');
    final sd = item.subDistrict;
    if (sd != null) {
      final districtName = sd.district?.name;
      parts.add(districtName != null ? '${sd.name}, $districtName' : sd.name);
    }
    final date = item.createdAt;
    parts.add(
      '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}',
    );
    return parts.join(' · ');
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({required this.item, required this.subtitle});

  final DigitalVoucherImportDto item;
  final String subtitle;

  static const Color _iconColor = Color(0xFF0EA573);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _iconColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            FLucideIcons.fileSpreadsheet,
            color: _iconColor,
            size: 20,
          ),
        ),
        title: Text(
          item.voucher.name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
