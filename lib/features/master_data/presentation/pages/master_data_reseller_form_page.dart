import 'dart:io';

import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

import '../../../../shared/utils/image_source_picker.dart';
import '../../../../shared/pages/coordinate_picker_page.dart';

const _defaultLatitude = 1.36;
const _defaultLongitude = 109.38;
const _defaultZoom = 9.0;

const _kecamatanOptions = {
  'Pilih kecamatan': '',
  'Kecamatan A': 'A',
  'Kecamatan B': 'B',
  'Kecamatan C': 'C',
};

const _desaOptions = {
  'Pilih desa': '',
  'Desa A': 'A',
  'Desa B': 'B',
  'Desa C': 'C',
};

class MasterDataResellerFormPage extends StatefulWidget {
  final Map<String, dynamic>? item;

  const MasterDataResellerFormPage({super.key, this.item});

  @override
  State<MasterDataResellerFormPage> createState() => _MasterDataResellerFormPageState();
}

class _MasterDataResellerFormPageState extends State<MasterDataResellerFormPage> {
  File? _fotoOrang;
  File? _fotoTempat;
  late final TextEditingController _namaCtrl;
  late final TextEditingController _usernameCtrl;
  late final TextEditingController _passwordCtrl;
  late final TextEditingController _phoneCtrl;
  late final TextEditingController _komisiPersenCtrl;
  late final TextEditingController _komisiNominalCtrl;
  String _selectedKecamatan = '';
  String _selectedDesa = '';
  String _latitude = '';
  String _longitude = '';
  MapLibreMapController? _mapController;

  bool get _isEditing => widget.item != null;

  @override
  void initState() {
    super.initState();
    final item = widget.item;
    if (item?['foto_orang'] != null) _fotoOrang = File(item!['foto_orang']);
    if (item?['foto_tempat'] != null) _fotoTempat = File(item!['foto_tempat']);
    _namaCtrl = TextEditingController(text: item?['nama'] as String? ?? '');
    _usernameCtrl = TextEditingController(text: item?['username'] as String? ?? '');
    _passwordCtrl = TextEditingController(text: item?['password'] as String? ?? '');
    _phoneCtrl = TextEditingController(text: item?['phone'] as String? ?? '');
    _komisiPersenCtrl = TextEditingController(text: item?['komisi_persen'] as String? ?? '');
    _komisiNominalCtrl = TextEditingController(text: item?['komisi_nominal'] as String? ?? '');
    _selectedKecamatan = item?['kecamatan'] as String? ?? '';
    _selectedDesa = item?['desa'] as String? ?? '';
    _latitude = item?['latitude'] as String? ?? '';
    _longitude = item?['longitude'] as String? ?? '';
  }

  @override
  void dispose() {
    _namaCtrl.dispose();
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    _phoneCtrl.dispose();
    _komisiPersenCtrl.dispose();
    _komisiNominalCtrl.dispose();
    _mapController?.dispose();
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
                      _isEditing ? 'Edit Reseller' : 'Tambah Reseller',
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
                      _buildFotoPicker(
                        label: 'Foto Orang',
                        file: _fotoOrang,
                        onPick: (f) => setState(() => _fotoOrang = f),
                      ),
                      const Gap(12),
                      _buildFotoPicker(
                        label: 'Foto Tempat',
                        file: _fotoTempat,
                        onPick: (f) => setState(() => _fotoTempat = f),
                      ),
                      const Gap(16),
                      FTextField(
                        control: FTextFieldControl.managed(controller: _namaCtrl),
                        label: const Text('Nama'),
                        hint: 'Nama reseller',
                      ),
                      const Gap(8),
                      FTextField(
                        control: FTextFieldControl.managed(controller: _usernameCtrl),
                        label: const Text('Username'),
                        hint: 'Username',
                      ),
                      const Gap(8),
                      FTextField.password(
                        control: FTextFieldControl.managed(controller: _passwordCtrl),
                        label: const Text('Password'),
                        hint: 'Password',
                      ),
                      const Gap(16),
                      FSelect<String>(
                        items: _kecamatanOptions,
                        label: const Text('Kecamatan'),
                        hint: 'Pilih kecamatan',
                        control: FSelectControl.managed(
                          initial: _selectedKecamatan,
                          onChange: (value) => setState(() => _selectedKecamatan = value ?? ''),
                        ),
                      ),
                      const Gap(8),
                      FSelect<String>(
                        items: _desaOptions,
                        label: const Text('Desa'),
                        hint: 'Pilih desa',
                        control: FSelectControl.managed(
                          initial: _selectedDesa,
                          onChange: (value) => setState(() => _selectedDesa = value ?? ''),
                        ),
                      ),
                      const Gap(16),
                      Text(
                        'Komisi Penjualan',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(4),
                      FTextField(
                        control: FTextFieldControl.managed(controller: _komisiPersenCtrl),
                        label: const Text('Komisi Persentase (%)'),
                        hint: 'Contoh: 10',
                        keyboardType: TextInputType.number,
                      ),
                      const Gap(8),
                      FTextField(
                        control: FTextFieldControl.managed(controller: _komisiNominalCtrl),
                        label: const Text('Komisi Nominal (Rp)'),
                        hint: 'Contoh: 50000',
                        keyboardType: TextInputType.number,
                      ),
                      const Gap(16),
                      Text(
                        'Koordinat',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(8),
                      GestureDetector(
                        onTap: _onPickKoordinat,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            height: 160,
                            child: Stack(
                              children: [
                                MapLibreMap(
                                  styleString: MapLibreStyles.openfreemapLiberty,
                                  initialCameraPosition: CameraPosition(
                                    target: _latitude.isNotEmpty && _longitude.isNotEmpty
                                        ? LatLng(
                                            double.parse(_latitude),
                                            double.parse(_longitude),
                                          )
                                        : const LatLng(_defaultLatitude, _defaultLongitude),
                                    zoom: _latitude.isNotEmpty && _longitude.isNotEmpty ? 15.0 : _defaultZoom,
                                  ),
                                  onMapCreated: (c) => _mapController = c,
                                  scrollGesturesEnabled: false,
                                  zoomGesturesEnabled: false,
                                  rotateGesturesEnabled: false,
                                  tiltGesturesEnabled: false,
                                  compassEnabled: false,
                                  myLocationEnabled: false,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.center,
                                      colors: [
                                        Colors.black.withValues(alpha: 0.5),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 12,
                                  right: 12,
                                  bottom: 10,
                                  child: Row(
                                    children: [
                                      Icon(
                                        _latitude.isNotEmpty && _longitude.isNotEmpty
                                            ? FLucideIcons.mapPin
                                            : FLucideIcons.map,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      const Gap(6),
                                      Expanded(
                                        child: Text(
                                          _latitude.isNotEmpty && _longitude.isNotEmpty
                                              ? '$_latitude, $_longitude'
                                              : 'Ketuk untuk pilih koordinat',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const IgnorePointer(
                                  child: Center(
                                    child: Icon(Icons.location_on, size: 36, color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Gap(16),
                      FTextField(
                        control: FTextFieldControl.managed(controller: _phoneCtrl),
                        label: const Text('No. Telepon'),
                        hint: 'Nomor telepon',
                        keyboardType: TextInputType.phone,
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

  Widget _buildFotoPicker({
    required String label,
    required File? file,
    required ValueChanged<File> onPick,
  }) {
    return GestureDetector(
      onTap: () async {
        final picked = await showImageSourcePicker(context);
        if (picked != null) onPick(picked);
      },
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: file != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(file, fit: BoxFit.cover),
                  )
                : const Icon(FLucideIcons.camera, size: 24, color: Colors.grey),
          ),
          const Gap(12),
          Text(
            file != null ? 'Ketuk untuk ganti $label' : 'Ketuk untuk tambah $label',
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Future<void> _onPickKoordinat() async {
    final result = await Navigator.of(context).push<Map<String, String>>(
      MaterialPageRoute(
        builder: (context) => CoordinatePickerPage(
          initialLatitude: _latitude,
          initialLongitude: _longitude,
        ),
      ),
    );

    if (result != null) {
      final lat = result['latitude'] ?? '';
      final lng = result['longitude'] ?? '';
      setState(() {
        _latitude = lat;
        _longitude = lng;
      });
      if (lat.isNotEmpty && lng.isNotEmpty) {
        _mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(double.parse(lat), double.parse(lng)),
              zoom: 15,
            ),
          ),
        );
      }
    }
  }

  void _onSimpan() {
    final nama = _namaCtrl.text.trim();
    final username = _usernameCtrl.text.trim();
    if (nama.isEmpty) return;

    Navigator.of(context).pop({
      'foto_orang': _fotoOrang?.path,
      'foto_tempat': _fotoTempat?.path,
      'nama': nama,
      'username': username,
      'password': _passwordCtrl.text,
      'kecamatan': _selectedKecamatan,
      'desa': _selectedDesa,
      'komisi_persen': _komisiPersenCtrl.text.trim(),
      'komisi_nominal': _komisiNominalCtrl.text.trim(),
      'latitude': _latitude,
      'longitude': _longitude,
      'phone': _phoneCtrl.text.trim(),
    });
  }
}
