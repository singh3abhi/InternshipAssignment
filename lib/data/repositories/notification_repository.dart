import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:internship_assignment/presentation/screens/NotificationScreen/notification_screen.dart';
import 'package:page_transition/page_transition.dart';

// Get token for sending the push notification to the respective device
class NotificationServices {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      if (kDebugMode) print('User Granted Provisional Permission');
    } else {
      if (kDebugMode) print('User Denied Permission');
    }
  }

  void initLocalNotification(BuildContext context, RemoteMessage message) async {
    var androidInitalization = const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettings = InitializationSettings(android: androidInitalization);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        handleMessage(context, message);
      },
    );
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
        print(message.data.toString());
        print(message.data['type']);
        print(message.data['id']);
      }

      if (Platform.isAndroid) {
        initLocalNotification(context, message);
        showNotification(message);
      }
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      1.toString(),
      'High Importance Notification',
      importance: Importance.max,
    );

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: 'Your channel description',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    Future.delayed(Duration.zero, () {
      flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
      );
    });
  }

  Future<String> getDeviceToken() async {
    String? token = await firebaseMessaging.getToken();
    return token!;
  }

  void isTokenReferesh() async {
    firebaseMessaging.onTokenRefresh.listen((event) {
      event.toString();
      // Need to handle when token refresh
    });
  }

  Future<void> setupInteractMessage(BuildContext context) async {
    // Terminated State
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      if (context.mounted) handleMessage(context, initialMessage);
    }

    // Background State
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    if (message.data['type'] == 'Notification') {
      // Navigator.pushNamed(context, NotificationScreen.routeName);
      Navigator.push(context, PageTransition(child: const NotificationScreen(), type: PageTransitionType.theme));
    }
  }
}
