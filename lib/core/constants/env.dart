import 'package:envied/envied.dart';

import '../../flavors.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class EnvProduction {
  @EnviedField(varName: 'OPENCODE_API_KEY')
  static const String opencodeApiKey = _EnvProduction.opencodeApiKey;

  @EnviedField(varName: 'JNN_API_HOST')
  static const String jnnApiHost = _EnvProduction.jnnApiHost;

  @EnviedField(varName: 'IMGBB_API_KEY')
  static const String imgbbApiKey = _EnvProduction.imgbbApiKey;

  @EnviedField(varName: 'IMAGEKIT_PRIVATE_KEY')
  static const String imagekitPrivateKey = _EnvProduction.imagekitPrivateKey;

  @EnviedField(varName: 'IMAGE_UPLOAD_FOLDER')
  static const String imageUploadFolder = _EnvProduction.imageUploadFolder;
}

@Envied(path: '.env.staging')
abstract class EnvStaging {
  @EnviedField(varName: 'OPENCODE_API_KEY')
  static const String opencodeApiKey = _EnvStaging.opencodeApiKey;

  @EnviedField(varName: 'JNN_API_HOST')
  static const String jnnApiHost = _EnvStaging.jnnApiHost;

  @EnviedField(varName: 'IMGBB_API_KEY')
  static const String imgbbApiKey = _EnvStaging.imgbbApiKey;

  @EnviedField(varName: 'IMAGEKIT_PRIVATE_KEY')
  static const String imagekitPrivateKey = _EnvStaging.imagekitPrivateKey;

  @EnviedField(varName: 'IMAGE_UPLOAD_FOLDER')
  static const String imageUploadFolder = _EnvStaging.imageUploadFolder;
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

  static String get imgbbApiKey =>
      F.appFlavor == Flavor.staging
          ? EnvStaging.imgbbApiKey
          : EnvProduction.imgbbApiKey;

  static String get imagekitPrivateKey =>
      F.appFlavor == Flavor.staging
          ? EnvStaging.imagekitPrivateKey
          : EnvProduction.imagekitPrivateKey;

  static String get imageUploadFolder =>
      F.appFlavor == Flavor.staging
          ? EnvStaging.imageUploadFolder
          : EnvProduction.imageUploadFolder;
}
