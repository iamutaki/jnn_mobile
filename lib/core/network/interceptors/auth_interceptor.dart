import 'package:dio/dio.dart';

import '../auth_token_storage.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required AuthTokenStorage tokenStorage,
    required String baseUrl,
  }) : _tokenStorage = tokenStorage,
       _refreshDio = Dio(
         BaseOptions(
           baseUrl: baseUrl,
           connectTimeout: const Duration(seconds: 15),
           receiveTimeout: const Duration(seconds: 15),
           sendTimeout: const Duration(seconds: 15),
           responseType: ResponseType.json,
           headers: {
             'Accept': 'application/json',
             'Content-Type': 'application/json',
           },
         ),
       );

  final AuthTokenStorage _tokenStorage;
  final Dio _refreshDio;
  Future<void>? _refreshFuture;

  /// true when the last refresh error was auth-related (expired token, 401, etc.)
  bool _shouldClearTokensOnError = false;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenStorage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    try {
      final refreshed = await _refreshToken();
      if (!refreshed) {
        if (_shouldClearTokensOnError) {
          await _tokenStorage.clearTokens();
        }
        return handler.next(err);
      }

      final token = await _tokenStorage.getAccessToken();
      final opts = err.requestOptions;
      opts.headers['Authorization'] = 'Bearer $token';

      try {
        final response = await _refreshDio.fetch(opts);
        return handler.resolve(response);
      } catch (retryError) {
        return handler.next(retryError is DioException
            ? retryError
            : DioException(requestOptions: opts, error: retryError));
      }
    } catch (_) {
      handler.next(err);
    }
  }

  Future<bool> _refreshToken() async {
    if (_refreshFuture != null) {
      try {
        await _refreshFuture;
        return true;
      } catch (_) {
        return false;
      }
    }

    _shouldClearTokensOnError = false;
    _refreshFuture = _doRefresh();

    try {
      await _refreshFuture;
      return true;
    } catch (_) {
      return false;
    } finally {
      _refreshFuture = null;
    }
  }

  Future<void> _doRefresh() async {
    final refreshToken = await _tokenStorage.getRefreshToken();
    if (refreshToken == null) {
      _shouldClearTokensOnError = true;
      throw const AuthRefreshException();
    }

    try {
      final response = await _refreshDio.post<Map<String, dynamic>>(
        '/v1/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      final raw = response.data;
      if (raw == null) {
        _shouldClearTokensOnError = true;
        throw const AuthRefreshException();
      }

      // Backend wraps the payload in BaseResponse: { success, data: { ... } }
      final nested = raw['data'];
      final payload =
          nested is Map<String, dynamic> ? nested : raw;

      final newAccessToken = payload['accessToken'] as String?;
      final newRefreshToken = payload['refreshToken'] as String?;

      if (newAccessToken == null) {
        _shouldClearTokensOnError = true;
        throw const AuthRefreshException();
      }

      await _tokenStorage.saveTokens(
        accessToken: newAccessToken,
        refreshToken: newRefreshToken ?? refreshToken,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        _shouldClearTokensOnError = true;
        throw const AuthRefreshException();
      }
      rethrow;
    }
  }
}

class AuthRefreshException implements Exception {
  const AuthRefreshException();
}
