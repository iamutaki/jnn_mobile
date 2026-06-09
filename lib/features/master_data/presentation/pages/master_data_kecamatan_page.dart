import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../district/data/models/district_dto.dart';
import '../../../district/presentation/providers/district_providers.dart';

class MasterDataKecamatanPage extends ConsumerStatefulWidget {
  const MasterDataKecamatanPage({super.key});

  @override
  ConsumerState<MasterDataKecamatanPage> createState() =>
      _MasterDataKecamatanPageState();
}

class _MasterDataKecamatanPageState
    extends ConsumerState<MasterDataKecamatanPage> {
  @override
  Widget build(BuildContext context) {
    final districtsAsync = ref.watch(districtListProvider);

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
                      'Kecamatan',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 24),
              Expanded(
                child: districtsAsync.when(
                  loading: () => const Center(
                    child: FCircularProgress.loader(),
                  ),
                  error: (error, _) => _buildError(context),
                  data: (items) =>
                      items.isEmpty ? _buildEmptyState() : _buildList(items),
                ),
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
            child: const Text('Tambah Kecamatan'),
          ),
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(FLucideIcons.alertCircle, size: 48, color: Colors.grey.shade400),
          const Gap(8),
          Text(
            'Gagal memuat data',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
          const Gap(12),
          FButton(
            variant: FButtonVariant.outline,
            onPress: () =>
                ref.invalidate(districtListProvider),
            child: const Text('Coba Lagi'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(FLucideIcons.map, size: 48, color: Colors.grey.shade300),
          const Gap(8),
          Text(
            'Belum ada data kecamatan',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<DistrictDto> items) {
    return ListView.separated(
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
          confirmDismiss: (_) => _confirmDelete(context),
          onDismissed: (_) =>
              ref.read(districtListProvider.notifier).delete(item.id),
          child: ListTile(
            dense: true,
            visualDensity: VisualDensity.compact,
            title: Text(
              item.name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(
              FLucideIcons.pencil,
              size: 16,
              color: Colors.grey.shade400,
            ),
            onTap: () => _showForm(item: item),
          ),
        );
      },
    );
  }

  Future<bool> _confirmDelete(BuildContext context) async {
    final result = await showFDialog<String>(
      context: context,
      builder: (context, style, animation) => FDialog(
        title: const Text('Hapus Data'),
        body: const Text('Yakin ingin menghapus kecamatan ini?'),
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
    return result == 'delete';
  }

  Future<void> _showForm({DistrictDto? item}) async {
    final result = await showFDialog<String>(
      context: context,
      builder: (context, style, animation) => _KecamatanFormDialog(
        initialValue: item?.name ?? '',
        isEditing: item != null,
      ),
    );

    if (result != null && result.isNotEmpty) {
      final notifier = ref.read(districtListProvider.notifier);
      if (item != null) {
        await notifier.edit(item.id, result);
      } else {
        await notifier.create(result);
      }
      ref.invalidate(districtListProvider);
    }
  }
}

class _KecamatanFormDialog extends StatefulWidget {
  final String initialValue;
  final bool isEditing;

  const _KecamatanFormDialog({
    required this.initialValue,
    required this.isEditing,
  });

  @override
  State<_KecamatanFormDialog> createState() => _KecamatanFormDialogState();
}

class _KecamatanFormDialogState extends State<_KecamatanFormDialog> {
  late final TextEditingController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FDialog(
      title: Text(widget.isEditing ? 'Edit Kecamatan' : 'Tambah Kecamatan'),
      body: FTextField(
        control: FTextFieldControl.managed(controller: _ctrl),
        label: const Text('Nama Kecamatan'),
        hint: 'Nama kecamatan',
      ),
      actions: [
        FButton(
          onPress: () {
            final value = _ctrl.text.trim();
            if (value.isEmpty) return;
            Navigator.of(context).pop(value);
          },
          child: Text(widget.isEditing ? 'Simpan' : 'Tambah'),
        ),
      ],
    );
  }
}
