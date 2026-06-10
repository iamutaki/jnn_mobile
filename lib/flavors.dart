enum Flavor { staging, production }

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static bool get isStaging => appFlavor == Flavor.staging;

  static String get title {
    switch (appFlavor) {
      case Flavor.staging:
        return 'JNN Mobile (Staging)';
      case Flavor.production:
        return 'JNN Mobile';
    }
  }
}
