import 'dart:convert';
import 'dart:io';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  final _scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

  Future<void> sendNotification({
    required String title,
    required String body,
    required String token,
  }) async {
    // Cargar el archivo de credenciales
    final credentialsFile = File('assets/credentials/fiaoexpressapp-a166b-firebase-adminsdk-58x2q-01704231e5.json');
    final credentials = ServiceAccountCredentials.fromJson(
      jsonDecode(credentialsFile.readAsStringSync()),
    );

    // Autenticación con la cuenta de servicio
    final authClient = await clientViaServiceAccount(credentials, _scopes);

    // URL de la API v1 de FCM
    final url = Uri.parse(
      'https://fcm.googleapis.com/v1/projects/YOUR_PROJECT_ID/messages:send',
    );

    // Construir el mensaje
    final message = {
      'message': {
        'token': token,
        'notification': {
          'title': title,
          'body': body,
        },
      },
    };

    // Enviar la solicitud
    final response = await authClient.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(message),
    );

    // Manejar la respuesta
    if (response.statusCode == 200) {
      print("Notificación enviada exitosamente.");
    } else {
      print("Error al enviar notificación: ${response.body}");
    }
  }
}