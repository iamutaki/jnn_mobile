import 'package:go_router/go_router.dart';

import '../../core/router/route_definer.dart';
import 'presentation/pages/district_page.dart';

class DistrictRouter {
  DistrictRouter._();

  static const district = RouteDefiner(
    path: '/district',
    name: 'DistrictRouter.district',
  );

  static final List<GoRoute> routes = [
    GoRoute(
      path: district.path,
      name: district.name,
      builder: (context, state) => const DistrictPage(),
    ),
  ];
}
