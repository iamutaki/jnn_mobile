import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../../features/device/domain/repositories/device_repository.dart';
import '../network/auth_token_storage.dart';
import 'device_id_service.dart';

class DeviceRegistrationService {
  DeviceRegistrationService({
    required DeviceRepository repository,
    required AuthTokenStorage tokenStorage,
    required DeviceIdService deviceIdService,
    required String initialFcmToken,
  }) : _repository = repository,
       _tokenStorage = tokenStorage,
       _deviceIdService = deviceIdService,
       _lastFcmToken = initialFcmToken;

  final DeviceRepository _repository;
  final AuthTokenStorage _tokenStorage;
  final DeviceIdService _deviceIdService;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  String _lastFcmToken;
  StreamSubscription<bool>? _authSub;
  StreamSubscription<String>? _fcmSub;

  Future<void> start() async {
    final isAuth = await _tokenStorage.getIsAuth();
    if (isAuth) {
      await _register();
    }

    _authSub = _tokenStorage.authStateChanges.listen((isAuth) {
      if (isAuth) _register();
    });

    _fcmSub = _messaging.onTokenRefresh.listen((newToken) {
      _lastFcmToken = newToken;
      _registerIfAuth();
    });
  }

  Future<void> _registerIfAuth() async {
    final isAuth = await _tokenStorage.getIsAuth();
    if (isAuth) await _register();
  }

  Future<void> _register() async {
    try {
      final udid = await _deviceIdService.getDeviceId();
      await _repository.registerDevice(udid: udid, fcmToken: _lastFcmToken);
    } catch (_) {}
  }

  void dispose() {
    _authSub?.cancel();
    _fcmSub?.cancel();
  }
}
