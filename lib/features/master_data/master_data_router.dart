import 'package:go_router/go_router.dart';

import '../../core/router/route_definer.dart';
import '../user/presentation/pages/user_page.dart';
import '../master_data/presentation/pages/master_data_page.dart';

class MasterDataRouter {
  MasterDataRouter._();

  static const masterData = RouteDefiner(
    path: '/master-data',
    name: 'MasterDataRouter.masterData',
  );

  static const personel = RouteDefiner(
    path: '/personel',
    name: 'MasterDataRouter.personel',
  );

  static final List<GoRoute> routes = [
    GoRoute(
      path: masterData.path,
      name: masterData.name,
      builder: (context, state) => const MasterDataPage(),
      routes: [
        GoRoute(
          path: personel.path,
          name: personel.name,
          builder: (context, state) => const UserPage(),
        ),
      ],
    ),
  ];
}
