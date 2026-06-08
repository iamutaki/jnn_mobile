import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

class MasterDataDesaPage extends StatefulWidget {
  const MasterDataDesaPage({super.key});

  @override
  State<MasterDataDesaPage> createState() => _MasterDataDesaPageState();
}

class _MasterDataDesaPageState extends State<MasterDataDesaPage> {
  static const _kecamatanOptions = {
    'Pilih kecamatan': '',
    'Kecamatan A': 'A',
    'Kecamatan B': 'B',
    'Kecamatan C': 'C',
  };

  final _items = <Map<String, String>>[];

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
                child: _items.isEmpty ? _buildEmptyState() : _buildList(),
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

  Widget _buildList() {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: _items.length,
      separatorBuilder: (_, _) => const Divider(height: 1, indent: 16),
      itemBuilder: (context, index) {
        final item = _items[index];
        return Dismissible(
          key: ValueKey('desa_$index'),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            color: Colors.red.shade400,
            child: const Icon(FLucideIcons.trash2, color: Colors.white),
          ),
          confirmDismiss: (_) => _confirmDelete(context),
          onDismissed: (_) => setState(() => _items.removeAt(index)),
          child: ListTile(
            dense: true,
            visualDensity: VisualDensity.compact,
            title: Text(
              item['nama'] ?? '-',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              item['kecamatan'] ?? '',
              style: const TextStyle(fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Icon(
              FLucideIcons.pencil,
              size: 16,
              color: Colors.grey.shade400,
            ),
            onTap: () => _showForm(item: item, index: index),
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

  Future<void> _showForm({Map<String, String>? item, int? index}) async {
    final result = await showFDialog<Map<String, String>>(
      context: context,
      builder: (context, style, animation) => _DesaFormDialog(
        initialKecamatan: item?['kecamatan'] ?? '',
        initialNama: item?['nama'] ?? '',
        isEditing: item != null,
      ),
    );

    if (result != null && (result['nama']?.isNotEmpty ?? false)) {
      setState(() {
        if (item != null && index != null) {
          _items[index] = result;
        } else {
          _items.add(result);
        }
      });
    }
  }
}

class _DesaFormDialog extends StatefulWidget {
  final String initialKecamatan;
  final String initialNama;
  final bool isEditing;

  const _DesaFormDialog({
    required this.initialKecamatan,
    required this.initialNama,
    required this.isEditing,
  });

  @override
  State<_DesaFormDialog> createState() => _DesaFormDialogState();
}

class _DesaFormDialogState extends State<_DesaFormDialog> {
  late final TextEditingController _namaCtrl;
  var _selectedKecamatan = '';

  @override
  void initState() {
    super.initState();
    _namaCtrl = TextEditingController(text: widget.initialNama);
    _selectedKecamatan = widget.initialKecamatan;
  }

  @override
  void dispose() {
    _namaCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FDialog(
      title: Text(widget.isEditing ? 'Edit Desa' : 'Tambah Desa'),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FSelect<String>(
            items: _MasterDataDesaPageState._kecamatanOptions,
            label: const Text('Kecamatan'),
            hint: 'Pilih kecamatan',
            control: FSelectControl.managed(
              initial: _selectedKecamatan,
              onChange: (value) => setState(() => _selectedKecamatan = value ?? ''),
            ),
          ),
          const Gap(8),
          FTextField(
            control: FTextFieldControl.managed(controller: _namaCtrl),
            label: const Text('Nama Desa'),
            hint: 'Nama desa',
          ),
        ],
      ),
      actions: [
        FButton(
          onPress: () {
            final nama = _namaCtrl.text.trim();
            if (nama.isEmpty) return;
            Navigator.of(context).pop({
              'kecamatan': _selectedKecamatan,
              'nama': nama,
            });
          },
          child: Text(widget.isEditing ? 'Simpan' : 'Tambah'),
        ),
      ],
    );
  }
}
