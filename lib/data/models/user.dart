class UserData {
  final String nombre;
  final String cedula;
  final String correo;
  final String telefono;


  UserData({
    required this.nombre,
    required this.cedula,
    required this.correo,
    required this.telefono,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'cédula': cedula,
      'correo': correo,
      'telefono': telefono,
    };
  }
}