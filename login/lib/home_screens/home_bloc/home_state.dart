part of 'home_bloc.dart';


class HomeState extends Equatable {
  final ContractData? datosContrato;
  final DataClient? datosCliente;
  final RegisteredGroup? grupoInscrito;
  final LatePayment? pagoMoroso;
  final PaymentsMade? pagosRealizados;
  final FiaoExpressStatus? fiaoEstatus;
  final MotorcycleDeliveryData? datosEntregaMoto;
  final List<TextEditingController>? fieldsController;
  final List<TextEditingController>? productTwoData;
  final List<TextEditingController>? productThreeData;
  final bool? status ;


  HomeState({
    this.datosContrato,
    this.datosCliente,
    this.grupoInscrito,
    this.pagosRealizados,
    this.pagoMoroso,
    this.fiaoEstatus,
    this.datosEntregaMoto,
    this.fieldsController,
    this.productTwoData,
    this.productThreeData,
    this.status
  });

  HomeState copyWith({
    ContractData? datosContrato,
    DataClient? datosCliente,
    RegisteredGroup? grupoInscrito,
    LatePayment? pagoMoroso,
    PaymentsMade? pagosRealizados,
    FiaoExpressStatus? fiaoEstatus,
    MotorcycleDeliveryData? datosEntregaMoto,
    List<TextEditingController>? fieldsController,
    List<TextEditingController>? productTwoData,
    List<TextEditingController>? productThreeData,
    bool? status
  }) {
    return HomeState(
        datosContrato: datosContrato ?? this.datosContrato,
        datosCliente: datosCliente ?? this.datosCliente,
        grupoInscrito: grupoInscrito ?? this.grupoInscrito,
        pagoMoroso: pagoMoroso ?? this.pagoMoroso,
        pagosRealizados: pagosRealizados ?? this.pagosRealizados,
        fiaoEstatus: fiaoEstatus ?? this.fiaoEstatus,
        datosEntregaMoto: datosEntregaMoto ?? this.datosEntregaMoto,
        fieldsController: fieldsController ?? this.fieldsController,
        productTwoData: productTwoData ?? this.productTwoData,
        productThreeData: productThreeData ?? this.productThreeData,
        status: status ?? this.status
    );
  }
  @override
  List<Object?> get props => [datosContrato,datosCliente,grupoInscrito,pagoMoroso,pagosRealizados,
    fiaoEstatus,datosEntregaMoto,fieldsController,productTwoData,productThreeData,status];


  Map<String, dynamic> toMap() {
    return {
      'datosContrato': datosContrato?.toMap(),
      'datosCliente': datosCliente?.toMap(),
      'grupo_inscrito': grupoInscrito?.toMap(),
      'pago_de_morosidad': pagoMoroso?.toMap(),
      'pagos_realizados': pagosRealizados?.toMap(),
      'estatus_en_fiaoExpress': fiaoEstatus?.toMap(),
      'datos_de_entrega_de_la_moto': datosEntregaMoto?.toMap()
      // Convierte otras propiedades a mapas...
    };
  }
}

