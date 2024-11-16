class FiaoExpressStatus {
  final String estatus;


  FiaoExpressStatus({required this.estatus});

  Map<String, dynamic> toMap() {
    return {
      'estatus': estatus,
    };
  }
}