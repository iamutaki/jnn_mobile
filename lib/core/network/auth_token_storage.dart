import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthTokenStorage {
  AuthTokenStorage({FlutterSecureStorage? storage, SharedPreferences? prefs})
    : _storage = storage ?? const FlutterSecureStorage(),
      _prefs = prefs;

  static AuthTokenStorage? _instance;

  static AuthTokenStorage get instance =>
      _instance ??= AuthTokenStorage._default();

  AuthTokenStorage._default()
    : _storage = const FlutterSecureStorage(),
      _prefs = null;

  final FlutterSecureStorage _storage;
  final SharedPreferences? _prefs;
  SharedPreferences? _resolvedPrefs;

  static const _accessTokenKey = 'accessToken';
  static const _refreshTokenKey = 'refreshToken';
  static const _isAuthKey = 'isAuth';

  final _authStateController = StreamController<bool>.broadcast();
  Stream<bool> get authStateChanges => _authStateController.stream;

  Future<SharedPreferences> get _sharedPrefs async =>
      _prefs ?? (_resolvedPrefs ??= await SharedPreferences.getInstance());

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _storage.write(key: _accessTokenKey, value: accessToken),
      _storage.write(key: _refreshTokenKey, value: refreshToken),
    ]);
  }

  Future<String?> getAccessToken() async => _storage.read(key: _accessTokenKey);

  Future<String?> getRefreshToken() async =>
      _storage.read(key: _refreshTokenKey);

  Future<void> clearTokens() async {
    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
    ]);
    await setIsAuth(false);
  }

  Future<void> setIsAuth(bool value) async {
    final prefs = await _sharedPrefs;
    await prefs.setBool(_isAuthKey, value);
    _authStateController.add(value);
  }

  Future<bool> getIsAuth() async {
    final prefs = await _sharedPrefs;
    return prefs.getBool(_isAuthKey) ?? false;
  }

  void dispose() {
    _authStateController.close();
  }
}
