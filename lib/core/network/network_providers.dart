import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_token_storage.dart';
import 'imagekit_api_client.dart';
import 'imgbb_api_client.dart';
import 'jnn_api_client.dart';
import 'nominatim_api_client.dart';

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

@Riverpod(keepAlive: true)
ImagekitApiClient imagekitApiClient(Ref ref) => ImagekitApiClient.instance;

@Riverpod(keepAlive: true)
Dio imagekitDio(Ref ref) => ref.watch(imagekitApiClientProvider).dio;

@Riverpod(keepAlive: true)
NominatimApiClient nominatimApiClient(Ref ref) => NominatimApiClient.instance;

@Riverpod(keepAlive: true)
Dio nominatimDio(Ref ref) => ref.watch(nominatimApiClientProvider).dio;
