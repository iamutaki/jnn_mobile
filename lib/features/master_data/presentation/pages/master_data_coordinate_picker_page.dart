import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

class MasterDataCoordinatePickerPage extends StatefulWidget {
  final String? initialLatitude;
  final String? initialLongitude;

  const MasterDataCoordinatePickerPage({
    super.key,
    this.initialLatitude,
    this.initialLongitude,
  });

  @override
  State<MasterDataCoordinatePickerPage> createState() =>
      _MasterDataCoordinatePickerPageState();
}

class _MasterDataCoordinatePickerPageState
    extends State<MasterDataCoordinatePickerPage> {
  MapLibreMapController? _controller;
  LatLng? _selectedPosition;
  bool _loading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  Future<void> _initLocation() async {
    try {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() => _error = 'Izin lokasi ditolak');
        _loading = false;
        return;
      }
      if (permission == LocationPermission.deniedForever) {
        setState(() => _error = 'Izin lokasi ditolak permanen');
        _loading = false;
        return;
      }

      final pos = await Geolocator.getCurrentPosition();
      final lat = widget.initialLatitude?.isNotEmpty == true
          ? double.parse(widget.initialLatitude!)
          : pos.latitude;
      final lng = widget.initialLongitude?.isNotEmpty == true
          ? double.parse(widget.initialLongitude!)
          : pos.longitude;

      setState(() {
        _selectedPosition = LatLng(lat, lng);
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Gagal mendapatkan lokasi';
        _loading = false;
      });
    }
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
                      'Pilih Koordinat',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 24),
              Expanded(
                child: _loading
                    ? const Center(child: FCircularProgress.loader())
                    : _error.isNotEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Text(_error, textAlign: TextAlign.center),
                        ),
                      )
                    : _buildMap(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_selectedPosition != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 2),
                child: Text(
                  '${_selectedPosition!.latitude.toStringAsFixed(6)}, ${_selectedPosition!.longitude.toStringAsFixed(6)}',
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                  textAlign: TextAlign.center,
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 2, 16, 16),
              child: FButton(
                onPress: _onSimpan,
                variant: FButtonVariant.primary,
                child: const Text('Simpan Koordinat'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMap() {
    if (_selectedPosition == null) return const SizedBox();

    return Stack(
      children: [
        MapLibreMap(
          styleString: MapLibreStyles.openfreemapLiberty,
          initialCameraPosition: CameraPosition(
            target: _selectedPosition!,
            zoom: 15,
          ),
          onMapCreated: (controller) {
            _controller = controller;
          },
          onCameraIdle: _onCameraIdle,
          myLocationEnabled: true,
          myLocationTrackingMode: MyLocationTrackingMode.none,
          compassEnabled: true,
        ),
        const Center(
          child: IgnorePointer(
            child: Icon(Icons.location_on, size: 36, color: Colors.red),
          ),
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: FButton.icon(
            onPress: _onMyLocation,
            variant: FButtonVariant.secondary,
            child: const Icon(FLucideIcons.crosshair, size: 20),
          ),
        ),
      ],
    );
  }

  Future<void> _onCameraIdle() async {
    final controller = _controller;
    if (controller == null || !mounted) return;
    final pos = await controller.queryCameraPosition();
    if (pos == null || !mounted) return;
    setState(() => _selectedPosition = pos.target);
  }

  Future<void> _onMyLocation() async {
    try {
      final pos = await Geolocator.getCurrentPosition();
      final latlng = LatLng(pos.latitude, pos.longitude);
      setState(() => _selectedPosition = latlng);
      await _controller?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: latlng, zoom: 18),
        ),
      );
    } catch (_) {}
  }

  void _onSimpan() {
    if (_selectedPosition == null) return;
    Navigator.of(context).pop({
      'latitude': _selectedPosition!.latitude.toStringAsFixed(6),
      'longitude': _selectedPosition!.longitude.toStringAsFixed(6),
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
