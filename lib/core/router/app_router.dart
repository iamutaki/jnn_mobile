import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/auth_router.dart';
import '../../features/home/home_router.dart';
import '../../features/district/district_router.dart';
import '../../features/master_data/master_data_router.dart';
import '../../features/reseller/reseller_router.dart';
import '../../features/sub_district/sub_district_router.dart';
import '../../features/voucher/voucher_router.dart';
import '../../features/voucher_stock/voucher_stock_router.dart';
import '../../features/sales/sales_router.dart';
import '../../shared/splash/splash_router.dart';
import '../network/auth_token_storage.dart';

class AppRouter {
  AppRouter._();

  /// Root navigator key — digunakan untuk push route di atas GoRouter
  /// (misal: DevToolPage).
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final AuthTokenStorage _tokenStorage = AuthTokenStorage.instance;

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AuthRouter.login.path,
    routes: [
      ...AuthRouter.routes,
      ...SplashRouter.routes,
      ...HomeRouter.routes,
      ...DistrictRouter.routes,
      ...SubDistrictRouter.routes,
      ...MasterDataRouter.routes,
      ...ResellerRouter.routes,
      ...VoucherRouter.routes,
      ...VoucherStockRouter.routes,
      ...SalesRouter.routes,
    ],
    redirect: _redirect,
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Halaman tidak ditemukan: ${state.error}'),
      ),
    ),
  );

  static Future<String?> _redirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    final isAuth = await _tokenStorage.getIsAuth();
    final isOnLogin = state.matchedLocation == AuthRouter.login.path;
    final isOnAuth = state.matchedLocation.startsWith('/login');

    if (!isAuth && !isOnAuth) return AuthRouter.login.path;
    if (isAuth && isOnLogin) return SplashRouter.splash.path;

    return null;
  }
}
