import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

class MasterDataKecamatanPage extends StatefulWidget {
  const MasterDataKecamatanPage({super.key});

  @override
  State<MasterDataKecamatanPage> createState() =>
      _MasterDataKecamatanPageState();
}

class _MasterDataKecamatanPageState extends State<MasterDataKecamatanPage> {
  final _items = <String>[];

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
            child: const Text('Tambah Kecamatan'),
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

  Widget _buildList() {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: _items.length,
      separatorBuilder: (_, _) => const Divider(height: 1, indent: 16),
      itemBuilder: (context, index) {
        final nama = _items[index];
        return Dismissible(
          key: ValueKey('kecamatan_$index'),
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
              nama,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            trailing: Icon(
              FLucideIcons.pencil,
              size: 16,
              color: Colors.grey.shade400,
            ),
            onTap: () => _showForm(item: nama, index: index),
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

  Future<void> _showForm({String? item, int? index}) async {
    final result = await showFDialog<String>(
      context: context,
      builder: (context, style, animation) => _KecamatanFormDialog(
        initialValue: item ?? '',
        isEditing: item != null,
      ),
    );

    if (result != null && result.isNotEmpty) {
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
