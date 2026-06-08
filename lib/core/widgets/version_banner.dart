import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../flavors.dart';

/// Banner versi app di pojok kanan atas.
/// Hanya ditampilkan pada flavor staging.
/// Menggunakan Overlay agar tampil di atas status bar (baterai, jam, dll).
class VersionBanner extends StatelessWidget {
  const VersionBanner({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (F.appFlavor != Flavor.staging) return child;

    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        final version = snapshot.hasData
            ? '${snapshot.data!.version}+${snapshot.data!.buildNumber}'
            : '';
        return Stack(
          children: [
            child,
            // Overlay banner di atas semua termasuk status bar
            Positioned(
              top: 0,
              right: 0,
              child: SafeArea(
                bottom: false,
                child: _BannerRibbon(version: version),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Ribbon banner dengan background warna orange.
class _BannerRibbon extends StatelessWidget {
  const _BannerRibbon({required this.version});

  final String version;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(6),
        ),
      ),
      child: Text(
        version,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 9,
          letterSpacing: 0.5,
          color: Colors.white,
        ),
      ),
    );
  }
}
