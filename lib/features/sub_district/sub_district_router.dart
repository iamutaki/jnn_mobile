import 'package:go_router/go_router.dart';

import '../../core/router/route_definer.dart';
import 'presentation/pages/sub_district_page.dart';

class SubDistrictRouter {
  SubDistrictRouter._();

  static const subDistrict = RouteDefiner(
    path: '/sub-district',
    name: 'SubDistrictRouter.subDistrict',
  );

  static final List<GoRoute> routes = [
    GoRoute(
      path: subDistrict.path,
      name: subDistrict.name,
      builder: (context, state) => const SubDistrictPage(),
    ),
  ];
}
