import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../../shared/utils/image_processor.dart';
import '../models/activity_report_models.dart';

class ActivityReportDetailPage extends ConsumerStatefulWidget {
  final ActivitySession session;

  const ActivityReportDetailPage({super.key, required this.session});

  @override
  ConsumerState<ActivityReportDetailPage> createState() =>
      _ActivityReportDetailPageState();
}

class _ActivityReportDetailPageState
    extends ConsumerState<ActivityReportDetailPage> {
  late final _items = List<ActivityItem>.from(widget.session.items);
  late bool _isActive = widget.session.isActive;

  bool get _hasActiveItem => _items.any((i) => i.status == 'active');

  String _formatDate(DateTime dt) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];
    return '${dt.day} ${months[dt.month - 1]} ${dt.year}';
  }

  String _formatTime(DateTime dt) {
    return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
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
                      'Detail Kegiatan',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 24),
              Expanded(child: _buildContent()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(bottom: 16),
            children: [
              _buildSessionInfo(),
              if (_items.isEmpty)
                _buildEmptyItems()
              else
                ..._items.asMap().entries.map((e) => _buildItemCard(e.value)),
            ],
          ),
        ),
        if (_isActive && !_hasActiveItem) _buildBottomActions(),
      ],
    );
  }

  Widget _buildSessionInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.session.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _isActive
                        ? const Color(0xFFD1FAE5)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    _isActive ? 'Aktif' : 'Selesai',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: _isActive
                          ? const Color(0xFF059669)
                          : Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(6),
            Text(
              _formatDate(widget.session.date),
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            const Gap(2),
            Text(
              '${_items.length} item',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyItems() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Icon(FLucideIcons.filePlus2, size: 48, color: Colors.grey.shade300),
          const Gap(8),
          Text(
            'Belum ada item kegiatan',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
          if (_isActive)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'Tekan "Tambah Item" untuk memulai',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildItemCard(ActivityItem item) {
    final isActive = item.status == 'active';

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isActive
                ? const Color(0xFF1447E6).withAlpha(60)
                : Colors.grey.shade200,
            width: isActive ? 1.5 : 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: isActive
                          ? const Color(0xFF1447E6)
                          : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: isActive
                        ? const Icon(
                            FLucideIcons.play,
                            color: Colors.white,
                            size: 14,
                          )
                        : Icon(
                            FLucideIcons.check,
                            color: Colors.white,
                            size: 14,
                          ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.description,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Gap(2),
                        Text(
                          _formatTime(item.timestamp),
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        if (item.kecamatanName != null ||
                            item.desaName != null) ...[
                          const Gap(4),
                          Row(
                            children: [
                              Icon(FLucideIcons.mapPin, size: 12, color: Colors.grey.shade500),
                              const Gap(4),
                              Expanded(
                                child: Text(
                                  [
                                    if (item.desaName != null) item.desaName,
                                    if (item.kecamatanName != null) item.kecamatanName,
                                  ].join(', '),
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey.shade500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                        if (item.photoBefore != null) ...[
                          const Gap(8),
                          Row(
                            children: [
                              _buildPhotoThumbnail(item.photoBefore!, 'Mulai'),
                              if (item.photoAfter != null) ...[
                                const Gap(8),
                                _buildPhotoThumbnail(item.photoAfter!, 'Selesai'),
                              ],
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              if (isActive) ...[
                const Divider(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: FButton(
                    onPress: () => _showCompleteItemSheet(item),
                    variant: FButtonVariant.primary,
                    child: const Text('Selesaikan'),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoThumbnail(String path, String label) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Icon(
              FLucideIcons.image,
              color: Colors.grey.shade400,
              size: 24,
            ),
          ),
        ),
        const Gap(2),
        Text(label, style: TextStyle(fontSize: 9, color: Colors.grey.shade500)),
      ],
    );
  }

  Widget _buildBottomActions() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: FButton(
              onPress: _showAddItemSheet,
              variant: FButtonVariant.primary,
              child: const Text(
                'Tambah Item',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const Gap(8),
          SizedBox(
            width: double.infinity,
            child: FButton(
              onPress: _onCloseSession,
              variant: FButtonVariant.destructive,
              child: const Text('Akhiri Sesi'),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddItemSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => _AddItemSheet(
        onSave: (item) {
          setState(() => _items.add(item));
        },
      ),
    );
  }

  void _showCompleteItemSheet(ActivityItem item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => _CompleteItemSheet(
        onComplete: (photoAfter) {
          setState(() {
            final idx = _items.indexWhere((i) => i.id == item.id);
            if (idx == -1) return;
            _items[idx] = ActivityItem(
              id: item.id,
              status: 'completed',
              description: item.description,
              timestamp: item.timestamp,
              photoBefore: item.photoBefore,
              photoAfter: photoAfter?.path,
              kecamatanId: item.kecamatanId,
              kecamatanName: item.kecamatanName,
              desaId: item.desaId,
              desaName: item.desaName,
              startLat: item.startLat,
              startLng: item.startLng,
              endLat: item.endLat,
              endLng: item.endLng,
            );
          });
        },
      ),
    );
  }

  void _onCloseSession() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Akhiri Sesi'),
        content: const Text('Yakin ingin mengakhiri sesi ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Tidak'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(() => _isActive = false);
            },
            child: Text(
              'Ya, Akhiri',
              style: TextStyle(color: Colors.red.shade600),
            ),
          ),
        ],
      ),
    );
  }
}

/// Bottom sheet form untuk menambah item baru.
class _AddItemSheet extends StatefulWidget {
  final void Function(ActivityItem item) onSave;
  const _AddItemSheet({required this.onSave});

  @override
  State<_AddItemSheet> createState() => _AddItemSheetState();
}

class _AddItemSheetState extends State<_AddItemSheet> {
  final _descController = TextEditingController();
  File? _photoBeforeFile;
  String _selectedDistrictId = '';
  String _selectedSubDistrictId = '';
  double? _startLat;
  double? _startLng;

  @override
  void initState() {
    super.initState();
    _simulateLocation();
  }

  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

  Future<void> _simulateLocation() async {
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() {
      _startLat = -7.250445;
      _startLng = 112.768845;
    });
  }

  @override
  Widget build(BuildContext context) {
    final subDistricts = _selectedDistrictId.isNotEmpty
        ? mockSubDistricts[_selectedDistrictId] ?? []
        : <MockOption>[];

    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const Gap(16),
          const Text(
            'Tambah Item Kegiatan',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const Gap(20),
          // Foto Mulai
          _buildPhotoPicker(
            label: 'Foto Mulai',
            value: _photoBeforeFile,
            onPick: _pickPhotoBefore,
          ),
          const Gap(16),
          // Kecamatan
          _buildDropdown(
            label: 'Kecamatan',
            hint: 'Pilih kecamatan',
            value: _selectedDistrictId,
            items: mockDistricts,
            onChange: (v) {
              setState(() {
                _selectedDistrictId = v;
                _selectedSubDistrictId = '';
              });
            },
          ),
          const Gap(12),
          // Desa
          _buildDropdown(
            label: 'Desa',
            hint: _selectedDistrictId.isEmpty
                ? 'Pilih kecamatan terlebih dahulu'
                : 'Pilih desa',
            value: _selectedSubDistrictId,
            items: subDistricts,
            onChange: (v) => setState(() => _selectedSubDistrictId = v),
          ),
          const Gap(16),
          // Keterangan
          FTextField(
            control: FTextFieldControl.managed(controller: _descController),
            label: const Text('Keterangan'),
            hint: 'Masukkan keterangan kegiatan',
            maxLines: 3,
          ),
          const Gap(16),
          SizedBox(
            width: double.infinity,
            child: FButton(
              onPress: _onSave,
              variant: FButtonVariant.primary,
              child: const Text('Simpan'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoPicker({
    required String label,
    required File? value,
    required VoidCallback onPick,
  }) {
    return GestureDetector(
      onTap: value == null ? onPick : null,
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        child: value != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: Image.file(value, fit: BoxFit.cover),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FLucideIcons.camera, color: Colors.grey.shade400, size: 28),
                  const Gap(6),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String hint,
    required String value,
    required List<MockOption> items,
    required void Function(String id) onChange,
  }) {
    final options = <String, String>{hint: ''};
    for (final item in items) {
      options[item.name] = item.id;
    }
    return FSelect<String>(
      items: options,
      label: Text(
        label,
        style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
      ),
      hint: hint,
      control: FSelectControl.lifted(
        value: value,
        onChange: (v) => onChange(v ?? ''),
      ),
    );
  }

  void _onSave() {
    final desc = _descController.text.trim();
    if (desc.isEmpty) return;

    final districtName = mockDistricts
        .where((d) => d.id == _selectedDistrictId)
        .map((d) => d.name)
        .firstOrNull;
    final subDistrictName = (mockSubDistricts[_selectedDistrictId] ?? [])
        .where((sd) => sd.id == _selectedSubDistrictId)
        .map((sd) => sd.name)
        .firstOrNull;

    widget.onSave(
      ActivityItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        status: 'active',
        description: desc,
        timestamp: DateTime.now(),
        photoBefore: _photoBeforeFile?.path,
        kecamatanId: _selectedDistrictId.isNotEmpty
            ? _selectedDistrictId
            : null,
        kecamatanName: districtName,
        desaId: _selectedSubDistrictId.isNotEmpty
            ? _selectedSubDistrictId
            : null,
        desaName: subDistrictName,
        startLat: _startLat,
        startLng: _startLng,
      ),
    );
    Navigator.of(context).pop();
  }

  Future<void> _pickPhotoBefore() async {
    final file = await processImage(context, config: ImageProcessConfig.venue);
    if (file != null) setState(() => _photoBeforeFile = file);
  }
}

/// Bottom sheet untuk menyelesaikan item (foto selesai + koordinat auto).
class _CompleteItemSheet extends StatefulWidget {
  final void Function(File? photoAfter) onComplete;
  const _CompleteItemSheet({required this.onComplete});

  @override
  State<_CompleteItemSheet> createState() => _CompleteItemSheetState();
}

class _CompleteItemSheetState extends State<_CompleteItemSheet> {
  File? _photoAfterFile;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pickPhotoAfter() async {
    final file = await processImage(context, config: ImageProcessConfig.venue);
    if (file != null) setState(() => _photoAfterFile = file);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const Gap(16),
          const Text(
            'Selesaikan Item',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const Gap(20),
          // Foto Selesai
          GestureDetector(
            onTap: _photoAfterFile == null ? _pickPhotoAfter : null,
            child: Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: _photoAfterFile != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: Image.file(
                        _photoAfterFile!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FLucideIcons.camera,
                          color: Colors.grey.shade400,
                          size: 36,
                        ),
                        const Gap(6),
                        Text(
                          'Foto Selesai',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Gap(2),
                        Text(
                          'Ambil foto hasil pekerjaan',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          const Gap(20),
          SizedBox(
            width: double.infinity,
            child: FButton(
              onPress: _photoAfterFile != null
                  ? () {
                      widget.onComplete(_photoAfterFile);
                      Navigator.of(context).pop();
                    }
                  : null,
              variant: FButtonVariant.primary,
              child: const Text('Simpan'),
            ),
          ),
        ],
      ),
    );
  }
}
