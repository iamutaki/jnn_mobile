import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../district/data/models/district_dto.dart';
import '../../../district/presentation/providers/district_providers.dart';
import '../../data/models/sub_district_dto.dart';
import '../providers/sub_district_providers.dart';

class SubDistrictPage extends ConsumerStatefulWidget {
  const SubDistrictPage({super.key});

  @override
  ConsumerState<SubDistrictPage> createState() => _SubDistrictPageState();
}

class _SubDistrictPageState extends ConsumerState<SubDistrictPage> {
  static const _skeletonItems = [
    SubDistrictDto(
      id: '1',
      name: 'Desa dummy',
      district: DistrictDto(id: 'd1', name: 'Kecamatan dummy'),
    ),
    SubDistrictDto(
      id: '2',
      name: 'Desa dummy',
      district: DistrictDto(id: 'd1', name: 'Kecamatan dummy'),
    ),
    SubDistrictDto(
      id: '3',
      name: 'Desa dummy',
      district: DistrictDto(id: 'd1', name: 'Kecamatan dummy'),
    ),
    SubDistrictDto(
      id: '4',
      name: 'Desa dummy',
      district: DistrictDto(id: 'd1', name: 'Kecamatan dummy'),
    ),
    SubDistrictDto(
      id: '5',
      name: 'Desa dummy',
      district: DistrictDto(id: 'd1', name: 'Kecamatan dummy'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final subDistrictsAsync = ref.watch(subDistrictListProvider);
    ref.watch(districtListProvider);

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
                      'Desa',
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
                  if (subDistrictsAsync.isLoading) {
                    return _buildList(_skeletonItems, isLoading: true);
                  }

                  if (subDistrictsAsync.hasError) {
                    return _buildError(context);
                  }

                  final items = subDistrictsAsync.asData?.value ?? [];

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
            child: const Text('Tambah Desa'),
          ),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    await ref.read(subDistrictListProvider.notifier).refresh();
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
            onPress: () => ref.read(subDistrictListProvider.notifier).refresh(),
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
          Icon(FLucideIcons.house, size: 48, color: Colors.grey.shade300),
          const Gap(8),
          Text(
            'Belum ada data desa',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<SubDistrictDto> items, {bool isLoading = false}) {
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
                ref.read(subDistrictListProvider.notifier).delete(item.id),
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
                subtitle: Text(
                  item.district?.name ?? '',
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

  Future<bool> _confirmDelete(BuildContext context) async {
    final result = await showFDialog<String>(
      context: context,
      builder: (context, style, animation) => FDialog(
        title: const Text('Hapus Data'),
        body: const Text('Yakin ingin menghapus desa ini?'),
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

  Future<void> _showForm({SubDistrictDto? item}) async {
    final notifier = ref.read(subDistrictListProvider.notifier);
    final districtsAsync = ref.read(districtListProvider);
    final districts = districtsAsync.asData?.value ?? [];

    final success = await showFDialog<bool>(
      context: context,
      builder: (context, style, animation) => _DesaFormDialog(
        initialDistrictId: item?.district?.id ?? '',
        initialName: item?.name ?? '',
        isEditing: item != null,
        districts: districts,
        onSubmit: item != null
            ? (districtId, name) => notifier.edit(item.id, districtId, name)
            : (districtId, name) => notifier.create(districtId, name),
      ),
    );

    if (success != true) return;
  }
}

class _DesaFormDialog extends StatefulWidget {
  final String initialDistrictId;
  final String initialName;
  final bool isEditing;
  final List<DistrictDto> districts;
  final Future<void> Function(String districtId, String name) onSubmit;

  const _DesaFormDialog({
    required this.initialDistrictId,
    required this.initialName,
    required this.isEditing,
    required this.districts,
    required this.onSubmit,
  });

  @override
  State<_DesaFormDialog> createState() => _DesaFormDialogState();
}

class _DesaFormDialogState extends State<_DesaFormDialog> {
  late final TextEditingController _nameCtrl;
  late String _selectedDistrictId;
  bool _isSubmitting = false;
  String? _districtError;
  String? _nameError;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.initialName);
    _selectedDistrictId = widget.initialDistrictId;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  bool _validate() {
    final name = _nameCtrl.text.trim();
    bool valid = true;

    setState(() {
      if (_selectedDistrictId.isEmpty) {
        _districtError = 'Kecamatan harus dipilih';
        valid = false;
      } else {
        _districtError = null;
      }

      if (name.isEmpty) {
        _nameError = 'Nama desa tidak boleh kosong';
        valid = false;
      } else {
        _nameError = null;
      }
    });

    return valid;
  }

  Future<void> _handleSubmit() async {
    if (!_validate() || _isSubmitting) return;

    setState(() => _isSubmitting = true);

    try {
      await widget.onSubmit(_selectedDistrictId, _nameCtrl.text.trim());
      if (!mounted) return;
      Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      showFToast(
        context: context,
        variant: FToastVariant.destructive,
        icon: const Icon(FLucideIcons.alertCircle, size: 16),
        title: Text(e.toString().replaceFirst('Exception: ', '')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final districtOptions = <String, String>{
      'Pilih kecamatan': '',
      for (final d in widget.districts) d.name: d.id,
    };

    return FDialog(
      title: Text(widget.isEditing ? 'Edit Desa' : 'Tambah Desa'),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FSelect<String>(
            items: districtOptions,
            label: const Text('Kecamatan'),
            hint: 'Pilih kecamatan',
            forceErrorText: _districtError,
            control: FSelectControl.managed(
              initial: _selectedDistrictId,
              onChange: (value) {
                setState(() {
                  _selectedDistrictId = value ?? '';
                  _districtError = null;
                });
              },
            ),
          ),
          const Gap(8),
          FTextField(
            control: FTextFieldControl.managed(
              controller: _nameCtrl,
              onChange: (_) {
                if (_nameError != null) {
                  setState(() => _nameError = null);
                }
              },
            ),
            label: const Text('Nama Desa'),
            hint: 'Nama desa',
            error: _nameError != null ? Text(_nameError!) : null,
            readOnly: _isSubmitting,
          ),
        ],
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
