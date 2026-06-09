import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_token_storage.dart';
import 'jnn_api_client.dart';

part 'network_providers.g.dart';

@riverpod
JnnApiClient jnnApiClient(Ref ref) => JnnApiClient.instance;

@riverpod
Dio dio(Ref ref) => ref.watch(jnnApiClientProvider).dio;

@riverpod
AuthTokenStorage authTokenStorage(Ref ref) => AuthTokenStorage.instance;
