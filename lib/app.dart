import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'flavors.dart';
import 'pages/my_home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: F.title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          final version = (snapshot.hasData)
              ? '${snapshot.data!.version}+${snapshot.data!.buildNumber}'
              : '';
          return _flavorBanner(
            child: MyHomePage(),
            show: F.appFlavor == Flavor.staging,
            version: version,
          );
        },
      ),
    );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
    String version = '',
  }) =>
      show
          ? Banner(
              location: BannerLocation.topEnd,
              message: version,
              color: Colors.orange.withAlpha(200),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 10.0,
                letterSpacing: 1.0,
                color: Colors.white,
              ),
              textDirection: TextDirection.ltr,
              child: child,
            )
          : child;
}
