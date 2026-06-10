import 'package:go_router/go_router.dart';

import '../../core/router/route_definer.dart';
import 'presentation/pages/reseller_page.dart';

class ResellerRouter {
  ResellerRouter._();

  static const reseller = RouteDefiner(
    path: '/reseller',
    name: 'ResellerRouter.reseller',
  );

  static final List<GoRoute> routes = [
    GoRoute(
      path: reseller.path,
      name: reseller.name,
      builder: (context, state) => const ResellerPage(),
    ),
  ];
}
