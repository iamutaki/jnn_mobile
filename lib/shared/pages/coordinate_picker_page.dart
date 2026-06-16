import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

import '../../core/network/models/nominatim_search_result.dart';
import '../../core/network/network_providers.dart';

class CoordinatePickerPage extends ConsumerStatefulWidget {
  final String? initialLatitude;
  final String? initialLongitude;

  const CoordinatePickerPage({
    super.key,
    this.initialLatitude,
    this.initialLongitude,
  });

  @override
  ConsumerState<CoordinatePickerPage> createState() =>
      _CoordinatePickerPageState();
}

class _CoordinatePickerPageState extends ConsumerState<CoordinatePickerPage> {
  MapLibreMapController? _controller;
  LatLng? _selectedPosition;
  bool _loading = true;
  bool _mapReady = false;
  bool _hasPicked = false;
  String _error = '';

  final _searchController = TextEditingController();
  List<NominatimSearchResult> _searchResults = [];
  bool _searching = false;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _initLocation();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    _debounceTimer?.cancel();
    final text = _searchController.text.trim();
    if (text.isEmpty) {
      setState(() => _searchResults = []);
      return;
    }
    _debounceTimer = Timer(const Duration(milliseconds: 400), () {
      _onSearch(text);
    });
  }

  Future<void> _initLocation() async {
    final hasInitial =
        widget.initialLatitude?.isNotEmpty == true &&
        widget.initialLongitude?.isNotEmpty == true;

    if (hasInitial) {
      setState(() {
        _selectedPosition = LatLng(
          double.parse(widget.initialLatitude!),
          double.parse(widget.initialLongitude!),
        );
        _hasPicked = true;
        _loading = false;
      });
      return;
    }

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

      var pos = await Geolocator.getLastKnownPosition();
      pos ??= await Geolocator.getCurrentPosition();

      setState(() {
        _selectedPosition = LatLng(pos!.latitude, pos.longitude);
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Gagal mendapatkan lokasi';
        _loading = false;
      });
    }
  }

  Future<void> _onSearch(String query) async {
    if (query.trim().isEmpty) return;

    setState(() => _searching = true);

    try {
      final results = await ref
          .read(nominatimApiClientProvider)
          .search(query.trim());
      if (!mounted) return;
      setState(() => _searchResults = results);
    } catch (_) {
      if (!mounted) return;
      setState(() => _searchResults = []);
    } finally {
      if (mounted) setState(() => _searching = false);
    }
  }

  Future<void> _onSelectSearchResult(NominatimSearchResult result) async {
    final latlng = LatLng(result.lat, result.lon);

    setState(() {
      _selectedPosition = latlng;
      _hasPicked = true;
      _searchResults = [];
      _searchController.clear();
    });

    await _controller?.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(target: latlng, zoom: 15)),
    );
  }

  Widget _buildSearchingSuffix(
    BuildContext context,
    FTextFieldStyle style,
    Set<FTextFieldVariant> variants,
  ) => const Padding(
    padding: EdgeInsets.all(12),
    child: FCircularProgress.loader(),
  );

  Widget _buildSearchSuffix(
    BuildContext context,
    FTextFieldStyle style,
    Set<FTextFieldVariant> variants,
  ) => GestureDetector(
    onTap: () => _onSearch(_searchController.text),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Icon(FLucideIcons.search, size: 18),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: FTextField(
                  control: FTextFieldControl.managed(
                    controller: _searchController,
                  ),
                  hint: 'Cari lokasi...',
                  suffixBuilder: _searching
                      ? _buildSearchingSuffix
                      : _buildSearchSuffix,
                  onSubmit: _onSearch,
                ),
              ),
              if (_searchResults.isNotEmpty)
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final result = _searchResults[index];
                      return ListTile(
                        dense: true,
                        title: Text(
                          result.displayName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 13),
                        ),
                        leading: const Icon(FLucideIcons.mapPin, size: 18),
                        onTap: () => _onSelectSearchResult(result),
                      );
                    },
                  ),
                ),
              const Divider(height: 12),
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
          onStyleLoadedCallback: () {
            if (mounted) setState(() => _mapReady = true);
          },
          onCameraIdle: _onCameraIdle,
          myLocationEnabled: true,
          myLocationTrackingMode: MyLocationTrackingMode.none,
          compassEnabled: true,
        ),

        if (!_mapReady) const Center(child: FCircularProgress.loader()),

        if (_hasPicked && _mapReady)
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
    setState(() {
      _selectedPosition = pos.target;
      _hasPicked = true;
    });
  }

  Future<void> _onMyLocation() async {
    try {
      final pos = await Geolocator.getCurrentPosition();
      final latlng = LatLng(pos.latitude, pos.longitude);
      setState(() {
        _selectedPosition = latlng;
        _hasPicked = true;
      });
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
    _debounceTimer?.cancel();
    _searchController.dispose();
    _controller?.dispose();
    super.dispose();
  }
}
