import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../shared/widgets/data_error_widget.dart';
import '../../data/models/user_dto.dart';
import '../providers/user_providers.dart';
import 'user_form_page.dart';

class UserPage extends ConsumerStatefulWidget {
  const UserPage({super.key});

  @override
  ConsumerState<UserPage> createState() => _UserPageState();
}

class _UserPageState extends ConsumerState<UserPage> {
  @override
  Widget build(BuildContext context) {
    final usersAsync = ref.watch(userListProvider);

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
                      'Personel',
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
                  if (usersAsync.isLoading) {
                    return _buildList(_skeletonItems, isLoading: true);
                  }

                  if (usersAsync.hasError) {
                    return DataErrorWidget(
                      onRetry: () =>
                          ref.read(userListProvider.notifier).refresh(),
                    );
                  }

                  final items = usersAsync.asData?.value ?? [];

                  if (items.isEmpty) return _buildEmptyState();

                  return RefreshIndicator(
                    onRefresh: () =>
                        ref.read(userListProvider.notifier).refresh(),
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
            child: const Text('Tambah Personel'),
          ),
        ),
      ),
    );
  }

  static const _skeletonItems = [
    UserDto(id: '1', name: 'Personel dummy', username: 'dummy1'),
    UserDto(id: '2', name: 'Personel dummy', username: 'dummy2'),
    UserDto(id: '3', name: 'Personel dummy', username: 'dummy3'),
    UserDto(id: '4', name: 'Personel dummy', username: 'dummy4'),
    UserDto(id: '5', name: 'Personel dummy', username: 'dummy5'),
  ];

  Widget _buildList(List<UserDto> items, {bool isLoading = false}) {
    return Skeletonizer(
      enabled: isLoading,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 80),
        itemCount: items.length,
        separatorBuilder: (_, _) => const Divider(height: 1, indent: 16),
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            key: ValueKey(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              color: Colors.red.shade400,
              child: const Icon(FLucideIcons.trash2, color: Colors.white),
            ),
            confirmDismiss: (_) => _confirmAndDelete(context, item.id),
            child: Material(
              type: MaterialType.transparency,
              child: ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                leading: item.avatar != null && item.avatar!.isNotEmpty
                    ? CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            CachedNetworkImageProvider(item.avatar!),
                        backgroundColor: Colors.grey.shade200,
                      )
                    : CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey.shade200,
                        child: const Icon(FLucideIcons.user,
                            size: 18, color: Colors.grey),
                      ),
                title: Text(
                  item.name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  _buildSubtitle(item),
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

  String _buildSubtitle(UserDto item) {
    final parts = <String>[];
    if (item.username.isNotEmpty) parts.add('@${item.username}');
    if (item.roles.isNotEmpty) parts.add(item.roles.join(', '));
    return parts.join(' · ');
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(FLucideIcons.users, size: 48, color: Colors.grey.shade300),
          const Gap(8),
          Text(
            'Belum ada data personel',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  Future<bool> _confirmAndDelete(BuildContext context, String id) async {
    final confirmed = await showFDialog<String>(
      context: context,
      builder: (context, style, animation) => FDialog(
        title: const Text('Hapus Data'),
        body: const Text('Yakin ingin menghapus personel ini?'),
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
      await ref.read(userListProvider.notifier).delete(id);
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

  Future<void> _showForm({UserDto? item}) async {
    await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (context) => UserFormPage(item: item),
      ),
    );
  }
}
