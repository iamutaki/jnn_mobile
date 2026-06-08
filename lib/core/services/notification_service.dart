import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Service untuk menampilkan notifikasi (foreground & background).
/// Saat app di foreground, FCM tidak otomatis tampilkan notifikasi.
/// Service ini menggunakan flutter_local_notifications untuk menampilkan
/// local notification saat foreground message diterima.
class NotificationService {
  NotificationService._();

  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  /// Android notification channel untuk foreground notif.
  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'jnn_notifications',
    'JNN Notifications',
    description: 'Notifikasi dari JNN Mobile',
    importance: Importance.high,
  );

  /// Initialize notification service.
  /// Panggil setelah Firebase.initializeApp().
  static Future<void> init() async {
    // Setup local notifications
    const androidSettings = AndroidInitializationSettings(
      '@drawable/ic_notification',
    );
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: (response) {
        debugPrint('📬 Notification tapped: ${response.payload}');
        // TODO: Navigate ke halaman terkait berdasarkan payload
      },
    );

    // Buat Android notification channel (Android 8.0+)
    if (Platform.isAndroid) {
      await _localNotifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(_channel);
    }

    // Request iOS permission
    if (Platform.isIOS) {
      await _localNotifications
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    }

    // Listen foreground messages
    FirebaseMessaging.onMessage.listen(_showForegroundNotification);

    debugPrint('📬 NotificationService initialized');
  }

  /// Tampilkan local notification saat foreground message diterima.
  static void _showForegroundNotification(RemoteMessage message) {
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification == null) return;

    _localNotifications.show(
      id: message.hashCode,
      title: notification.title,
      body: notification.body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          icon: android?.smallIcon ?? '@drawable/ic_notification',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: message.data.toString(),
    );
  }
}
