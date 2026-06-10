import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../../shared/dev_tool/network_monitor/network_monitor_registry.dart';
import '../constants/env.dart';
import 'interceptors/network_monitor_interceptor.dart';
import 'models/imagekit_upload_response.dart';

class ImagekitApiClient {
  ImagekitApiClient._({required this.dio});

  factory ImagekitApiClient.create({
    Iterable<Interceptor> interceptors = const <Interceptor>[],
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://upload.imagekit.io/api/v1',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(
      NetworkMonitorInterceptor(repository: NetworkMonitorRegistry.repository),
    );
    dio.interceptors.addAll(interceptors);

    return ImagekitApiClient._(dio: dio);
  }

  static final ImagekitApiClient instance = ImagekitApiClient.create();

  final Dio dio;

  Future<ImagekitUploadResponse> uploadImage({
    required File file,
    String? fileName,
    String? folder,
    List<String>? tags,
  }) async {
    final name = fileName ?? '${const Uuid().v4()}.jpg';

    final formData = FormData()
      ..files.add(MapEntry(
        'file',
        await MultipartFile.fromFile(file.path, filename: name),
      ))
      ..fields.add(MapEntry('fileName', name))
      ..fields.add(MapEntry('useUniqueFileName', 'true'));

    if (folder != null && folder.isNotEmpty) {
      formData.fields.add(MapEntry('folder', folder));
    }

    if (tags != null && tags.isNotEmpty) {
      formData.fields.add(MapEntry('tags', tags.join(',')));
    }

    final response = await dio.post(
      '/files/upload',
      data: formData,
      options: Options(
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('${Env.imagekitPrivateKey}:'))}',
        },
      ),
    );

    final data = response.data;
    if (data is! Map<String, dynamic>) {
      throw Exception(
        'Unexpected response type: ${data.runtimeType}, body: $data',
      );
    }

    try {
      return ImagekitUploadResponse.fromJson(data);
    } catch (e) {
      throw Exception('Failed to parse ImageKit response: $e, data: $data');
    }
  }
}
