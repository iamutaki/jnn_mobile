// Mock models untuk UI Laporan Kegiatan.
// Akan diganti dengan domain models saat integrasi backend.

class ActivityItem {
  final String id;
  final String status; // 'active' atau 'completed'
  final String description;
  final DateTime timestamp;
  final String? photoBefore;
  final String? photoAfter;
  final String? kecamatanId;
  final String? kecamatanName;
  final String? desaId;
  final String? desaName;
  final double? startLat;
  final double? startLng;
  final double? endLat;
  final double? endLng;

  const ActivityItem({
    required this.id,
    required this.status,
    required this.description,
    required this.timestamp,
    this.photoBefore,
    this.photoAfter,
    this.kecamatanId,
    this.kecamatanName,
    this.desaId,
    this.desaName,
    this.startLat,
    this.startLng,
    this.endLat,
    this.endLng,
  });
}

class ActivitySession {
  final String id;
  final String title;
  final DateTime date;
  final bool isActive;
  final List<ActivityItem> items;
  const ActivitySession({
    required this.id,
    required this.title,
    required this.date,
    required this.isActive,
    required this.items,
  });
}

class MockOption {
  final String id;
  final String name;
  const MockOption({required this.id, required this.name});
}

final mockDistricts = [
  const MockOption(id: '1', name: 'Kecamatan A'),
  const MockOption(id: '2', name: 'Kecamatan B'),
  const MockOption(id: '3', name: 'Kecamatan C'),
];

final mockSubDistricts = {
  '1': [
    const MockOption(id: '1-1', name: 'Desa A1'),
    const MockOption(id: '1-2', name: 'Desa A2'),
  ],
  '2': [
    const MockOption(id: '2-1', name: 'Desa B1'),
    const MockOption(id: '2-2', name: 'Desa B2'),
    const MockOption(id: '2-3', name: 'Desa B3'),
  ],
  '3': [
    const MockOption(id: '3-1', name: 'Desa C1'),
  ],
};
