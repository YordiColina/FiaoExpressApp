import 'package:cloud_firestore/cloud_firestore.dart';

class TokenService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Obtiene todos los tokens FCM de la colección `clientes`.
  Future<List<Map<String, dynamic>>> getAllTokens() async {
    try {
      final querySnapshot = await _firestore.collection('clientes').get();

      return querySnapshot.docs.map((doc) {
        print(" este es el token papu  :  = ${doc.get("tokenFCM")} xdddd");
        return {
          'id': doc.id,
          'fcm': doc.get("tokenFCM") ?? '',
        };
      }).where((client) => client['fcm'].isNotEmpty).toList();
    } catch (e) {
      print('Error al obtener los tokens: $e');
      return [];
    }
  }

  /// Obtiene el token FCM de un cliente específico por su ID.
  Future<Map<String, dynamic>?> getTokenById(String documentId) async {
    try {
      final documentSnapshot =
      await _firestore.collection('clientes').doc(documentId).get();

      if (documentSnapshot.exists) {
        return {
          'id': documentSnapshot.id,
          'name': documentSnapshot.data()?['name'] ?? 'Sin Nombre',
          'fcm': documentSnapshot.data()?['fcm'] ?? '',
        };
      } else {
        print('El cliente con ID $documentId no existe.');
        return null;
      }
    } catch (e) {
      print('Error al obtener el token del cliente: $e');
      return null;
    }
  }
}
