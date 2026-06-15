import 'package:go_router/go_router.dart';

import '../../core/router/route_definer.dart';
import 'presentation/pages/voucher_stock_page.dart';

class VoucherStockRouter {
  VoucherStockRouter._();

  static const voucherStock = RouteDefiner(
    path: '/voucher-stock',
    name: 'VoucherStockRouter.voucherStock',
  );

  static final List<GoRoute> routes = [
    GoRoute(
      path: voucherStock.path,
      name: voucherStock.name,
      builder: (context, state) => const VoucherStockPage(),
    ),
  ];
}
