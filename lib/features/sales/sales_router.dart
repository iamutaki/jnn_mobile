import 'package:go_router/go_router.dart';

import '../../core/router/route_definer.dart';
import 'presentation/pages/sales_page.dart';

class SalesRouter {
  SalesRouter._();

  static const sales = RouteDefiner(
    path: '/sales',
    name: 'SalesRouter.sales',
  );

  static final List<GoRoute> routes = [
    GoRoute(
      path: sales.path,
      name: sales.name,
      builder: (context, state) => const SalesPage(),
    ),
  ];
}
