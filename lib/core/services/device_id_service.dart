import 'package:flutter_udid/flutter_udid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class DeviceIdService {
  DeviceIdService({SharedPreferences? prefs}) : _prefs = prefs;

  final SharedPreferences? _prefs;
  SharedPreferences? _resolvedPrefs;

  static const _deviceIdKey = 'deviceId';

  Future<SharedPreferences> get _sharedPrefs async =>
      _prefs ?? (_resolvedPrefs ??= await SharedPreferences.getInstance());

  Future<String> getDeviceId() async {
    final prefs = await _sharedPrefs;
    final existing = prefs.getString(_deviceIdKey);
    if (existing != null && existing.isNotEmpty) return existing;

    final deviceId = await _resolveDeviceId();
    await prefs.setString(_deviceIdKey, deviceId);
    return deviceId;
  }

  Future<String> _resolveDeviceId() async {
    try {
      return await FlutterUdid.udid;
    } catch (_) {}

    return const Uuid().v4();
  }
}
