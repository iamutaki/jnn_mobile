class ImagekitUploadResponse {
  const ImagekitUploadResponse({
    required this.fileId,
    required this.name,
    required this.url,
    this.thumbnailUrl,
    this.size,
    this.height,
    this.width,
    this.filePath,
    this.tags,
    this.folder,
  });

  final String fileId;
  final String name;
  final String url;
  final String? thumbnailUrl;
  final int? size;
  final int? height;
  final int? width;
  final String? filePath;
  final List<String>? tags;
  final String? folder;

  factory ImagekitUploadResponse.fromJson(Map<String, dynamic> json) {
    return ImagekitUploadResponse(
      fileId: json['fileId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      url: json['url'] as String? ?? '',
      thumbnailUrl: json['thumbnailUrl'] as String?,
      size: json['size'] as int?,
      height: json['height'] as int?,
      width: json['width'] as int?,
      filePath: json['filePath'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.cast<String>(),
      folder: json['folder'] as String?,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'fileId': fileId,
    'name': name,
    'url': url,
    'thumbnailUrl': thumbnailUrl,
    'size': size,
    'height': height,
    'width': width,
    'filePath': filePath,
    'tags': tags,
    'folder': folder,
  };
}
