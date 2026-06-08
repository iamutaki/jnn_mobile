import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

class MasterDataResellerPage extends StatefulWidget {
  const MasterDataResellerPage({super.key});

  @override
  State<MasterDataResellerPage> createState() => _MasterDataResellerPageState();
}

class _MasterDataResellerPageState extends State<MasterDataResellerPage> {
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
            child: const Text('Tambah Reseller'),
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

  Widget _buildList() {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: _items.length,
      separatorBuilder: (_, _) => const Divider(height: 1, indent: 16),
      itemBuilder: (context, index) {
        final item = _items[index];
        return Dismissible(
          key: ValueKey('reseller_$index'),
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
              item['telepon'] != null
                  ? '${item['kode'] ?? ''} · ${item['telepon']}'
                  : item['kode'] ?? '',
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
    return result == 'delete';
  }

  Future<void> _showForm({Map<String, String>? item, int? index}) async {
    final kodeCtrl = TextEditingController(text: item?['kode'] ?? '');
    final namaCtrl = TextEditingController(text: item?['nama'] ?? '');
    final teleponCtrl = TextEditingController(text: item?['telepon'] ?? '');
    final alamatCtrl = TextEditingController(text: item?['alamat'] ?? '');
    final isEditing = item != null;

    final result = await showFDialog<Map<String, String>>(
      context: context,
      builder: (context, style, animation) => FDialog(
        title: Text(isEditing ? 'Edit Reseller' : 'Tambah Reseller'),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FTextField(
              control: FTextFieldControl.managed(controller: kodeCtrl),
              label: const Text('Kode'),
              hint: 'Kode reseller',
            ),
            const Gap(8),
            FTextField(
              control: FTextFieldControl.managed(controller: namaCtrl),
              label: const Text('Nama'),
              hint: 'Nama reseller',
            ),
            const Gap(8),
            FTextField(
              control: FTextFieldControl.managed(controller: teleponCtrl),
              label: const Text('No. Telepon'),
              hint: 'Nomor telepon',
              keyboardType: TextInputType.phone,
            ),
            const Gap(8),
            FTextField(
              control: FTextFieldControl.managed(controller: alamatCtrl),
              label: const Text('Alamat'),
              hint: 'Alamat',
            ),
          ],
        ),
        actions: [
          FButton(
            onPress: () {
              if (namaCtrl.text.trim().isEmpty) return;
              Navigator.of(context).pop({
                'kode': kodeCtrl.text.trim(),
                'nama': namaCtrl.text.trim(),
                'telepon': teleponCtrl.text.trim(),
                'alamat': alamatCtrl.text.trim(),
              });
            },
            child: Text(isEditing ? 'Simpan' : 'Tambah'),
          ),
        ],
      ),
    );

    kodeCtrl.dispose();
    namaCtrl.dispose();
    teleponCtrl.dispose();
    alamatCtrl.dispose();

    if (result != null) {
      setState(() {
        if (isEditing && index != null) {
          _items[index] = result;
        } else {
          _items.add(result);
        }
      });
    }
  }
}
