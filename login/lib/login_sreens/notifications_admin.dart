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
        SnackBar(content: Text('Por favor, ingresa un título y un mensaje.')),
      );
      return;
    }

    try {
      await _notificationService.sendNotification(
        title: _titleController.text,
        body: _bodyController.text,
        token: token,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Notificación enviada.')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al enviar la notificación: $e')),
      );
    }
  }

  Future<void> _sendNotificationToAll() async {
    if (_titleController.text.isEmpty || _bodyController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa un título y un mensaje.')),
      );
      return;
    }

    for (final client in _clients) {
      await _sendNotificationToClient(client['fcm']);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Notificaciones enviadas a todos los clientes.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enviar Notificaciones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _bodyController,
              decoration: InputDecoration(labelText: 'Mensaje'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadClients,
              child: Text('Cargar Clientes'),
            ),
            _loading
                ? CircularProgressIndicator()
                : Expanded(
              child: ListView.builder(
                itemCount: _clients.length,
                itemBuilder: (context, index) {
                  final client = _clients[index];
                  return ListTile(
                    title: Text(client['nombre']),
                    subtitle: Text('cédula: ${client['id']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () =>
                          _sendNotificationToClient(client['fcm']),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _sendNotificationToAll,
              child: Text('Enviar a Todos'),
            ),
          ],
        ),
      ),
    );
  }
}
