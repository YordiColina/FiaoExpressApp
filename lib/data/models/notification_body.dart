class NotificationData {
  final String title;
  final String body;
  final String data;


  NotificationData({
    required this.title,
    required this.body,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombre': title,
      'cédula': body,
      'correo': data,
    };
  }
}