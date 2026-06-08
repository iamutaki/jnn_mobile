import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import 'core/router/app_router.dart' show AppRouter;
import 'core/widgets/version_banner.dart';
import 'flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FThemes.blue.light.touch;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      locale: const Locale('id', 'ID'),
      title: F.title,
      supportedLocales: FLocalizations.supportedLocales,
      localizationsDelegates: const [...FLocalizations.localizationsDelegates],
      theme: theme.toApproximateMaterialTheme(),
      builder: (_, child) => FTheme(
        data: theme,
        child: FToaster(
          child: FTooltipGroup(
            child: VersionBanner(child: child ?? const SizedBox.shrink()),
          ),
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
