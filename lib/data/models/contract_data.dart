class ContractData {
  final String contratoNo;
  final String fechaContrato;
  final String asesor;

  ContractData({required this.contratoNo, required this.fechaContrato, required this.asesor});

  Map<String, dynamic> toMap() {
    return {
      'contratoNo': contratoNo,
      'fechaContrato': fechaContrato,
      'asesor': asesor,
    };
  }
}