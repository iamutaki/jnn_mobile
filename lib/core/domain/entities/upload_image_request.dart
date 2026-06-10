class UploadImageRequest {
  const UploadImageRequest({
    required this.file,
    this.tags,
    this.folder,
  });

  final dynamic file;
  final List<String>? tags;
  final String? folder;
}
