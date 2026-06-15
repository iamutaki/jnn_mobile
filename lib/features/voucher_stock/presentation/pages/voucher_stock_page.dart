import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../district/presentation/providers/district_providers.dart';
import '../../../sub_district/data/models/sub_district_dto.dart';
import '../../../sub_district/presentation/providers/sub_district_providers.dart';
import '../../../sub_district/presentation/providers/sub_district_voucher_providers.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../voucher/data/models/voucher_dto.dart';
import '../../../voucher/presentation/providers/voucher_providers.dart';
import '../widgets/dynamic_voucher_id_list.dart';

/// Format harga ke ribuan pemisah '.' (tanpa simbol), cth: 5000 -> "5.000".
/// Sama dengan _formatPrice di voucher_page & sub_district_voucher_page.
String _formatPrice(int price) {
  final str = price.toString();
  final buffer = StringBuffer();
  for (var i = 0; i < str.length; i++) {
    if (i > 0 && (str.length - i) % 3 == 0) buffer.write('.');
    buffer.write(str[i]);
  }
  return buffer.toString();
}

/// Halaman input stok voucher per desa.
///
/// Relasi: Kecamatan → Desa → Voucher. Setiap desa memiliki voucher yang
/// sudah ditentukan (sub_district_voucher), sehingga dropdown Voucher hanya
/// berisi voucher yang dialokasikan untuk desa terpilih. Kode voucher
/// didapat dari impor CSV lalu ditampilkan sebagai tabel read-only dengan
/// virtual scroll (ribuan baris).
class VoucherStockPage extends ConsumerStatefulWidget {
  const VoucherStockPage({super.key});

  @override
  ConsumerState<VoucherStockPage> createState() => _VoucherStockPageState();
}

class _VoucherStockPageState extends ConsumerState<VoucherStockPage> {
  String _selectedVoucherId = '';
  String _selectedDistrictId = '';
  String _selectedSubDistrictId = '';

  /// Nama file CSV terpilih (hanya untuk ditampilkan).
  String? _csvFileName;

  /// Daftar kode voucher hasil impor CSV (read-only).
  List<String> _codes = const [];

  bool _isSubmitting = false;

  /// Reset pilihan voucher + kode (dipanggil saat konteks desa/voucher berubah).
  void _resetVoucherAndCodes() {
    _selectedVoucherId = '';
    _codes = const [];
    _csvFileName = null;
  }

  Future<void> _onPickCsv() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    if (result == null || result.files.isEmpty) return;

    final file = result.files.first;
    final path = file.path;
    final name = file.name;
    if (path == null) return;

    try {
      final content = await File(path).readAsString();
      final ids = _parseVoucherIds(content);
      setState(() {
        _codes = ids;
        _csvFileName = name;
      });

      if (!mounted) return;
      _showToast('${ids.length} kode berhasil diimpor dari "$name"');
    } catch (_) {
      if (!mounted) return;
      _showToast('Gagal membaca file CSV', destructive: true);
    }
  }

  /// Ambil kolom pertama (kode) dari setiap baris CSV.
  ///
  /// Menangani CSV "bermasalah" yang membungkus seluruh baris dalam kutip
  /// (mis. `"icw22,icw22,24HEURES,1d,,..."`) dan melewati baris header.
  /// Nilai kolom pertama yang sama dengan "username" (case-insensitive)
  /// selalu diabaikan. Hasil dibuang duplikatnya (urutan dipertahankan).
  List<String> _parseVoucherIds(String content) {
    const headerWords = {
      'username',
      'user',
      'kode',
      'code',
      'voucher',
      'id',
      'no',
      'no.',
      'name',
      'nama',
      'password',
      'profile',
      'time limit',
      'data limit',
      'comment',
    };

    final ids = <String>[];
    final seen = <String>{};

    for (final rawLine in content.split(RegExp(r'\r?\n'))) {
      var line = rawLine.trim();
      if (line.isEmpty) continue;

      // Beberapa CSV membungkus seluruh baris dalam kutip — buang dulu.
      if (line.length >= 2 && line.startsWith('"') && line.endsWith('"')) {
        line = line.substring(1, line.length - 1);
      }

      final cells = line.split(',').map((c) => c.trim()).toList();

      // Lewati baris header: banyak cell yang berupa nama kolom.
      final headerHits = cells
          .where((c) => headerWords.contains(c.toLowerCase()))
          .length;
      if (headerHits >= 2) continue;

      final kode = cells.first
          .replaceAll(RegExp("^[\"']+|[\"']+\$"), '')
          .trim();
      if (kode.isEmpty) continue;
      // Header kolom pertama = "username" → pastikan lolos pun diabaikan.
      if (kode.toLowerCase() == 'username') continue;
      if (seen.add(kode)) ids.add(kode);
    }
    return ids;
  }

  Future<void> _onSimpan() async {
    if (_selectedDistrictId.isEmpty) {
      _showToast('Kecamatan wajib dipilih', destructive: true);
      return;
    }
    if (_selectedSubDistrictId.isEmpty) {
      _showToast('Desa wajib dipilih', destructive: true);
      return;
    }
    if (_selectedVoucherId.isEmpty) {
      _showToast('Voucher wajib dipilih', destructive: true);
      return;
    }
    if (_codes.isEmpty) {
      _showToast('Impor CSV terlebih dahulu', destructive: true);
      return;
    }

    setState(() => _isSubmitting = true);

    // Submit TIDAK di sini — dikelola terpisah di alur manage digital_vouchers
    // nantinya. Halaman ini hanya mengumpulkan payload:
    //   voucherId     = _selectedVoucherId,
    //   subDistrictId = _selectedSubDistrictId,
    //   kodes         = _codes.
    await Future.delayed(const Duration(milliseconds: 400));

    if (!mounted) return;
    setState(() => _isSubmitting = false);
    _showToast('${_codes.length} voucher siap dikirim untuk desa terpilih');
  }

  @override
  Widget build(BuildContext context) {
    final vouchersAsync = ref.watch(voucherListProvider);
    final districtsAsync = ref.watch(districtListProvider);
    final subDistrictsAsync = ref.watch(subDistrictListProvider);
    // Voucher ditentukan per desa: ambil daftar voucher yang dialokasikan
    // untuk desa terpilih. Kosong bila belum pilih desa.
    final assignedVoucherIdsAsync = _selectedSubDistrictId.isEmpty
        ? const AsyncValue<List<String>>.data(<String>[])
        : ref.watch(subDistrictVoucherProvider(_selectedSubDistrictId));

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
                      'Stok Voucher',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 24),
              // ── Form (statis, tidak ikut scroll) ──
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Kecamatan / Desa (berdampingan) ──
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: districtsAsync.when(
                            data: (districts) {
                              final items = <String, String>{
                                'Pilih kecamatan': '',
                              };
                              for (final d in districts) {
                                items[d.name] = d.id;
                              }
                              return FSelect<String>(
                                items: items,
                                label: const Text('Kecamatan'),
                                hint: 'Pilih kecamatan',
                                control: FSelectControl.lifted(
                                  value: _selectedDistrictId,
                                  onChange: (value) => setState(() {
                                    _selectedDistrictId = value ?? '';
                                    // Kecamatan berubah → desa, voucher & kode wajib reset.
                                    _selectedSubDistrictId = '';
                                    _resetVoucherAndCodes();
                                  }),
                                ),
                              );
                            },
                            loading: () => _buildSkeletonDropdown('Kecamatan', 'Memuat kecamatan...'),
                            error: (e, _) => Text(
                              'Gagal memuat kecamatan',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red.shade400,
                              ),
                            ),
                          ),
                        ),
                        const Gap(8),
                        Expanded(
                          child: _buildSubDistrictDropdown(subDistrictsAsync),
                        ),
                      ],
                    ),
                    const Gap(8),

                    // ── Voucher (tipe) — ditentukan per desa terpilih ──
                    _buildVoucherDropdown(
                      vouchersAsync,
                      assignedVoucherIdsAsync,
                    ),
                    const Gap(8),

                    // ── CSV Picker ──
                    _buildCsvPicker(),
                  ],
                ),
              ),

              // ── Tabel: lazy/virtual scroll HANYA di region ini ──
              Expanded(
                child: _codes.isEmpty
                    ? Center(
                        child: Text(
                          'Belum ada voucher.\nImpor CSV untuk menambahkan.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          // Header tabel ter-pin (judul + nama kolom).
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
                            child: VoucherListHeader(count: _codes.length),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: VoucherTableHeader(),
                          ),
                          // Hanya daftar ini yang scroll & virtual.
                          Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                              itemCount: _codes.length,
                              itemBuilder: (context, i) => VoucherCodeRow(
                                index: i,
                                code: _codes[i],
                              ),
                            ),
                          ),
                        ],
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

  Widget _buildSkeletonDropdown(String label, String hint) {
    return Skeletonizer(
      enabled: true,
      child: FSelect<String>(
        items: const {'Memuat...': ''},
        label: Text(label),
        hint: hint,
        control: FSelectControl.lifted(
          value: '',
          onChange: (_) {},
        ),
      ),
    );
  }

  /// Dropdown voucher yang HANYA berisi voucher yang dialokasikan ke desa
  /// terpilih (relasi voucher ↔ desa). Disabled bila belum pilih desa.
  Widget _buildVoucherDropdown(
    AsyncValue<List<VoucherDto>> vouchersAsync,
    AsyncValue<List<String>> assignedIdsAsync,
  ) {
    if (_selectedSubDistrictId.isEmpty) {
      return FSelect<String>(
        items: {'Pilih voucher': ''},
        label: const Text('Voucher'),
        hint: 'Pilih desa terlebih dahulu',
        control: FSelectControl.lifted(
          value: _selectedVoucherId,
          onChange: (value) => setState(() {
            _selectedVoucherId = value ?? '';
          }),
        ),
      );
    }

    return vouchersAsync.when(
      loading: () => _buildSkeletonDropdown('Voucher', 'Memuat voucher...'),
      error: (e, _) => Text(
        'Gagal memuat voucher',
        style: TextStyle(fontSize: 12, color: Colors.red.shade400),
      ),
      data: (all) => assignedIdsAsync.when(
        loading: () => _buildSkeletonDropdown('Voucher', 'Memuat voucher desa...'),
        error: (e, _) => Text(
          'Gagal memuat voucher desa',
          style: TextStyle(fontSize: 12, color: Colors.red.shade400),
        ),
        data: (assignedIds) {
          final assigned = assignedIds.toSet();
          final items = <String, String>{'Pilih voucher': ''};
          for (final v in all.where((v) => assigned.contains(v.id))) {
            items['${v.name} - Rp${_formatPrice(v.price)}'] = v.id;
          }
          if (items.length == 1) {
            // Hanya placeholder → desa belum punya alokasi voucher.
            items['Tidak ada voucher untuk desa ini'] = '';
          }
          return FSelect<String>(
            items: items,
            label: const Text('Voucher'),
            hint: 'Pilih tipe voucher',
            control: FSelectControl.lifted(
              value: _selectedVoucherId,
              onChange: (value) => setState(() {
                _selectedVoucherId = value ?? '';
                // Ganti tipe voucher → kode lama tidak relevan.
                _codes = const [];
                _csvFileName = null;
              }),
            ),
          );
        },
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
        // lifted → tampilan selalu mengikuti state (kosong saat belum ada desa).
        control: FSelectControl.lifted(
          value: _selectedSubDistrictId,
          onChange: (value) => setState(() {
            _selectedSubDistrictId = value ?? '';
          }),
        ),
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
          // lifted → tampilan reset otomatis saat kecamatan berubah.
          control: FSelectControl.lifted(
            value: _selectedSubDistrictId,
            onChange: (value) => setState(() {
              _selectedSubDistrictId = value ?? '';
              // Desa berubah → voucher & kode wajib reset.
              _resetVoucherAndCodes();
            }),
          ),
        );
      },
      loading: () => _buildSkeletonDropdown('Desa', 'Memuat desa...'),
      error: (e, _) => Text(
        'Gagal memuat desa',
        style: TextStyle(fontSize: 12, color: Colors.red.shade400),
      ),
    );
  }

  Widget _buildCsvPicker() {
    final hasFile = _csvFileName != null;

    return GestureDetector(
      onTap: _isSubmitting ? null : _onPickCsv,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(
              hasFile ? FLucideIcons.fileCheck2 : FLucideIcons.fileUp,
              size: 18,
              color: hasFile ? Color(0xFF0EA573) : Colors.grey.shade600,
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hasFile ? _csvFileName! : 'Impor dari CSV',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(2),
                  Text(
                    hasFile
                        ? 'Ketuk untuk ganti file'
                        : 'Kolom pertama (Username) diimpor sebagai kode',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
            if (hasFile)
              GestureDetector(
                onTap: _isSubmitting
                    ? null
                    : () {
                        // Hapus CSV sekaligus reset daftar kode.
                        setState(() {
                          _codes = const [];
                          _csvFileName = null;
                        });
                      },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Icon(
                    FLucideIcons.x,
                    size: 18,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showToast(String message, {bool destructive = false}) {
    showFToast(
      context: context,
      variant: destructive ? FToastVariant.destructive : FToastVariant.primary,
      icon: Icon(
        destructive ? FLucideIcons.alertCircle : FLucideIcons.checkCircle2,
        size: 16,
      ),
      title: Text(message),
    );
  }
}
