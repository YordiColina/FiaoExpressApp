import 'package:flutter/material.dart';


import '../data/service/token_service.dart';
import '../utils/firebase_service.dart';


class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final TokenService _tokenService = TokenService();
  final NotificationService _notificationService = NotificationService();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  List<Map<String, dynamic>> _clients = [];
  bool _loading = false;

  Future<void> _loadClients() async {
    setState(() => _loading = true);
    final clients = await _tokenService.getAllTokens();
    setState(() {
      _clients = clients;
      _loading = false;
    });
  }

  Future<void> _sendNotificationToClient(String token) async {
    if (_titleController.text.isEmpty || _bodyController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingresa un título y un mensaje.')),
      );
      return;
    }

    try {
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al enviar la notificación: $e')),
      );
      print(e);
    }
  }

  Future<void> _sendNotificationToAll() async {
    if (_titleController.text.isEmpty || _bodyController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingresa un título y un mensaje.')),
      );
      return;
    }

    for (final client in _clients) {
      await _sendNotificationToClient(client['fcm']);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Notificaciones enviadas a todos los clientes.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Enviar Notificaciones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                fontFamily: 'Dorgan',
                fontStyle: FontStyle.italic,
              ),
              decoration: InputDecoration(labelText: 'Título',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(20)
                ) ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _bodyController,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                fontFamily: 'Dorgan',
                fontStyle: FontStyle.italic,
              ),
              decoration: InputDecoration(labelText: 'Mensaje',
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(20)
            )
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.black)
              ),
              onPressed: _loadClients,
              child: const Text('Cargar Clientes', style: TextStyle(
                color: Colors.black,
                fontFamily: 'Dorgan',
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w800,
              ),),
            ),
            _loading
                ? const CircularProgressIndicator()
                : Expanded(
              child: ListView.builder(
                itemCount: _clients.length,
                itemBuilder: (context, index) {
                  final client = _clients[index];
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: ListTile(
                          title: Text(client['nombre'], style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Dorgan',
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ),),
                          subtitle: Text('cédula: ${client['id']}',style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Dorgan',
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ),),
                          trailing: IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () =>
                                _sendNotificationToClient(client['fcm']),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  side: const BorderSide(color: Colors.white)
              ),
              onPressed: _sendNotificationToAll,
              child: const Text('Enviar a Todos', style:  TextStyle(
                color: Colors.white,
                fontFamily: 'Dorgan',
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w800,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
