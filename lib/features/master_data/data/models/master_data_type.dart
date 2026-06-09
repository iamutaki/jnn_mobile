import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

enum MasterDataType {
  kecamatan(
    label: 'Kecamatan',
    icon: FLucideIcons.map,
    color: Color(0xFF0891B2),
    description: 'Kelola data kecamatan',
  ),
  desa(
    label: 'Desa',
    icon: FLucideIcons.house,
    color: Color(0xFF0EA573),
    description: 'Kelola data desa',
  ),
  voucher(
    label: 'Voucher',
    icon: FLucideIcons.package,
    color: Color(0xFFE8710A),
    description: 'Kelola data voucher',
  ),
  personel(
    label: 'Personel',
    icon: FLucideIcons.users,
    color: Color(0xFF1A73E8),
    description: 'Kelola data personel',
  ),
  reseller(
    label: 'Reseller',
    icon: FLucideIcons.store,
    color: Color(0xFFDC2626),
    description: 'Kelola data reseller',
  );

  final String label;
  final IconData icon;
  final Color color;
  final String description;

  const MasterDataType({
    required this.label,
    required this.icon,
    required this.color,
    required this.description,
  });

  static MasterDataType? fromName(String type) {}
}
