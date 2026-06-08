enum Flavor { staging, production }

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.staging:
        return 'JNN Mobile (Test)';
      case Flavor.production:
        return 'JNN Mobile';
    }
  }
}
