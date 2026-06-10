import 'package:fpdart/fpdart.dart';

import '../entities/upload_image_request.dart';
import '../entities/uploaded_image.dart';
import '../failures/image_upload_failure.dart';

abstract interface class ImageUploadRepository {
  Future<Either<ImageUploadFailure, UploadedImage>> uploadImage(
    UploadImageRequest request,
  );

  Future<List<Either<ImageUploadFailure, UploadedImage>>> uploadImages(
    List<UploadImageRequest> requests,
  );
}
