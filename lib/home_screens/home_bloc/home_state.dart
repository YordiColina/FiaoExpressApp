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
  final List<TextEditingController>? userDataController;
  final List<TextEditingController>? productTwoData;
  final List<TextEditingController>? productThreeData;
  final bool? status ;
  List<NotificationData>? notificationsData;
  final bool? notificationStatus;


  HomeState( {
    this.notificationsData,
    this.notificationStatus = false,
    this.datosContrato,
    this.datosCliente,
    this.grupoInscrito,
    this.pagosRealizados,
    this.pagoMoroso,
    this.fiaoEstatus,
    this.datosEntregaMoto,
    this.fieldsController,
    this.userDataController,
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
    List<TextEditingController>? userDataController,
    List<TextEditingController>? productTwoData,
    List<TextEditingController>? productThreeData,
    bool? status,
    List<NotificationData>? notificationsData,
    bool? notificationStatus
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
        userDataController: userDataController ?? this.userDataController,
        productTwoData: productTwoData ?? this.productTwoData,
        productThreeData: productThreeData ?? this.productThreeData,
        status: status ?? this.status,
        notificationsData: notificationsData ?? this.notificationsData,
        notificationStatus: notificationStatus ?? this.notificationStatus
    );
  }
  @override
  List<Object?> get props => [datosContrato,datosCliente,grupoInscrito,pagoMoroso,pagosRealizados,
    fiaoEstatus,datosEntregaMoto,fieldsController,userDataController,productTwoData,productThreeData,status,List.from(notificationsData ?? []),notificationStatus];


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
  Map<String, dynamic> toMapTwo() {
    return {
      'datosContrato 2': datosContrato?.toMap(),
      'grupo_inscrito 2': grupoInscrito?.toMap(),
      'pago_de_morosidad 2': pagoMoroso?.toMap(),
      'pagos_realizados 2': pagosRealizados?.toMap(),
      'estatus_en_fiaoExpress 2': fiaoEstatus?.toMap(),
      'datos_de_entrega_de_la_moto 2': datosEntregaMoto?.toMap()
      // Convierte otras propiedades a mapas...
    };
  }
  Map<String, dynamic> toMapThree() {
    return {
      'datosContrato 3': datosContrato?.toMap(),
      'grupo_inscrito 3': grupoInscrito?.toMap(),
      'pago_de_morosidad 3': pagoMoroso?.toMap(),
      'pagos_realizados 3': pagosRealizados?.toMap(),
      'estatus_en_fiaoExpress 3': fiaoEstatus?.toMap(),
      'datos_de_entrega_de_la_moto 3': datosEntregaMoto?.toMap()
      // Convierte otras propiedades a mapas...
    };
  }
}

