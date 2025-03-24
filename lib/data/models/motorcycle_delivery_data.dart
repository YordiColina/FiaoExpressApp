class MotorcycleDeliveryData {
  final String fechaDeEntrega;
  final String color;
  final String serialMotor;
  final String serialCarroceria;
  final String placa;
  final String observacion;

  MotorcycleDeliveryData({
    required this.fechaDeEntrega,
    required this.color,
    required this.serialMotor,
    required this.serialCarroceria,
    required this.placa,
    required this.observacion,
  });

  Map<String, dynamic> toMap() {
    return {
      'fecha_de_entrega': fechaDeEntrega,
      'color': color,
      'serialMotor': serialMotor,
      'serialCarroceria': serialCarroceria,
      'placa': placa,
      'observacion': observacion,
    };
  }
}