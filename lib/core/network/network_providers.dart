import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_token_storage.dart';
import 'imgbb_api_client.dart';
import 'jnn_api_client.dart';

part 'network_providers.g.dart';

@Riverpod(keepAlive: true)
JnnApiClient jnnApiClient(Ref ref) => JnnApiClient.instance;

@Riverpod(keepAlive: true)
Dio dio(Ref ref) => ref.watch(jnnApiClientProvider).dio;

@Riverpod(keepAlive: true)
AuthTokenStorage authTokenStorage(Ref ref) => AuthTokenStorage.instance;

@Riverpod(keepAlive: true)
ImgbbApiClient imgbbApiClient(Ref ref) => ImgbbApiClient.instance;

@Riverpod(keepAlive: true)
Dio imgbbDio(Ref ref) => ref.watch(imgbbApiClientProvider).dio;
