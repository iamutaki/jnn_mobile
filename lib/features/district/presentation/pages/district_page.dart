import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/models/district_dto.dart';
import '../providers/district_providers.dart';

class DistrictPage extends ConsumerStatefulWidget {
  const DistrictPage({super.key});

  @override
  ConsumerState<DistrictPage> createState() => _DistrictPageState();
}

class _DistrictPageState extends ConsumerState<DistrictPage> {
  /// Dummy data untuk skeleton placeholder.
  static const _skeletonItems = [
    DistrictDto(id: '1', name: 'Kecamatan dummy'),
    DistrictDto(id: '2', name: 'Kecamatan dummy'),
    DistrictDto(id: '3', name: 'Kecamatan dummy'),
    DistrictDto(id: '4', name: 'Kecamatan dummy'),
    DistrictDto(id: '5', name: 'Kecamatan dummy'),
  ];

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
                child: () {
                  // Loading (init, refresh, invalidate) → selalu tampilkan skeleton.
                  if (districtsAsync.isLoading) {
                    return _buildList(_skeletonItems, isLoading: true);
                  }

                  // Error.
                  if (districtsAsync.hasError) {
                    return _buildError(context);
                  }

                  final items = districtsAsync.asData?.value ?? [];

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
            child: const Text('Tambah Kecamatan'),
          ),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    await ref.read(districtListProvider.notifier).refresh();
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
            onPress: () => ref.read(districtListProvider.notifier).refresh(),
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

  Widget _buildList(List<DistrictDto> items, {bool isLoading = false}) {
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
            confirmDismiss: (_) => _confirmDelete(context),
            onDismissed: (_) =>
                ref.read(districtListProvider.notifier).delete(item.id),
            child: Material(
              type: MaterialType.transparency,
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
                onTap: isLoading ? null : () => _showForm(item: item),
              ),
            ),
          );
        },
      ),
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
    final notifier = ref.read(districtListProvider.notifier);
    final success = await showFDialog<bool>(
      context: context,
      builder: (context, style, animation) => _KecamatanFormDialog(
        initialValue: item?.name ?? '',
        isEditing: item != null,
        onSubmit: item != null
            ? (value) => notifier.edit(item.id, value)
            : (value) => notifier.create(value),
      ),
    );

    // Jika null = user batal, jika false = gagal (toast sudah ditampilkan di dialog).
    // Jika true = berhasil, list sudah di-refresh oleh notifier.
    if (success != true) return;
  }
}

class _KecamatanFormDialog extends StatefulWidget {
  final String initialValue;
  final bool isEditing;
  final Future<void> Function(String value) onSubmit;

  const _KecamatanFormDialog({
    required this.initialValue,
    required this.isEditing,
    required this.onSubmit,
  });

  @override
  State<_KecamatanFormDialog> createState() => _KecamatanFormDialogState();
}

class _KecamatanFormDialogState extends State<_KecamatanFormDialog> {
  late final TextEditingController _ctrl;
  bool _isSubmitting = false;

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

  Future<void> _handleSubmit() async {
    final value = _ctrl.text.trim();
    if (value.isEmpty || _isSubmitting) return;

    setState(() => _isSubmitting = true);

    try {
      await widget.onSubmit(value);
      if (!mounted) return;
      Navigator.of(context).pop(true); // Berhasil → tutup dialog.
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      showFToast(
        context: context,
        variant: FToastVariant.destructive,
        icon: const Icon(FLucideIcons.alertCircle, size: 16),
        title: Text(
          e.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FDialog(
      title: Text(widget.isEditing ? 'Edit Kecamatan' : 'Tambah Kecamatan'),
      body: FTextField(
        control: FTextFieldControl.managed(controller: _ctrl),
        label: const Text('Nama Kecamatan'),
        hint: 'Nama kecamatan',
        readOnly: _isSubmitting,
      ),
      actions: [
        FButton(
          onPress: _isSubmitting ? null : _handleSubmit,
          child: _isSubmitting
              ? SizedBox(
                  width: 16,
                  height: 16,
                  child: FCircularProgress.loader(),
                )
              : Text(widget.isEditing ? 'Simpan' : 'Tambah'),
        ),
      ],
    );
  }
}
