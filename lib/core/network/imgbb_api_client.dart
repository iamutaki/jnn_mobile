import 'dart:io';

import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../../shared/dev_tool/network_monitor/network_monitor_registry.dart';
import '../constants/env.dart';
import 'interceptors/network_monitor_interceptor.dart';
import 'models/imgbb_upload_response.dart';

class ImgbbApiClient {
  ImgbbApiClient._({required this.dio});

  factory ImgbbApiClient.create({
    Iterable<Interceptor> interceptors = const <Interceptor>[],
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.imgbb.com/1',
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

    return ImgbbApiClient._(dio: dio);
  }

  static final ImgbbApiClient instance = ImgbbApiClient.create();

  final Dio dio;

  Future<ImgbbUploadResponse> uploadImage({required File file}) async {
    final formData = FormData()
      ..fields.add(MapEntry('key', Env.imgbbApiKey))
      ..files.add(MapEntry(
        'image',
        await MultipartFile.fromFile(file.path, filename: '${Uuid().v4()}.jpg'),
      ));

    final response = await dio.post(
      '/upload',
      data: formData,
    );

    final data = response.data;
    if (data is! Map<String, dynamic>) {
      throw Exception('Unexpected response type: ${data.runtimeType}, body: $data');
    }

    try {
      return ImgbbUploadResponse.fromJson(data);
    } catch (e) {
      throw Exception('Failed to parse ImgBB response: $e, data: $data');
    }
  }
}
