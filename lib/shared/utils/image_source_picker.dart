import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:image_picker/image_picker.dart';

enum ImageSourceOption { gallery, camera, file }

Future<File?> showImageSourcePicker(BuildContext context) async {
  final source = await showDialog<ImageSourceOption>(
    context: context,
    builder: (context) => SimpleDialog(
      title: const Text('Pilih Sumber Gambar'),
      children: [
        ListTile(
          dense: true,
          leading: const Icon(FLucideIcons.image),
          title: const Text('Galeri'),
          onTap: () => Navigator.of(context).pop(ImageSourceOption.gallery),
        ),
        ListTile(
          dense: true,
          leading: const Icon(FLucideIcons.camera),
          title: const Text('Kamera'),
          onTap: () => Navigator.of(context).pop(ImageSourceOption.camera),
        ),
        ListTile(
          dense: true,
          leading: const Icon(FLucideIcons.file),
          title: const Text('File'),
          onTap: () => Navigator.of(context).pop(ImageSourceOption.file),
        ),
      ],
    ),
  );

  if (source == null) return null;

  switch (source) {
    case ImageSourceOption.gallery:
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked == null) return null;
      return File(picked.path);
    case ImageSourceOption.camera:
      final picked = await ImagePicker().pickImage(source: ImageSource.camera);
      if (picked == null) return null;
      return File(picked.path);
    case ImageSourceOption.file:
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'webp'],
      );
      if (result == null || result.files.isEmpty) return null;
      final path = result.files.single.path;
      if (path == null) return null;
      return File(path);
  }
}
