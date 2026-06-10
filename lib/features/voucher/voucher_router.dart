import 'package:go_router/go_router.dart';

import '../../core/router/route_definer.dart';
import 'presentation/pages/voucher_page.dart';

class VoucherRouter {
  VoucherRouter._();

  static const voucher = RouteDefiner(
    path: '/voucher',
    name: 'VoucherRouter.voucher',
  );

  static final List<GoRoute> routes = [
    GoRoute(
      path: voucher.path,
      name: voucher.name,
      builder: (context, state) => const VoucherPage(),
    ),
  ];
}
