import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../home/presentation/pages/home_page.dart';
import '../../../notification/presentation/pages/notification_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';

/// Halaman utama dengan bottom navigation: Home, Notif, Profil.
class HomeShellPage extends StatefulWidget {
  const HomeShellPage({super.key});

  @override
  State<HomeShellPage> createState() => _HomeShellPageState();
}

class _HomeShellPageState extends State<HomeShellPage> {
  int _currentIndex = 0;

  static const _pages = [HomePage(), NotificationPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) => FScaffold(
    child: Column(
      children: [
        Expanded(child: _pages[_currentIndex]),
        FBottomNavigationBar(
          index: _currentIndex,
          onChange: (index) => setState(() => _currentIndex = index),
          children: const [
            FBottomNavigationBarItem(
              icon: Icon(FLucideIcons.house),
              label: Text('Beranda'),
            ),
            FBottomNavigationBarItem(
              icon: Icon(FLucideIcons.bell),
              label: Text('Notifikasi'),
            ),
            FBottomNavigationBarItem(
              icon: Icon(FLucideIcons.user),
              label: Text('Profil'),
            ),
          ],
        ),
      ],
    ),
  );
}
