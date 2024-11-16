class LatePayment {
  final String diasDeRetraso;
  final String morosidad;


  LatePayment({required this.diasDeRetraso, required this.morosidad});

  Map<String, dynamic> toMap() {
    return {
      'díasDeRetraso': diasDeRetraso,
      'morosidad': morosidad,
    };
  }
}