import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/network/network_providers.dart';
import '../../../../shared/utils/image_processor.dart';
import '../../../../shared/pages/contact_picker_page.dart';
import '../../../../shared/pages/coordinate_picker_page.dart';
import '../../../district/presentation/providers/district_providers.dart';
import '../../../sub_district/data/models/sub_district_dto.dart';
import '../../../sub_district/presentation/providers/sub_district_providers.dart';
import '../../data/models/reseller_dto.dart';
import '../providers/reseller_providers.dart';

const _defaultLatitude = 1.36;
const _defaultLongitude = 109.38;
const _defaultZoom = 9.0;

class ResellerFormPage extends ConsumerStatefulWidget {
  final ResellerDto? item;

  const ResellerFormPage({super.key, this.item});

  @override
  ConsumerState<ResellerFormPage> createState() => _ResellerFormPageState();
}

class _ResellerFormPageState extends ConsumerState<ResellerFormPage> {
  File? _avatarFile;
  File? _venuePhotoFile;
  String? _existingAvatarUrl;
  String? _existingVenuePhotoUrl;

  late final TextEditingController _namaCtrl;
  late final TextEditingController _usernameCtrl;
  late final TextEditingController _passwordCtrl;
  late final TextEditingController _phoneCtrl;
  late final TextEditingController _komisiPersenCtrl;
  late final TextEditingController _komisiNominalCtrl;

  String _selectedDistrictId = '';
  String _selectedSubDistrictId = '';
  String _latitude = '';
  String _longitude = '';
  MapLibreMapController? _mapController;

  bool _isSubmitting = false;
  bool _isLoadingDetail = false;

  bool get _isEditing => widget.item != null;

  @override
  void initState() {
    super.initState();
    final item = widget.item;
    if (item != null) {
      _existingAvatarUrl = item.user.avatar;
      _existingVenuePhotoUrl = item.venuePhoto;
      _namaCtrl = TextEditingController(text: item.user.name);
      _usernameCtrl = TextEditingController(text: item.user.username);
      _passwordCtrl = TextEditingController();
      _phoneCtrl = TextEditingController(text: item.phone ?? '');
      _komisiPersenCtrl = TextEditingController(
        text: item.commissionRate > 0 ? item.commissionRate.toString() : '',
      );
      _komisiNominalCtrl = TextEditingController(
        text: item.commissionAmount > 0 ? item.commissionAmount.toString() : '',
      );
      _selectedSubDistrictId = item.subDistrict?.id ?? '';
      _selectedDistrictId = item.subDistrict?.district?.id ?? '';
      if (item.lat != null) _latitude = item.lat.toString();
      if (item.lng != null) _longitude = item.lng.toString();
      _isLoadingDetail = true;
      _fetchDetail(item.user.id);
    } else {
      _namaCtrl = TextEditingController();
      _usernameCtrl = TextEditingController();
      _passwordCtrl = TextEditingController();
      _phoneCtrl = TextEditingController();
      _komisiPersenCtrl = TextEditingController();
      _komisiNominalCtrl = TextEditingController();
    }
  }

  Future<void> _fetchDetail(String id) async {
    try {
      final detail =
          await ref.read(resellerListProvider.notifier).getResellerById(id);
      if (!mounted) return;
      setState(() {
        _isLoadingDetail = false;
        _existingAvatarUrl = detail.user.avatar;
        _existingVenuePhotoUrl = detail.venuePhoto;
        _namaCtrl.text = detail.user.name;
        _usernameCtrl.text = detail.user.username;
        _phoneCtrl.text = detail.phone ?? '';
        _komisiPersenCtrl.text =
            detail.commissionRate > 0 ? detail.commissionRate.toString() : '';
        _komisiNominalCtrl.text =
            detail.commissionAmount > 0 ? detail.commissionAmount.toString() : '';
        _selectedSubDistrictId = detail.subDistrict?.id ?? '';
        _selectedDistrictId = detail.subDistrict?.district?.id ?? '';
        if (detail.lat != null) _latitude = detail.lat.toString();
        if (detail.lng != null) _longitude = detail.lng.toString();
      });
      if (detail.lat != null && detail.lng != null) {
        _mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(detail.lat!, detail.lng!),
              zoom: 15,
            ),
          ),
        );
      }
    } catch (_) {
      if (!mounted) return;
      setState(() => _isLoadingDetail = false);
    }
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
    final districtsAsync = ref.watch(districtListProvider);
    final subDistrictsAsync = ref.watch(subDistrictListProvider);

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
                  child: Skeletonizer(
                    enabled: _isEditing && _isLoadingDetail,
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Foto ──
                      _buildFotoPicker(
                        label: 'Foto Orang (Avatar)',
                        file: _avatarFile,
                        existingUrl: _existingAvatarUrl,
                        config: ImageProcessConfig.avatar,
                        onPick: (f) => setState(() {
                          _avatarFile = f;
                          _existingAvatarUrl = null;
                        }),
                        onRemove: () => setState(() {
                          _avatarFile = null;
                          _existingAvatarUrl = null;
                        }),
                      ),
                      const Gap(12),
                      _buildFotoPicker(
                        label: 'Foto Tempat (Venue)',
                        file: _venuePhotoFile,
                        existingUrl: _existingVenuePhotoUrl,
                        config: ImageProcessConfig.venue,
                        onPick: (f) => setState(() {
                          _venuePhotoFile = f;
                          _existingVenuePhotoUrl = null;
                        }),
                        onRemove: () => setState(() {
                          _venuePhotoFile = null;
                          _existingVenuePhotoUrl = null;
                        }),
                      ),
                      const Gap(16),

                      // ── Text Fields ──
                      FTextField(
                        control: FTextFieldControl.managed(
                          controller: _namaCtrl,
                        ),
                        label: const Text('Nama'),
                        hint: 'Nama reseller',
                        readOnly: _isSubmitting,
                      ),
                      const Gap(8),
                      FTextField(
                        control: FTextFieldControl.managed(
                          controller: _usernameCtrl,
                        ),
                        label: const Text('Username'),
                        hint: 'Username',
                        readOnly: _isSubmitting,
                      ),
                      const Gap(8),
                      FTextField.password(
                        control: FTextFieldControl.managed(
                          controller: _passwordCtrl,
                        ),
                        label: Text(
                          _isEditing
                              ? 'Password (kosongkan jika tidak diubah)'
                              : 'Password',
                        ),
                        hint: 'Password',
                      ),
                      const Gap(8),
                      FTextField(
                        control: FTextFieldControl.managed(
                          controller: _phoneCtrl,
                        ),
                        label: const Text('No. Telepon'),
                        hint: '6281234567890',
                        keyboardType: TextInputType.phone,
                        readOnly: _isSubmitting,
                        prefixBuilder: (context, style, variants) => Padding(
                          padding: const EdgeInsets.only(left: 12, right: 4),
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                        suffixBuilder: _isSubmitting
                            ? null
                            : (context, style, variants) => IconButton(
                                  onPressed: _onPickContact,
                                  icon: Icon(
                                    FLucideIcons.contact,
                                    size: 18,
                                    color: Colors.grey.shade500,
                                  ),
                                  tooltip: 'Pilih dari kontak',
                                  constraints: const BoxConstraints(
                                    minWidth: 36,
                                    minHeight: 36,
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                      ),
                      const Gap(16),

                      // ── Kecamatan / Desa Dropdowns ──
                      districtsAsync.when(
                        data: (districts) {
                          final items = <String, String>{'Pilih kecamatan': ''};
                          for (final d in districts) {
                            items[d.name] = d.id;
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FSelect<String>(
                                items: items,
                                label: const Text('Kecamatan'),
                                hint: 'Pilih kecamatan',
                                control: FSelectControl.lifted(
                                  value: _selectedDistrictId,
                                  onChange: (value) => setState(() {
                                    _selectedDistrictId = value ?? '';
                                    _selectedSubDistrictId = '';
                                  }),
                                ),
                              ),
                              const Gap(8),
                              _buildSubDistrictDropdown(subDistrictsAsync),
                            ],
                          );
                        },
                        loading: () => const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: FCircularProgress.loader(),
                            ),
                          ),
                        ),
                        error: (e, _) => Text(
                          'Gagal memuat kecamatan',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.red.shade400,
                          ),
                        ),
                      ),
                      const Gap(16),

                      // ── Komisi ──
                      Text(
                        'Komisi Penjualan',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(4),
                      FTextField(
                        control: FTextFieldControl.managed(
                          controller: _komisiPersenCtrl,
                        ),
                        label: const Text('Komisi Persentase (%)'),
                        hint: 'Contoh: 10',
                        keyboardType: TextInputType.number,
                        readOnly: _isSubmitting,
                      ),
                      const Gap(8),
                      FTextField(
                        control: FTextFieldControl.managed(
                          controller: _komisiNominalCtrl,
                        ),
                        label: const Text('Komisi Nominal (Rp)'),
                        hint: 'Contoh: 50.000',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          CurrencyTextInputFormatter.currency(
                            locale: 'id',
                            decimalDigits: 0,
                            symbol: '',
                          ),
                        ],
                        readOnly: _isSubmitting,
                      ),
                      const Gap(16),

                      // ── Koordinat ──
                      Text(
                        'Koordinat',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(8),
                      GestureDetector(
                        onTap: _isSubmitting ? null : _onPickKoordinat,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            height: 160,
                            child: Stack(
                              children: [
                                MapLibreMap(
                                  styleString:
                                      MapLibreStyles.openfreemapLiberty,
                                  initialCameraPosition: CameraPosition(
                                    target:
                                        _latitude.isNotEmpty &&
                                            _longitude.isNotEmpty
                                        ? LatLng(
                                            double.parse(_latitude),
                                            double.parse(_longitude),
                                          )
                                        : const LatLng(
                                            _defaultLatitude,
                                            _defaultLongitude,
                                          ),
                                    zoom:
                                        _latitude.isNotEmpty &&
                                            _longitude.isNotEmpty
                                        ? 15.0
                                        : _defaultZoom,
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
                                        _latitude.isNotEmpty &&
                                                _longitude.isNotEmpty
                                            ? FLucideIcons.mapPin
                                            : FLucideIcons.map,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      const Gap(6),
                                      Expanded(
                                        child: Text(
                                          _latitude.isNotEmpty &&
                                                  _longitude.isNotEmpty
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
                                    child: Icon(
                                      Icons.location_on,
                                      size: 36,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
            onPress: _isSubmitting ? null : _onSimpan,
            variant: FButtonVariant.primary,
            child: _isSubmitting
                ? SizedBox(
                    width: 18,
                    height: 18,
                    child: FCircularProgress.loader(),
                  )
                : const Text('Simpan'),
          ),
        ),
      ),
    );
  }

  Widget _buildSubDistrictDropdown(
    AsyncValue<List<SubDistrictDto>> subDistrictsAsync,
  ) {
    if (_selectedDistrictId.isEmpty) {
      return FSelect<String>(
        items: {'Pilih desa': ''},
        label: const Text('Desa'),
        hint: 'Pilih kecamatan terlebih dahulu',
        control: FSelectControl.managed(initial: ''),
      );
    }

    return subDistrictsAsync.when(
      data: (allSubDistricts) {
        final filtered = allSubDistricts
            .where((sd) => sd.district?.id == _selectedDistrictId)
            .toList();

        final items = <String, String>{'Pilih desa': ''};
        for (final sd in filtered) {
          items[sd.name] = sd.id;
        }

        return FSelect<String>(
          items: items,
          label: const Text('Desa'),
          hint: 'Pilih desa',
          control: FSelectControl.managed(
            initial: _selectedSubDistrictId,
            onChange: (value) => setState(() {
              _selectedSubDistrictId = value ?? '';
            }),
          ),
        );
      },
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SizedBox(
            width: 20,
            height: 20,
            child: FCircularProgress.loader(),
          ),
        ),
      ),
      error: (e, _) => Text(
        'Gagal memuat desa',
        style: TextStyle(fontSize: 12, color: Colors.red.shade400),
      ),
    );
  }

  Widget _buildFotoPicker({
    required String label,
    required File? file,
    required String? existingUrl,
    required ImageProcessConfig config,
    required ValueChanged<File> onPick,
    required VoidCallback onRemove,
  }) {
    final hasImage = file != null || existingUrl != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () async {
                final processed = await processImage(context, config: config);
                if (processed != null) onPick(processed);
              },
              child: Container(
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
                    : existingUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: existingUrl,
                          fit: BoxFit.cover,
                          errorWidget: (_, _, _) => const Icon(
                            FLucideIcons.imageOff,
                            size: 24,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : const Icon(
                        FLucideIcons.camera,
                        size: 24,
                        color: Colors.grey,
                      ),
              ),
            ),
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hasImage ? 'Ketuk untuk ganti' : 'Ketuk untuk tambah',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                  if (hasImage) ...[
                    const Gap(4),
                    GestureDetector(
                      onTap: onRemove,
                      child: Text(
                        'Hapus',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red.shade400,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
        Gap(5),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
        ),
      ],
    );
  }

  Future<void> _onPickContact() async {
    final phone = await showContactPhonePicker(context);
    if (phone != null) {
      _phoneCtrl.text = phone;
    }
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

  Future<void> _onSimpan() async {
    final nama = _namaCtrl.text.trim();
    final username = _usernameCtrl.text.trim();
    if (nama.isEmpty || username.isEmpty) {
      _showToast('Nama dan username wajib diisi');
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      // ── Upload images to ImgBB in parallel ──
      String? avatarUrl = _existingAvatarUrl;
      String? venuePhotoUrl = _existingVenuePhotoUrl;

      if (_avatarFile != null || _venuePhotoFile != null) {
        final imgbbClient = ref.read(imgbbApiClientProvider);
        final futures = <Future<dynamic>>[];

        if (_avatarFile != null) {
          futures.add(imgbbClient.uploadImage(file: _avatarFile!));
        } else {
          futures.add(Future.value(null));
        }

        if (_venuePhotoFile != null) {
          futures.add(imgbbClient.uploadImage(file: _venuePhotoFile!));
        } else {
          futures.add(Future.value(null));
        }

        final results = await Future.wait(futures);

        // results[0] = avatar upload response
        if (results[0] != null) {
          avatarUrl = (results[0] as dynamic).data.url as String;
        }

        // results[1] = venue photo upload response
        if (results[1] != null) {
          venuePhotoUrl = (results[1] as dynamic).data.url as String;
        }
      }

      // ── Parse numeric fields ──
      final commissionRate = int.tryParse(_komisiPersenCtrl.text.trim());
      final commissionAmount = int.tryParse(
        _komisiNominalCtrl.text.trim().replaceAll('.', ''),
      );
      final lat = _latitude.isNotEmpty ? double.tryParse(_latitude) : null;
      final lng = _longitude.isNotEmpty ? double.tryParse(_longitude) : null;

      // ── Call API ──
      final notifier = ref.read(resellerListProvider.notifier);

      if (_isEditing) {
        await notifier.edit(
          id: widget.item!.user.id,
          name: nama,
          username: username,
          password: _passwordCtrl.text.trim().isEmpty
              ? null
              : _passwordCtrl.text.trim(),
          phone: _phoneCtrl.text.trim().isEmpty ? null : _phoneCtrl.text.trim(),
          avatar: avatarUrl,
          venuePhoto: venuePhotoUrl,
          subDistrictId: _selectedSubDistrictId,
          commissionRate: commissionRate,
          commissionAmount: commissionAmount,
          lat: lat,
          lng: lng,
        );
      } else {
        await notifier.create(
          name: nama,
          username: username,
          password: _passwordCtrl.text.trim().isEmpty
              ? null
              : _passwordCtrl.text.trim(),
          phone: _phoneCtrl.text.trim().isEmpty ? null : _phoneCtrl.text.trim(),
          avatar: avatarUrl,
          venuePhoto: venuePhotoUrl,
          subDistrictId: _selectedSubDistrictId,
          commissionRate: commissionRate,
          commissionAmount: commissionAmount,
          lat: lat,
          lng: lng,
        );
      }

      if (!mounted) return;
      Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      _showToast(e.toString().replaceFirst('Exception: ', ''));
    }
  }

  void _showToast(String message) {
    showFToast(
      context: context,
      variant: FToastVariant.destructive,
      icon: const Icon(FLucideIcons.alertCircle, size: 16),
      title: Text(message),
    );
  }
}
