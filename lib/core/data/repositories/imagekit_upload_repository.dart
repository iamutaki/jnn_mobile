import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../constants/env.dart';
import '../../domain/entities/upload_image_request.dart';
import '../../domain/entities/uploaded_image.dart';
import '../../domain/failures/image_upload_failure.dart';
import '../../domain/repositories/image_upload_repository.dart';
import '../../network/imagekit_api_client.dart';
import '../../network/models/imagekit_upload_response.dart';

class ImagekitUploadRepository implements ImageUploadRepository {
  ImagekitUploadRepository(this._imagekitApiClient);

  final ImagekitApiClient _imagekitApiClient;

  @override
  Future<Either<ImageUploadFailure, UploadedImage>> uploadImage(
    UploadImageRequest request,
  ) async {
    try {
      final file = request.file is File ? request.file as File : null;
      if (file == null) {
        return Either.left(
          const ImageUploadFailure('Invalid file type'),
        );
      }

      final envFolder = Env.imageUploadFolder;
      final folder = _resolveFolder(envFolder, request.folder);

      final response = await _imagekitApiClient.uploadImage(
        file: file,
        folder: folder,
        tags: request.tags,
      );
      return Either.right(_mapToUploadedImage(response));
    } on Exception catch (e) {
      return Either.left(ImageUploadFailure(e.toString()));
    }
  }

  /// Prepends the env root folder to the request sub-folder.
  /// e.g. envFolder="/staging" + requestFolder="/users/avatars"
  ///      → "/staging/users/avatars"
  static String _resolveFolder(String envFolder, String? subFolder) {
    final env = envFolder.replaceAll(RegExp(r'/+$'), '');
    if (subFolder == null || subFolder.isEmpty) return env;

    final sub = subFolder.replaceAll(RegExp(r'^/+'), '');
    return '$env/$sub';
  }

  @override
  Future<List<Either<ImageUploadFailure, UploadedImage>>> uploadImages(
    List<UploadImageRequest> requests,
  ) {
    return Future.wait(
      requests.map((request) => uploadImage(request)),
    );
  }

  UploadedImage _mapToUploadedImage(ImagekitUploadResponse response) {
    return UploadedImage(
      url: response.url,
      thumbUrl: response.thumbnailUrl,
      width: response.width,
      height: response.height,
      size: response.size,
    );
  }
}
