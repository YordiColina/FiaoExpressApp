import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FCMService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  /// Obtiene el token FCM y lo actualiza en Firestore
  Future<void> obtenerYActualizarToken(String userId) async {
    try {
      // Obtén el token FCM actual
      String? token = await _firebaseMessaging.getToken();
      if (token != null) {
        print('Token FCM actual: $token');

        // Actualiza el token en Firestore
        await FirebaseFirestore.instance
            .collection('clientes') // Cambia 'usuarios' por el nombre de tu colección
            .doc(userId) // El ID del documento relacionado al usuario
            .set({'tokenFCM': token}, SetOptions(merge: true));
        print('Token FCM actualizado en Firestore.');
      } else {
        print('No se pudo obtener el token FCM.');
      }

      // Escucha cambios en el token (cuando se renueva automáticamente)
      FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
        print('Token FCM renovado: $newToken');
        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(userId)
            .set({'tokenFCM': newToken}, SetOptions(merge: true));
        print('Token FCM renovado y actualizado en Firestore.');
      });
    } catch (e) {
      print('Error al obtener o actualizar el token FCM: $e');
    }
  }
}
