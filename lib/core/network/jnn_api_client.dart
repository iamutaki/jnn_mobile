import 'package:dio/dio.dart';

import '../../shared/dev_tool/network_monitor/network_monitor_registry.dart';
import '../constants/env.dart';
import 'auth_token_storage.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/network_monitor_interceptor.dart';

class JnnApiClient {
  JnnApiClient._({required this.dio});

  factory JnnApiClient.create({
    String? baseUrl,
    AuthTokenStorage? tokenStorage,
    Iterable<Interceptor> interceptors = const <Interceptor>[],
  }) {
    final resolvedBaseUrl = baseUrl ?? Env.jnnApiHost;
    final resolvedTokenStorage = tokenStorage ?? AuthTokenStorage.instance;

    final dio = Dio(
      BaseOptions(
        baseUrl: resolvedBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        responseType: ResponseType.json,
        headers: const <String, Object?>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      NetworkMonitorInterceptor(repository: NetworkMonitorRegistry.repository),
    );
    dio.interceptors.add(
      AuthInterceptor(
        tokenStorage: resolvedTokenStorage,
        baseUrl: resolvedBaseUrl,
      ),
    );
    dio.interceptors.addAll(interceptors);

    return JnnApiClient._(dio: dio);
  }

  static final JnnApiClient instance = JnnApiClient.create();

  final Dio dio;

  T createDataSource<T>(T Function(Dio dio) builder) => builder(dio);
}
