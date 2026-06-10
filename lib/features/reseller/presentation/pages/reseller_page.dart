import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../shared/widgets/data_error_widget.dart';
import '../../../../features/user/data/models/user_dto.dart';
import '../../data/models/reseller_dto.dart';
import '../providers/reseller_providers.dart';
import 'reseller_form_page.dart';

class ResellerPage extends ConsumerStatefulWidget {
  const ResellerPage({super.key});

  @override
  ConsumerState<ResellerPage> createState() => _ResellerPageState();
}

class _ResellerPageState extends ConsumerState<ResellerPage> {
  static const _skeletonItems = [
    ResellerDto(user: UserDto(id: '1', name: 'Reseller dummy', username: 'dummy1')),
    ResellerDto(user: UserDto(id: '2', name: 'Reseller dummy', username: 'dummy2')),
    ResellerDto(user: UserDto(id: '3', name: 'Reseller dummy', username: 'dummy3')),
    ResellerDto(user: UserDto(id: '4', name: 'Reseller dummy', username: 'dummy4')),
    ResellerDto(user: UserDto(id: '5', name: 'Reseller dummy', username: 'dummy5')),
  ];

  @override
  Widget build(BuildContext context) {
    final resellersAsync = ref.watch(resellerListProvider);

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
                      'Reseller',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 24),
              Expanded(
                child: () {
                  if (resellersAsync.isLoading) {
                    return _buildList(_skeletonItems, isLoading: true);
                  }

                  if (resellersAsync.hasError) {
                    return _buildError(context);
                  }

                  final items = resellersAsync.asData?.value ?? [];

                  if (items.isEmpty) return _buildEmptyState();

                  return RefreshIndicator(
                    onRefresh: _onRefresh,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    color: Theme.of(context).colorScheme.primary,
                    child: _buildList(items),
                  );
                }(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: FButton(
            onPress: () => _showForm(),
            prefix: const Icon(FLucideIcons.plus, size: 18),
            variant: FButtonVariant.primary,
            child: const Text('Tambah Reseller'),
          ),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    await ref.read(resellerListProvider.notifier).refresh();
  }

  Widget _buildError(BuildContext context) {
    return DataErrorWidget(
      onRetry: () => ref.read(resellerListProvider.notifier).refresh(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(FLucideIcons.store, size: 48, color: Colors.grey.shade300),
          const Gap(8),
          Text(
            'Belum ada data reseller',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<ResellerDto> items, {bool isLoading = false}) {
    return Skeletonizer(
      enabled: isLoading,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 80),
        itemCount: items.length,
        separatorBuilder: (_, __) => const Divider(height: 1, indent: 16),
        itemBuilder: (context, index) {
          final item = items[index];
          final subtitle = _buildSubtitle(item);

          return Dismissible(
            key: ValueKey(item.user.id),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              color: Colors.red.shade400,
              child: const Icon(FLucideIcons.trash2, color: Colors.white),
            ),
            confirmDismiss: (_) => _confirmAndDelete(context, item.user.id),
            child: Material(
              type: MaterialType.transparency,
              child: ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: item.user.avatar != null && item.user.avatar!.isNotEmpty
                      ? CachedNetworkImageProvider(item.user.avatar!)
                      : null,
                  backgroundColor: Colors.grey.shade200,
                  child: item.user.avatar == null || item.user.avatar!.isEmpty
                      ? const Icon(FLucideIcons.store, size: 18, color: Colors.grey)
                      : null,
                ),
                title: Text(
                  item.user.name,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Icon(
                  FLucideIcons.pencil,
                  size: 16,
                  color: Colors.grey.shade400,
                ),
                onTap: isLoading ? null : () => _showForm(item: item),
              ),
            ),
          );
        },
      ),
    );
  }

  String _buildSubtitle(ResellerDto item) {
    final parts = <String>[];
    if (item.user.username.isNotEmpty) parts.add(item.user.username);
    if (item.subDistrict != null) {
      final subDistrictName = item.subDistrict!.name;
      if (subDistrictName.isNotEmpty) parts.add(subDistrictName);
    }
    return parts.join(' · ');
  }

  Future<bool> _confirmAndDelete(BuildContext context, String id) async {
    final confirmed = await showFDialog<String>(
      context: context,
      builder: (context, style, animation) => FDialog(
        title: const Text('Hapus Data'),
        body: const Text('Yakin ingin menghapus reseller ini?'),
        actions: [
          FButton(
            onPress: () => Navigator.of(context).pop('cancel'),
            variant: FButtonVariant.secondary,
            child: const Text('Batal'),
          ),
          FButton(
            onPress: () => Navigator.of(context).pop('delete'),
            variant: FButtonVariant.destructive,
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (confirmed != 'delete') return false;

    try {
      await ref.read(resellerListProvider.notifier).delete(id);
      return true;
    } catch (e) {
      if (!context.mounted) return false;
      showFToast(
        context: context,
        variant: FToastVariant.destructive,
        icon: const Icon(FLucideIcons.alertCircle, size: 16),
        title: Text(
          e.toString().replaceFirst('Exception: ', ''),
        ),
      );
      return false;
    }
  }

  Future<void> _showForm({ResellerDto? item}) async {
    final success = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (context) => ResellerFormPage(item: item),
      ),
    );

    if (success == true) {
      // List will auto-refresh via the notifier's create/edit methods
    }
  }
}
