import 'package:envied/envied.dart';

import '../../flavors.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class EnvProduction {
  @EnviedField(varName: 'OPENCODE_API_KEY')
  static const String opencodeApiKey = _EnvProduction.opencodeApiKey;

  @EnviedField(varName: 'JNN_API_HOST')
  static const String jnnApiHost = _EnvProduction.jnnApiHost;
}

@Envied(path: '.env.staging')
abstract class EnvStaging {
  @EnviedField(varName: 'OPENCODE_API_KEY')
  static const String opencodeApiKey = _EnvStaging.opencodeApiKey;

  @EnviedField(varName: 'JNN_API_HOST')
  static const String jnnApiHost = _EnvStaging.jnnApiHost;
}

abstract class Env {
  static String get opencodeApiKey =>
      F.appFlavor == Flavor.staging
          ? EnvStaging.opencodeApiKey
          : EnvProduction.opencodeApiKey;

  static String get jnnApiHost =>
      F.appFlavor == Flavor.staging
          ? EnvStaging.jnnApiHost
          : EnvProduction.jnnApiHost;
}
