import 'dart:io';

import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../../shared/utils/image_source_picker.dart';

const _tipeOptions = ['Pemilik', 'Supervisor', 'Admin', 'Teknisi', 'Petugas'];

class MasterDataPersonelFormPage extends StatefulWidget {
  final Map<String, dynamic>? item;

  const MasterDataPersonelFormPage({super.key, this.item});

  @override
  State<MasterDataPersonelFormPage> createState() =>
      _MasterDataPersonelFormPageState();
}

class _MasterDataPersonelFormPageState
    extends State<MasterDataPersonelFormPage> {
  File? _foto;
  late final TextEditingController _namaCtrl;
  late final TextEditingController _usernameCtrl;
  late final TextEditingController _passwordCtrl;
  late final TextEditingController _teleponCtrl;
  late final TextEditingController _emailCtrl;
  var _selectedTipe = <String>{};

  bool get _isEditing => widget.item != null;

  @override
  void initState() {
    super.initState();
    final item = widget.item;
    if (item?['foto'] != null) _foto = File(item!['foto']);
    _namaCtrl = TextEditingController(text: item?['nama'] as String? ?? '');
    _usernameCtrl = TextEditingController(
      text: item?['username'] as String? ?? '',
    );
    _passwordCtrl = TextEditingController(
      text: item?['password'] as String? ?? '',
    );
    _teleponCtrl = TextEditingController(
      text: item?['telepon'] as String? ?? '',
    );
    _emailCtrl = TextEditingController(text: item?['email'] as String? ?? '');
    if (item?['tipe'] != null) {
      _selectedTipe.addAll(List<String>.from(item!['tipe']));
    }
  }

  @override
  void dispose() {
    _namaCtrl.dispose();
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    _teleponCtrl.dispose();
    _emailCtrl.dispose();
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
                      _isEditing ? 'Edit Personel' : 'Tambah Personel',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFotoPicker(),
                      const Gap(16),
                      FTextField(
                        control: FTextFieldControl.managed(
                          controller: _namaCtrl,
                        ),
                        label: const Text('Nama'),
                        hint: 'Nama personel',
                      ),
                      const Gap(8),
                      FTextField(
                        control: FTextFieldControl.managed(
                          controller: _usernameCtrl,
                        ),
                        label: const Text('Username'),
                        hint: 'Username',
                      ),
                      const Gap(8),
                      FTextField.password(
                        control: FTextFieldControl.managed(
                          controller: _passwordCtrl,
                        ),
                        label: const Text('Password'),
                        hint: 'Password',
                      ),
                      const Gap(8),
                      FTileGroupMixin.selectGroup(
                        label: const Text('Tipe Personel'),
                        control: FMultiValueControl.lifted(
                          value: _selectedTipe,
                          onChange: (value) =>
                              setState(() => _selectedTipe = value),
                        ),
                        children: _tipeOptions
                            .map(
                              (tipe) => FSelectTile(
                                title: Text(tipe),
                                suffix: Icon(FLucideIcons.keySquare),
                                value: tipe,
                              ),
                            )
                            .toList(),
                      ),
                      const Gap(8),
                      FTextField(
                        control: FTextFieldControl.managed(
                          controller: _teleponCtrl,
                        ),
                        label: const Text('No. Telepon (opsional)'),
                        hint: 'Nomor telepon',
                        keyboardType: TextInputType.phone,
                      ),
                      const Gap(8),
                      FTextField(
                        control: FTextFieldControl.managed(
                          controller: _emailCtrl,
                        ),
                        label: const Text('Email (opsional)'),
                        hint: 'Alamat email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  ),
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
            onPress: _onSimpan,
            variant: FButtonVariant.primary,
            child: const Text('Simpan'),
          ),
        ),
      ),
    );
  }

  Widget _buildFotoPicker() {
    return GestureDetector(
      onTap: _onPickFoto,
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: _foto != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(_foto!, fit: BoxFit.cover),
                  )
                : const Icon(FLucideIcons.camera, size: 28, color: Colors.grey),
          ),
          const Gap(12),
          Text(
            _foto != null
                ? 'Ketuk untuk ganti foto'
                : 'Ketuk untuk tambah foto',
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Future<void> _onPickFoto() async {
    final file = await showImageSourcePicker(context);
    if (file != null) {
      setState(() => _foto = file);
    }
  }

  void _onSimpan() {
    final nama = _namaCtrl.text.trim();
    final username = _usernameCtrl.text.trim();
    if (nama.isEmpty) return;

    Navigator.of(context).pop({
      'foto': _foto?.path,
      'nama': nama,
      'username': username,
      'password': _passwordCtrl.text,
      'tipe': _selectedTipe.toList(),
      'telepon': _teleponCtrl.text.trim(),
      'email': _emailCtrl.text.trim(),
    });
  }
}
