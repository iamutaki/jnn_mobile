import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart' as img;

File compressImage({
  required File file,
  int quality = 80,
  int maxWidth = 620,
}) {
  final image = img.decodeImage(file.readAsBytesSync());
  if (image == null) return file;

  img.Image processed = image;
  if (processed.width > maxWidth) {
    processed = img.copyResize(processed, width: maxWidth);
  }

  final Uint8List compressed = img.encodeJpg(processed, quality: quality);
  final outputFile = File('${file.parent.path}/${DateTime.now().millisecondsSinceEpoch}.jpg');
  outputFile.writeAsBytesSync(compressed);
  return outputFile;
}
