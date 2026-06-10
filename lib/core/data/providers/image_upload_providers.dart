import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/image_upload_repository.dart';
import '../../network/network_providers.dart';
import '../repositories/imagekit_upload_repository.dart';

part 'image_upload_providers.g.dart';

@riverpod
ImageUploadRepository imageUploadRepository(Ref ref) {
  return ImagekitUploadRepository(ref.watch(imagekitApiClientProvider));
}
