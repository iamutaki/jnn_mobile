import 'package:go_router/go_router.dart';

import '../../core/router/route_definer.dart';
import 'presentation/pages/activity_report_list_page.dart';

class ActivityReportRouter {
  ActivityReportRouter._();

  static const activityReport = RouteDefiner(
    path: '/activity-report',
    name: 'ActivityReportRouter.activityReport',
  );

  static final List<GoRoute> routes = [
    GoRoute(
      path: activityReport.path,
      name: activityReport.name,
      builder: (context, state) => const ActivityReportListPage(),
    ),
  ];
}
