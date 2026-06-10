import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/data/providers/image_upload_providers.dart';
import '../../../../core/domain/entities/upload_image_request.dart';
import '../../../../shared/utils/image_processor.dart';
import '../../data/models/user_dto.dart';
import '../providers/user_providers.dart';
import '../../../role/data/models/role_dto.dart';
import '../../../role/presentation/providers/role_providers.dart';

class UserFormPage extends ConsumerStatefulWidget {
  final UserDto? item;

  const UserFormPage({super.key, this.item});

  @override
  ConsumerState<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends ConsumerState<UserFormPage> {
  File? _foto;
  late final TextEditingController _namaCtrl;
  late final TextEditingController _usernameCtrl;
  late final TextEditingController _passwordCtrl;
  late final TextEditingController _teleponCtrl;
  late final TextEditingController _emailCtrl;
  var _selectedRoleIds = <String>{};
  bool _isSaving = false;

  bool get _isEditing => widget.item != null;

  @override
  void initState() {
    super.initState();
    final item = widget.item;
    _namaCtrl = TextEditingController(text: item?.name ?? '');
    _usernameCtrl = TextEditingController(text: item?.username ?? '');
    _passwordCtrl = TextEditingController(text: '');
    _teleponCtrl = TextEditingController(text: item?.phone ?? '');
    _emailCtrl = TextEditingController(text: item?.email ?? '');
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

  static const _skeletonRoles = [
    RoleDto(id: '1', name: 'Role dummy'),
    RoleDto(id: '2', name: 'Role dummy'),
    RoleDto(id: '3', name: 'Role dummy'),
    RoleDto(id: '4', name: 'Role dummy'),
  ];

  @override
  Widget build(BuildContext context) {
    final rolesAsync = ref.watch(roleListProvider);

    final roles = rolesAsync.asData?.value ?? [];
    final isLoadingRoles = rolesAsync.isLoading;

    if (widget.item != null && _selectedRoleIds.isEmpty && widget.item!.roles.isNotEmpty && roles.isNotEmpty) {
      final roleNameToId = {for (final r in roles) r.name: r.id};
      _selectedRoleIds = widget.item!.roles
          .map((name) => roleNameToId[name])
          .whereType<String>()
          .toSet();
    }

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
                        hint: _isEditing ? 'Kosongkan jika tidak diubah' : 'Password',
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
                      const Gap(8),
                      Skeletonizer(
                        enabled: isLoadingRoles,
                        child: rolesAsync.hasError
                            ? Text(
                                'Gagal memuat role: ${rolesAsync.error}',
                                style: TextStyle(fontSize: 13, color: Colors.red.shade600),
                              )
                            : _buildRolesPicker(isLoadingRoles ? _skeletonRoles : roles),
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
            onPress: _isSaving ? null : _onSimpan,
            variant: FButtonVariant.primary,
            child: Text(_isSaving ? 'Menyimpan...' : 'Simpan'),
          ),
        ),
      ),
    );
  }

  Widget _buildRolesPicker(List<RoleDto> roles) {
    return FTileGroupMixin.selectGroup(
      label: const Text('Role'),
      control: FMultiValueControl.lifted(
        value: _selectedRoleIds,
        onChange: (value) => setState(() => _selectedRoleIds = value),
      ),
      children: roles
          .map(
            (role) => FSelectTile(
              title: Text(role.name),
              suffix: const Icon(FLucideIcons.keySquare),
              value: role.id,
            ),
          )
          .toList(),
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
                : widget.item?.avatar != null && widget.item!.avatar!.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          widget.item!.avatar!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => const Icon(
                            FLucideIcons.imageOff,
                            size: 28,
                            color: Colors.grey,
                          ),
                        ),
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
    final file = await processImage(
      context,
      config: ImageProcessConfig.avatar,
    );
    if (file != null) {
      setState(() => _foto = file);
    }
  }

  Future<void> _onSimpan() async {
    final nama = _namaCtrl.text.trim();
    final username = _usernameCtrl.text.trim();
    if (nama.isEmpty) return;

    setState(() => _isSaving = true);

    try {
      // ── Upload avatar if changed ──
      String? avatarUrl = widget.item?.avatar;

      if (_foto != null) {
        final repository = ref.read(imageUploadRepositoryProvider);
        final result = await repository.uploadImage(
          UploadImageRequest(
            file: _foto!,
            folder: '/users/avatars',
            tags: const ['user', 'avatar'],
          ),
        );
        result.fold(
          (failure) => throw Exception(failure.message),
          (uploaded) => avatarUrl = uploaded.url,
        );
      }

      final phone = _teleponCtrl.text.trim();
      final email = _emailCtrl.text.trim();

      if (_isEditing) {
        await ref.read(userListProvider.notifier).edit(
              id: widget.item!.id,
              name: nama,
              username: username,
              password: _passwordCtrl.text.isNotEmpty ? _passwordCtrl.text : null,
              phone: phone.isNotEmpty ? phone : null,
              email: email.isNotEmpty ? email : null,
              avatar: avatarUrl,
              roleIds: _selectedRoleIds.toList(),
            );
      } else {
        await ref.read(userListProvider.notifier).create(
              name: nama,
              username: username,
              password: _passwordCtrl.text.isNotEmpty ? _passwordCtrl.text : null,
              phone: phone.isNotEmpty ? phone : null,
              email: email.isNotEmpty ? email : null,
              avatar: avatarUrl,
              roleIds: _selectedRoleIds.toList(),
            );
      }

      if (!context.mounted) return;
      Navigator.of(context).pop(true);
    } catch (e) {
      if (!context.mounted) return;
      setState(() => _isSaving = false);
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
}
