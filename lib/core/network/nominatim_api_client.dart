import 'package:dio/dio.dart';

import '../../shared/dev_tool/network_monitor/network_monitor_registry.dart';
import 'interceptors/network_monitor_interceptor.dart';
import 'models/nominatim_search_result.dart';

class NominatimApiClient {
  NominatimApiClient._({required this.dio});

  factory NominatimApiClient.create({
    Iterable<Interceptor> interceptors = const <Interceptor>[],
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://nominatim.openstreetmap.org',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        responseType: ResponseType.json,
        headers: const <String, Object?>{
          'Accept': 'application/json',
          'Accept-Language': 'id',
          'User-Agent': 'JNNMobile/0.0.12',
        },
      ),
    );

    dio.interceptors.add(
      NetworkMonitorInterceptor(repository: NetworkMonitorRegistry.repository),
    );
    dio.interceptors.addAll(interceptors);

    return NominatimApiClient._(dio: dio);
  }

  static final NominatimApiClient instance = NominatimApiClient.create();

  final Dio dio;

  Future<List<NominatimSearchResult>> search(String query) async {
    final response = await dio.get(
      '/search',
      queryParameters: <String, dynamic>{
        'q': query,
        'format': 'json',
        'limit': 10,
        'countrycodes': 'id',
      },
    );

    final data = response.data;
    if (data is! List) {
      return [];
    }

    return data
        .cast<Map<String, dynamic>>()
        .map(NominatimSearchResult.fromJson)
        .toList();
  }
}
