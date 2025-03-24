class DataClient {
  final String nombre;
  final String cedula;
  final String telefono;
  final String ubicacion;
  final String direccion;

  DataClient({
    required this.nombre,
    required this.cedula,
    required this.telefono,
    required this.ubicacion,
    required this.direccion,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'cédula': cedula,
      'teléfono': telefono,
      'ubicación': ubicacion,
      'dirección': direccion,
    };
  }
}