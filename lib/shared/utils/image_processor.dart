import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import 'image_compressor.dart';
import 'image_source_picker.dart';

/// Configuration for image processing.
class ImageProcessConfig {
  /// Whether to show crop UI before compressing.
  final bool enableCrop;

  /// Crop aspect ratio (null = freeform). Only used when [enableCrop] is true.
  /// For square: `const CropAspectRatio(ratioX: 1, ratioY: 1)`
  final CropAspectRatio? cropAspectRatio;

  /// Maximum width of the output image.
  final int maxWidth;

  /// JPEG quality 0–100.
  final int quality;

  const ImageProcessConfig({
    this.enableCrop = false,
    this.cropAspectRatio,
    this.maxWidth = 720,
    this.quality = 80,
  });

  /// Avatar config: square crop, max width 620, quality 80%.
  static const avatar = ImageProcessConfig(
    enableCrop: true,
    cropAspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
    maxWidth: 620,
    quality: 80,
  );

  /// Venue / general photo config: no crop, max width 720, quality 80%.
  static const venue = ImageProcessConfig(
    enableCrop: false,
    maxWidth: 720,
    quality: 80,
  );
}

/// Pick → (optional crop) → compress → returns a ready-to-upload [File].
///
/// Returns `null` if the user cancels picking or cropping.
Future<File?> processImage(
  BuildContext context, {
  required ImageProcessConfig config,
}) async {
  // 1. Pick
  final rawFile = await showImageSourcePicker(context);
  if (rawFile == null) return null;

  // 2. Crop (if enabled)
  String sourcePath = rawFile.path;

  if (config.enableCrop) {
    final cropped = await ImageCropper().cropImage(
      sourcePath: sourcePath,
      aspectRatio: config.cropAspectRatio,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100, // keep max quality; we compress below
      uiSettings: _buildUiSettings(),
    );

    if (cropped == null) return null; // user cancelled
    sourcePath = cropped.path;
  }

  // 3. Compress & resize
  return compressImage(
    file: File(sourcePath),
    quality: config.quality,
    maxWidth: config.maxWidth,
  );
}

/// Build platform-specific UI settings for the cropper.
List<PlatformUiSettings> _buildUiSettings() {
  return [
    AndroidUiSettings(
      toolbarTitle: 'Crop Gambar',
      toolbarColor: Colors.black,
      toolbarWidgetColor: Colors.white,
      lockAspectRatio: true,
    ),
    IOSUiSettings(
      title: 'Crop Gambar',
      aspectRatioLockEnabled: true,
    ),
  ];
}
