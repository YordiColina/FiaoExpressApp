class PaymentsMade {
  final String cuotaInicial;
  final String gastosADM;
  final String nroDeCuotasCanceladas;
  final String nroDeCuotasRestantes;
  final String proximaFechaDePago;

  PaymentsMade({
    required this.cuotaInicial,
    required this.gastosADM,
    required this.nroDeCuotasCanceladas,
    required this.nroDeCuotasRestantes,
    required this.proximaFechaDePago,
  });

  Map<String, dynamic> toMap() {
    return {
      'cuotaInicial': cuotaInicial,
      'gastosADM': gastosADM,
      'nro_de_cuotas_canceladas': nroDeCuotasCanceladas,
      'nro_de_cuotas_restantes': nroDeCuotasRestantes,
      'proxima_fecha_de_pago': proximaFechaDePago,
    };
  }
}