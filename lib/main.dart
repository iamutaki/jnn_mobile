import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/services/device_id_service.dart';
import 'core/services/notification_service.dart';
import 'core/network/jnn_api_client.dart';
import 'flavors.dart';

// Handler untuk background message (harus top-level function)
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('Background message: ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init Firebase
  await Firebase.initializeApp();
  debugPrint('Firebase initialized');

  // Setup Firebase Messaging
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Request notification permission
  await FirebaseMessaging.instance.requestPermission();

  // Init local notifications (untuk foreground notif)
  await NotificationService.init();

  // Get FCM token
  final token = await FirebaseMessaging.instance.getToken();
  debugPrint('FCM Token: $token');

  // Setup flavor
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  JnnApiClient.instance;

  // Init device ID (ambil dari UDID atau fallback UUID)
  await DeviceIdService().getDeviceId();

  runApp(const ProviderScope(child: App()));
}
