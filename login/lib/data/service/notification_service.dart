import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  final List<String> _scopes = [
    'https://www.googleapis.com/auth/firebase.messaging'
  ];

  Future<void> sendNotification({
    required String title,
    required String body,
    required String token,
    required String imageUrl
  }) async {
    try {
      // Cargar el archivo de credenciales desde los assets
      final String credentialsString = await rootBundle.loadString(
        'assets/credentials/fiaoexpressapp-a166b-firebase-adminsdk-58x2q-01704231e5.json',
      );
      final credentials = ServiceAccountCredentials.fromJson(
        jsonDecode(credentialsString),
      );

      // Autenticación con la cuenta de servicio
      final authClient = await clientViaServiceAccount(credentials, _scopes);

      // URL de la API v1 de FCM
      final url = Uri.parse(
        'https://fcm.googleapis.com/v1/projects/fiaoexpressapp-a166b/messages:send',
      );

      // Construir el mensaje
      final message = {
        'message': {
          'token': token,
          'notification': {
            'title': title,
            'body': body,
            'image': imageUrl,
          },
        },
      };

      // Enviar la solicitud
      final response = await authClient.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(message),
      );

      // Verificar la respuesta
      if (response.statusCode == 200) {
        print('Notificación enviada exitosamente');
      } else {
        print('Error al enviar notificación: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}