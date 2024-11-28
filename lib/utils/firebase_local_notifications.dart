import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotifications {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    // Configuración del canal de notificaciones
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'default_channel', // ID del canal
      'Notificaciones',  // Nombre del canal
      description: 'Canal para mostrar notificaciones importantes', // Descripción
      importance: Importance.high,
    );

    // Inicializar el plugin de notificaciones locales
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    await _localNotificationsPlugin.initialize(initializationSettings);

    // Crear el canal en Android
    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // Registrar el manejador de mensajes en segundo plano
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // Obtener el token de Firebase
    String? token = await _messaging.getToken();
    print("FCM Token: $token");

    // Manejar mensajes en primer plano
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        _showNotification(
          title: message.notification!.title,
          body: message.notification!.body,
        );
      }
    });
  }

  // Mostrar la notificación local
  Future<void> _showNotification({String? title, String? body}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'default_channel', // ID del canal
      'Notificaciones',  // Nombre del canal
      importance: Importance.high,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await _localNotificationsPlugin.show(
      0, // ID de la notificación
      title,
      body,
      platformChannelSpecifics,
    );
  }
}

// Manejador de mensajes en segundo plano, fuera de la clase
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Mensaje en segundo plano recibido: ${message.notification?.title}");
}
