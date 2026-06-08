import 'package:go_router/go_router.dart';

import '../../core/router/route_definer.dart';
import '../home/presentation/pages/home_shell_page.dart';

class HomeRouter {
  HomeRouter._();

  static const home = RouteDefiner(
    path: '/home',
    name: 'HomeRouter.home',
  );

  static final List<GoRoute> routes = [
    GoRoute(
      path: home.path,
      name: home.name,
      builder: (context, state) => const HomeShellPage(),
    ),
  ];
}
