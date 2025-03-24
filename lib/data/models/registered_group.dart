class RegisteredGroup {
  final String plan;
  final String grupo;
  final String nroDeLista;
  final String posicionEnLaLista;
  final String modeloDeMoto;
  final String marcaDeMoto;
  final String valorDeCuotaMensualEnDolares;
  final String nroDeCuotasTotales;

  RegisteredGroup({
    required this.plan,
    required this.grupo,
    required this.nroDeLista,
    required this.posicionEnLaLista,
    required this.modeloDeMoto,
    required this.marcaDeMoto,
    required this.valorDeCuotaMensualEnDolares,
    required this.nroDeCuotasTotales,
  });

  Map<String, dynamic> toMap() {
    return {
      'plan': plan,
      'grupo': grupo,
      'nro_de_lista': nroDeLista,
      'posicion_en_la_lista': posicionEnLaLista,
      'modelo_de_moto': modeloDeMoto,
      'marca_de_moto' : marcaDeMoto,
      'valor_cuota_mensual_en_dolares' : valorDeCuotaMensualEnDolares,
      'nro_de_cuotas_totales' : nroDeCuotasTotales
    };
  }
}