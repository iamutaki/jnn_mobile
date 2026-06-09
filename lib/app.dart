import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import 'core/router/app_router.dart' show AppRouter;
import 'core/widgets/auth_state_redirector.dart';
import 'core/widgets/version_banner.dart';
import 'flavors.dart';
import 'shared/dev_tool/dev_tool.dart';
import 'shared/dev_tool/storage_inspector/secure_storage_inspector.dart';
import 'shared/dev_tool/storage_inspector/shared_pref_inspector.dart';
import 'shared/dev_tool/storage_inspector/udid_inspector.dart';

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
            child: DevToolOverlay(
              inspectors: [
                NetworkMonitorInspector(),
                SharedPrefInspector(),
                SecureStorageInspector(),
                UdidInspector(),
              ],
              child: AuthStateRedirector(
                child: VersionBanner(child: child ?? const SizedBox.shrink()),
              ),
            ),
          ),
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
