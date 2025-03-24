import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  final StreamController<RemoteMessage> _notificationStreamController =
  StreamController.broadcast();

  Stream<RemoteMessage> get notificationStream =>
      _notificationStreamController.stream;

  /// 🔹 Inicializa las notificaciones de Firebase y Local Notifications
  void initializeNotifications() async {
    // 🔸 Solicitar permisos para recibir notificaciones
    NotificationSettings settings = await _messaging.requestPermission();

    // 🔸 Inicializar configuración para notificaciones locales
    const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
    InitializationSettings(android: androidInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print("🔔 Notificación tocada: ${response.payload}");
        // Aquí puedes manejar la navegación dentro de la app si es necesario
      },
    );

    // 📌 Manejar mensajes en segundo plano
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        _handleMessage(message);
      }
    });

    // 📌 Manejar mensajes en primer plano
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("📩 Notificación recibida en primer plano: ${message.notification?.title}");
      _handleMessage(message);
    });

    // 📌 Manejar cuando se abre la app desde una notificación
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleMessage(message);
    });
  }

  /// 🔹 Manejar el mensaje y mostrar la notificación local
  void _handleMessage(RemoteMessage message) {
    _notificationStreamController.add(message);
    _showNotification(message);
  }

  /// 🔹 Mostrar notificación localmente en el dispositivo
  void _showNotification(RemoteMessage message) async {
    var androidDetails = const AndroidNotificationDetails(
      'channel_id', // Debe ser el mismo ID usado en el `AndroidNotificationChannel`
      'channel_name',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
    );

    var generalNotificationDetails =
    NotificationDetails(android: androidDetails);

    await _flutterLocalNotificationsPlugin.show(
      message.messageId.hashCode, // Para evitar mensajes duplicados
      message.notification?.title ?? "Sin título",
      message.notification?.body ?? "Sin contenido",
      generalNotificationDetails,
    );
  }

  void dispose() {
    _notificationStreamController.close();
  }
}
