String _forceString(dynamic v) {
  if (v == null) return '';
  if (v is num) return v.toString();
  return v as String;
}

bool _forceBool(dynamic v) {
  if (v is bool) return v;
  if (v is num) return v != 0;
  return false;
}

int _forceInt(dynamic v) {
  if (v is int) return v;
  if (v is double) return v.toInt();
  if (v is String) return int.tryParse(v) ?? 0;
  return 0;
}

Map<String, dynamic>? _forceMap(dynamic v) {
  if (v is Map<String, dynamic>) return v;
  if (v is Map) return v.cast<String, dynamic>();
  return null;
}

class ImgbbUploadImage {
  final String filename;
  final String name;
  final String mime;
  final String extension;
  final String url;

  const ImgbbUploadImage({
    required this.filename,
    required this.name,
    required this.mime,
    required this.extension,
    required this.url,
  });

  factory ImgbbUploadImage.fromJson(Map<String, dynamic> json) {
    return ImgbbUploadImage(
      filename: _forceString(json['filename']),
      name: _forceString(json['name']),
      mime: _forceString(json['mime']),
      extension: _forceString(json['extension']),
      url: _forceString(json['url']),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'filename': filename,
    'name': name,
    'mime': mime,
    'extension': extension,
    'url': url,
  };
}

class ImgbbUploadData {
  final String id;
  final String title;
  final String urlViewer;
  final String url;
  final String displayUrl;
  final String width;
  final String height;
  final String size;
  final String time;
  final String expiration;
  final ImgbbUploadImage? image;
  final ImgbbUploadImage? thumb;
  final ImgbbUploadImage? medium;
  final String deleteUrl;

  const ImgbbUploadData({
    required this.id,
    required this.title,
    required this.urlViewer,
    required this.url,
    required this.displayUrl,
    required this.width,
    required this.height,
    required this.size,
    required this.time,
    required this.expiration,
    this.image,
    this.thumb,
    this.medium,
    required this.deleteUrl,
  });

  factory ImgbbUploadData.fromJson(Map<String, dynamic> json) {
    ImgbbUploadImage? parseImage(dynamic v) {
      final map = _forceMap(v);
      return map != null ? ImgbbUploadImage.fromJson(map) : null;
    }

    return ImgbbUploadData(
      id: _forceString(json['id']),
      title: _forceString(json['title']),
      urlViewer: _forceString(json['url_viewer']),
      url: _forceString(json['url']),
      displayUrl: _forceString(json['display_url']),
      width: _forceString(json['width']),
      height: _forceString(json['height']),
      size: _forceString(json['size']),
      time: _forceString(json['time']),
      expiration: _forceString(json['expiration']),
      image: parseImage(json['image']),
      thumb: parseImage(json['thumb']),
      medium: parseImage(json['medium']),
      deleteUrl: _forceString(json['delete_url']),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'title': title,
    'url_viewer': urlViewer,
    'url': url,
    'display_url': displayUrl,
    'width': width,
    'height': height,
    'size': size,
    'time': time,
    'expiration': expiration,
    'image': image?.toJson(),
    'thumb': thumb?.toJson(),
    'medium': medium?.toJson(),
    'delete_url': deleteUrl,
  };
}

class ImgbbUploadResponse {
  final ImgbbUploadData data;
  final bool success;
  final int status;

  const ImgbbUploadResponse({
    required this.data,
    required this.success,
    required this.status,
  });

  factory ImgbbUploadResponse.fromJson(Map<String, dynamic> json) {
    return ImgbbUploadResponse(
      data: ImgbbUploadData.fromJson(_forceMap(json['data']) ?? {}),
      success: _forceBool(json['success']),
      status: _forceInt(json['status']),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'data': data.toJson(),
    'success': success,
    'status': status,
  };
}
