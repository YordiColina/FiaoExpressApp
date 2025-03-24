class UserData {
  final String nombre;
  final String cedula;
  final String correo;


  UserData({
    required this.nombre,
    required this.cedula,
    required this.correo,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'cédula': cedula,
      'correo': correo,
    };
  }
}