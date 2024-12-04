import 'package:flutter/material.dart';

import '../data/service/notification_service.dart';
import '../data/service/token_service.dart';


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
      await _notificationService.sendNotification(
        title: _titleController.text,
        body: _bodyController.text,
        token: token,
        imageUrl: "https://drive.google.com/uc?id=1DXcehHaQWwxzmHKiWhbrQwBDiuEdLcVU"
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notificación enviada.')),
      );
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
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(labelText: 'Mensaje'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadClients,
              child: const Text('Cargar Clientes'),
            ),
            _loading
                ? const CircularProgressIndicator()
                : Expanded(
              child: ListView.builder(
                itemCount: _clients.length,
                itemBuilder: (context, index) {
                  final client = _clients[index];
                  return ListTile(
                    title: Text(client['nombre']),
                    subtitle: Text('cédula: ${client['id']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () =>
                          _sendNotificationToClient(client['fcm']),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _sendNotificationToAll,
              child: const Text('Enviar a Todos'),
            ),
          ],
        ),
      ),
    );
  }
}
