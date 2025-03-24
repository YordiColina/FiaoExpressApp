import 'package:cloud_firestore/cloud_firestore.dart';

class TokenService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Obtiene todos los tokens FCM de la colección `clientes`.
  Future<List<Map<String, dynamic>>> getAllTokens() async {
    try {
      final querySnapshot = await _firestore.collection('clientes').get();

      List<Map<String, dynamic>> tokenData = querySnapshot.docs.map((doc) {
        final data = doc.data(); // Obtiene los datos del documento
        final tokenFCM = data.containsKey('tokenFCM') ? data['tokenFCM'] : null;
        print(data['datosCliente']['nombre']);
        if (tokenFCM != null) {
          print("Este es el token papu: $tokenFCM xdddd");
        } else {
          print("El documento con ID ${doc.id} no contiene el campo tokenFCM.");
        }
        return {
          'id': doc.id,
          'nombre' : data['datosCliente']['nombre'],
          'fcm': tokenFCM ?? '', // Retorna una cadena vacía si no existe
        };
      }).where((client) => client['fcm'].isNotEmpty).toList();

      print(tokenData);


      return tokenData;

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
          'name': documentSnapshot.data()?['nombre'] ?? 'Sin Nombre',
          'fcm': documentSnapshot.data()?['tokenFCM'] ?? '',
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
