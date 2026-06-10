import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../domain/entities/upload_image_request.dart';
import '../../domain/entities/uploaded_image.dart';
import '../../domain/failures/image_upload_failure.dart';
import '../../domain/repositories/image_upload_repository.dart';
import '../../network/imgbb_api_client.dart';
import '../../network/models/imgbb_upload_response.dart';

class ImgbbUploadRepository implements ImageUploadRepository {
  ImgbbUploadRepository(this._imgbbApiClient);

  final ImgbbApiClient _imgbbApiClient;

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

      final response = await _imgbbApiClient.uploadImage(file: file);
      return Either.right(_mapToUploadedImage(response));
    } on Exception catch (e) {
      return Either.left(ImageUploadFailure(e.toString()));
    }
  }

  @override
  Future<List<Either<ImageUploadFailure, UploadedImage>>> uploadImages(
    List<UploadImageRequest> requests,
  ) {
    return Future.wait(
      requests.map((request) => uploadImage(request)),
    );
  }

  UploadedImage _mapToUploadedImage(ImgbbUploadResponse response) {
    return UploadedImage(
      url: response.data.url,
      thumbUrl: response.data.thumb?.url,
      displayUrl: response.data.displayUrl,
      width: int.tryParse(response.data.width),
      height: int.tryParse(response.data.height),
      size: int.tryParse(response.data.size),
    );
  }
}
