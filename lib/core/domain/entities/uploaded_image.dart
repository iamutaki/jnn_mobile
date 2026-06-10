class UploadedImage {
  const UploadedImage({
    required this.url,
    this.thumbUrl,
    this.displayUrl,
    this.width,
    this.height,
    this.size,
  });

  final String url;
  final String? thumbUrl;
  final String? displayUrl;
  final int? width;
  final int? height;
  final int? size;
}
