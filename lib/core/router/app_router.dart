import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/auth_router.dart';
import '../../features/home/home_router.dart';
import '../../features/master_data/master_data_router.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AuthRouter.login.path,
    routes: [
      ...AuthRouter.routes,
      ...HomeRouter.routes,
      ...MasterDataRouter.routes,
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Halaman tidak ditemukan: ${state.error}'),
      ),
    ),
  );
}
