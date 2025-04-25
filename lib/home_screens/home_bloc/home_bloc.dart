import 'dart:async';
import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';
import '../../data/models/client_data.dart';
import '../../data/models/contract_data.dart';
import '../../data/models/fiao_express_status.dart';
import '../../data/models/late_payment.dart';
import '../../data/models/motorcycle_delivery_data.dart';
import '../../data/models/notification_body.dart';
import '../../data/models/payments_made.dart';
import '../../data/models/registered_group.dart';

import '../../login_sreens/notification_pre_screen.dart';
import '../../utils/firebase_service.dart';
import '../profile_screen.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final NotificationService _notificationService;
  late final StreamSubscription<RemoteMessage> _subscription;
  List<NotificationData> _notificationData = <NotificationData>[];

  HomeBloc(this._notificationService) : super(HomeState()) {
    on<GetFieldValuesEvent>(_createUser);
    on<SetValuesEvent>(_getUser);
    on<DeleteClientEvent>(_deleteClient);
    on<GetProductEvent>(_getDataProduct);
    on<GetUserDataEvent>(_getUserData);
    on<NewNotificationRead>(_readNotification);

    // Suscribirse al stream de notificaciones
    _subscription = _notificationService.notificationStream.listen((message) {
      print("📌 Notificación recibida en HomeBloc: ${message.notification?.title}");

      String dataValue = message.data.isNotEmpty ? message.data.values.first.toString() : "";

      // Crear una nueva lista asegurando que no es null
      final List<NotificationData> updatedNotifications = List<NotificationData>.from(state.notificationsData ?? [])
        ..add(NotificationData(
          title: message.notification?.title ?? "",
          body: message.notification?.body ?? "",
          data: dataValue,
        ));
      print("📌 Nueva lista de notificaciones (${updatedNotifications.length}): ${updatedNotifications.map((e) => e.title).toList()}");


      try {
        emit(state.copyWith(
          notificationsData: List.of(updatedNotifications),
          notificationStatus: true,
        ));
        print("📌 Estado emitido correctamente con ${state.notificationsData?.length} notificaciones.");
      } catch (e) {
        print("❌ Error al emitir el estado: $e");
      }
    });

  }


  void _readNotification(NewNotificationRead event, Emitter<HomeState> emit) {
    emit(state.copyWith(
        notificationStatus: event.read
    ));
    if(event.context.mounted) {
      print("cantidad de notificaciones enviadas ${state.notificationsData?.length}");
      Navigator.push(event.context,
          MaterialPageRoute(builder: (context) => NotificationPreScreen(notificationData: state.notificationsData ?? [],)));
    }

  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _clientes =
  FirebaseFirestore.instance.collection('clientes');



  Future<void> _createUser(
    GetFieldValuesEvent event,
    Emitter<HomeState> emit,
  ) async {
    print("si disparo el evento");
    try {
      bool validateControllers = false;
      for (int i = 0; i < 24; i++) {
        if (event.controllers[i].text.isNotEmpty) {
          validateControllers = true;
          print(event.controllers[4].text);
          print(event.controllers.length);
        }
      }
      if (validateControllers) {
        print("si valido bien");
        emit(state.copyWith(
            datosContrato: ContractData(
                contratoNo: event.controllers[0].text,
                fechaContrato: event.controllers[1].text,
                asesor: event.controllers[2].text),
            datosCliente: DataClient(
                nombre: event.controllers[3].text,
                cedula: event.controllers[4].text,
                telefono: event.controllers[5].text,
                ubicacion: event.controllers[6].text,
                direccion: event.controllers[7].text),
            grupoInscrito: RegisteredGroup(
                plan: event.controllers[8].text,
                grupo: event.controllers[9].text,
                nroDeLista: event.controllers[10].text,
                posicionEnLaLista: event.controllers[11].text,
                modeloDeMoto: event.controllers[12].text,
                marcaDeMoto: event.controllers[13].text,
                valorDeCuotaMensualEnDolares: event.controllers[14].text,
                nroDeCuotasTotales: event.controllers[15].text),
            pagosRealizados: PaymentsMade(
                cuotaInicial: event.controllers[16].text,
                gastosADM: event.controllers[17].text,
                nroDeCuotasCanceladas: event.controllers[18].text,
                nroDeCuotasRestantes: event.controllers[19].text,
                proximaFechaDePago: event.controllers[20].text),
            pagoMoroso: LatePayment(
                diasDeRetraso: event.controllers[21].text,
                morosidad: event.controllers[22].text),
            fiaoEstatus: FiaoExpressStatus(estatus: event.controllers[23].text),
            datosEntregaMoto: MotorcycleDeliveryData(
                fechaDeEntrega: event.controllers[24].text,
                color: event.controllers[25].text,
                serialMotor: event.controllers[26].text,
                serialCarroceria: event.controllers[27].text,
                placa: event.controllers[28].text,
                observacion: event.controllers[29].text),
                ));
          event.index == 0 ? emit(state.copyWith(fieldsController: event.controllers)) :
              event.index == 2 ? emit(state.copyWith(productTwoData: event.controllers)) :
              emit(state.copyWith(productThreeData: event.controllers));

        event.index == 0 ? await _clientes
            .doc(state.datosCliente?.cedula)
            .set(state.toMap(),SetOptions(merge: true)) : event.index == 2 ?
        await _clientes
            .doc(state.datosCliente?.cedula)
            .set(state.toMapTwo(),SetOptions(merge: true)) :
        await _clientes
            .doc(state.datosCliente?.cedula)
            .set(state.toMapThree(),SetOptions(merge: true));

        print(state.toMap());
        mostrarFlushbar(event.context, "Cliente añadido/editado con éxito", false);
      } else {
        mostrarFlushbar(event.context, "Error al crear/editar cliente", true);
        print("no paso la validación papu");
      }
    } catch (e) {
      mostrarFlushbar(event.context, "Error al crear/editar cliente", true);
      print(e);
    }
  }

  Future<void> _deleteClient(
      DeleteClientEvent event,
      Emitter<HomeState> emit,
      ) async {
    print("si disparo el evento");
    try {
      bool validateControllers = event.controllers.isNotEmpty;

      if (validateControllers) {
        mostrarLoading(event.context);
        await _clientes.doc(event.controllers[0].text.trim()).delete();
        ocultarLoading(event.context);
        mostrarFlushbar(event.context, "Cliente Borrado con éxito", false);
      } else {
        mostrarFlushbar(event.context, "Ingresa número de cédula", true);
      }
    } catch (e) {
      mostrarFlushbar(event.context, "Error al borrar cliente", true);
      print(e);
    }
  }

  Future<void> _getUser(
      SetValuesEvent event,
      Emitter<HomeState> emit,
      ) async {
    print("si disparo el evento para obtener los productos del usuario");
    try {
      Map<String, dynamic>? data = {};
      CollectionReference clientes =
      FirebaseFirestore.instance.collection('clientes');
      QuerySnapshot querySnapshot = await clientes
          .where('datosCliente.cédula', isEqualTo: event.controllers[0].text)
          .get();
      if (event.controllers[0].text != "") {
        print("entro a la lista de los controllers");
        print("funcionoooo ${event.controllers[0].text}");
        List<TextEditingController> dataController = [];
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          // Obtiene los datos del documento completo
          Map<String, dynamic> datos = doc.data() as Map<String, dynamic>;
          for(int i = 0; i < 30; i++) {
            dataController.add(TextEditingController());
          }
          // Extrae los datos del contrato
          Map<String, dynamic> contractData = datos['datosContrato'] ?? data;
          dataController[0].text = contractData['contratoNo'] ?? "0";
          dataController[1].text = contractData['fechaContrato'] ?? "";
          dataController[2].text = contractData['asesor'] ?? "";

          // Extrae los datos del cliente
          Map<String, dynamic> clientData = datos['datosCliente'] ?? data;
          dataController[3].text = clientData['nombre'] ?? "";
          dataController[4].text = clientData['cédula'] ?? "";
          dataController[5].text = clientData['teléfono'] ?? "0";
          dataController[6].text = clientData['ubicación'] ?? "";
          dataController[7].text = clientData['dirección'] ?? "";

          Map<String, dynamic> selectedGroup = datos['grupo_inscrito'] ?? data;
          dataController[8].text = selectedGroup['plan'] ?? "";
          dataController[9].text = selectedGroup['grupo'] ?? "";
          dataController[10].text = selectedGroup['nro_de_lista'] ?? "0";
          dataController[11].text = selectedGroup['posicion_en_la_lista'] ?? "";
          dataController[12].text = selectedGroup['modelo_de_moto'] ?? "";
          dataController[13].text = selectedGroup['marca_de_moto'] ?? "";
          dataController[14].text = selectedGroup['valor_cuota_mensual_en_dolares'] ?? "";
          dataController[15].text = selectedGroup['nro_de_cuotas_totales'] ?? "1";


          Map<String, dynamic> successPayments = datos['pagos_realizados'] ?? data;
          dataController[16].text = successPayments['cuotaInicial'] ?? "";
          dataController[17].text = successPayments['gastosADM'] ?? "";
          dataController[18].text = successPayments['nro_de_cuotas_canceladas'] ?? "1";
          dataController[19].text = successPayments['nro_de_cuotas_restantes'] ?? "1";
          dataController[20].text = successPayments["proxima_fecha_de_pago"] ?? "";

          Map<String, dynamic> latePayment = datos['pago_de_morosidad'] ?? data;
          dataController[21].text = latePayment['díasDeRetraso'] ?? "0";
          dataController[22].text = latePayment['morosidad'] ?? "";

          Map<String, dynamic> fiaoExpressStatus =
          datos['estatus_en_fiaoExpress'] ?? data;
          dataController[23].text = fiaoExpressStatus['estatus'] ?? "";


          Map<String, dynamic> bikeDeliveryData =
          datos['datos_de_entrega_de_la_moto'] ?? data;
          dataController[24].text = bikeDeliveryData['color'] ?? "";
          dataController[25].text = bikeDeliveryData['fecha_de_entrega'] ?? "";
          dataController[26].text = bikeDeliveryData['serialMotor'] ?? "";
          dataController[27].text = bikeDeliveryData['serialCarroceria'] ?? "";
          dataController[28].text = bikeDeliveryData['placa'] ?? "";
          dataController[29].text = bikeDeliveryData['observacion'] ?? "";
          print( selectedGroup['plan']);
        }

        emit(state.copyWith(fieldsController: dataController,
        status: true));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _getUserData(
      GetUserDataEvent event,
      Emitter<HomeState> emit,
      ) async {
    print("si disparo el evento de los datos del usuario");
    try {
      Map<String, dynamic>? data = {};
      CollectionReference usuarios =
      FirebaseFirestore.instance.collection('usuarios');
      QuerySnapshot querySnapshot = await usuarios
          .where('datosCliente.correo', isEqualTo: event.email)
          .get();
      List<TextEditingController> dataController = [];
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        // Obtiene los datos del documento completo
        Map<String, dynamic> datos = doc.data() as Map<String, dynamic>;
        for(int i = 0; i < 3; i++) {
          dataController.add(TextEditingController());
        }
        // Extrae los datos del contrato
        Map<String, dynamic> clientData = datos['datosCliente'] ?? data;
        dataController[0].text = clientData['nombre'] ?? "";
        dataController[1].text = clientData['cédula'] ?? "";
        dataController[2].text = clientData['correo'] ?? "";
      }
      emit(state.copyWith(userDataController: dataController,
          status: true));
        } catch (e) {
      print(e);
    }
  }

  Future<bool> checkProduct(int index, TextEditingController controller) async {
    bool exist = false;
    Map<String, dynamic>? data = {};

    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('clientes')
          .doc(controller.text)
          .get();

      if (doc.exists) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

        if (data != null && data.containsKey('datosContrato $index')) {
          exist = true;
          print("El campo datosContrato $index existe: ${data['datosContrato $index']}");
        } else {
          print("El campo datosContrato $index no existe");
        }
      } else {
        print("El documento no existe");
      }
    } catch (e) {
      print("Error al verificar el producto: $e");
    }

    return exist;
  }

  Future<void> _getDataProduct(GetProductEvent event,
      Emitter<HomeState> emit,) async {
    print("si disparo el evento de los pproductos del usuario");
    Map<String, dynamic>? data = {};
    try {
      CollectionReference clientes =
      FirebaseFirestore.instance.collection('clientes');
      QuerySnapshot querySnapshot = await clientes
          .where('datosCliente.cédula', isEqualTo: event.controllers[0].text)
          .get();
        print("siuuuuuuuu");
        List<TextEditingController> dataController = [];


        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          // Obtiene los datos del documento completo
          Map<String, dynamic> datos = doc.data() as Map<String, dynamic>;
          for(int i = 0; i < 30; i++) {
            dataController.add(TextEditingController());
          }
          // Extrae los datos del contrato
          Map<String, dynamic> contractData = datos['datosContrato ${event.index}'] ?? data;
          dataController[0].text = contractData['contratoNo'] ?? "0";
          dataController[1].text = contractData['fechaContrato'] ?? "";
          dataController[2].text = contractData['asesor'] ?? "";

          // Extrae los datos del cliente
          Map<String, dynamic> clientData = datos['datosCliente'] ?? "";
          dataController[3].text = clientData['nombre'] ?? "";
          dataController[4].text = clientData['cédula'] ?? "";
          dataController[5].text = clientData['teléfono'] ?? "0";
          dataController[6].text = clientData['ubicación'] ?? "";
          dataController[7].text = clientData['dirección'] ?? "";

          Map<String, dynamic> selectedGroup = datos['grupo_inscrito ${event.index}'] ?? data;
          dataController[8].text = selectedGroup['plan'] ?? "";
          dataController[9].text = selectedGroup['grupo'] ?? "";
          dataController[10].text = selectedGroup['nro_de_lista'] ?? "0";
          dataController[11].text = selectedGroup['posicion_en_la_lista'] ?? "0";
          dataController[12].text = selectedGroup['modelo_de_moto'] ?? "";
          dataController[13].text = selectedGroup['marca_de_moto'] ?? "";
          dataController[14].text = selectedGroup['valor_cuota_mensual_en_dolares'] ?? "";
          dataController[15].text = selectedGroup['nro_de_cuotas_totales'] ?? "1";


          Map<String, dynamic> successPayments = datos['pagos_realizados ${event.index}'] ?? data;
          dataController[16].text = successPayments['cuotaInicial'] ?? "";
          dataController[17].text = successPayments['gastosADM'] ?? "";
          dataController[18].text = successPayments['nro_de_cuotas_canceladas'] ?? "1";
          dataController[19].text = successPayments['nro_de_cuotas_restantes'] ?? "1";
          dataController[20].text = successPayments["proxima_fecha_de_pago"] ?? "";

          Map<String, dynamic> latePayment = datos['pago_de_morosidad ${event.index}'] ?? data;
          dataController[21].text = latePayment['díasDeRetraso'] ?? "0";
          dataController[22].text = latePayment['morosidad'] ?? "";

          Map<String, dynamic> fiaoExpressStatus =
          datos['estatus_en_fiaoExpress ${event.index}'] ?? data;
          dataController[23].text = fiaoExpressStatus['estatus'] ?? "";


          Map<String, dynamic> bikeDeliveryData =
          datos['datos_de_entrega_de_la_moto ${event.index}'] ?? data;
          dataController[24].text = bikeDeliveryData['color'] ?? "";
          dataController[25].text = bikeDeliveryData['fecha_de_entrega'] ?? "";
          dataController[26].text = bikeDeliveryData['serialMotor'] ?? "";
          dataController[27].text = bikeDeliveryData['serialCarroceria'] ?? "";
          dataController[28].text = bikeDeliveryData['placa'] ?? "";
          dataController[29].text = bikeDeliveryData['observacion'] ?? "";
        }
       event.index == 2 ? emit(state.copyWith(productTwoData: dataController)) :
       emit(state.copyWith(productThreeData: dataController));

        print("Estado actual productTwoData: ${state.productTwoData} ${event.index}");

    } catch (e) {
      print(e);
    }
  }

  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mi_archivo.pdf");
      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error al abrir el archivo");
    }
  }

  Future<File> getFileFromAsset2(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mi_archivo2.pdf");
      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error al abrir el archivo");
    }
  }





  Future<String> getCurrentId(String correo) async {
    String id = "";
    CollectionReference usuarios =
   await FirebaseFirestore.instance.collection('usuarios');
    QuerySnapshot querySnapshot = await usuarios
        .where('datosCliente.correo', isEqualTo: correo)
        .get();
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      // Obtiene los datos del documento completo
      Map<String, dynamic> datos = doc.data() as Map<String, dynamic>;
      Map<String, dynamic> clientData = datos['datosCliente'];
      id =  clientData['cédula'];
    } print(id);
    return id;
  }

  void mostrarFlushbar(BuildContext context, String message, bool fail) {
    Flushbar(
      message: message,
      messageColor: fail ? Colors.red : Colors.white,
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      // Sale desde arriba
      backgroundColor: Colors.blueGrey[800] ?? Colors.blueGrey,
      icon: Icon(
        fail ? Icons.warning : Icons.check_circle,
        color: fail ? Colors.red : Colors.white,
      ),
    )..show(context);
  }

  void mostrarLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Evita que el usuario cierre el diálogo
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: SizedBox(
            height: 100,
            child: Center(
              child: CircularProgressIndicator(), // Indicador de carga circular
            ),
          ),
        );
      },
    );
  }

  Future<void> signOut(BuildContext context) async {
    mostrarLoading(context);
    try {
      await FirebaseAuth.instance.signOut();
      ocultarLoading(context);

      // Opcional: Navegar a la pantalla de inicio de sesión después del cierre de sesión
      Navigator.pushReplacementNamed(context, '/login');
      mostrarFlushbar(context, "Sesión cerrada exitosamente", false);
      print('Sesión cerrada correctamente.');
    } catch (e) {
      ocultarLoading(context);
      print('Error al cerrar sesión: $e');

      // Mostrar un mensaje de error si ocurre algún problema
      mostrarFlushbar(context, "Error al cerrar sesión", true);
    }
  }

  List<TextEditingController> cleanFields(int size) {
   List<TextEditingController> controllers = [];
   for( int i = 0; i < size; i++) {
     controllers.add(TextEditingController());
     controllers[i].text = "";
   }
   return controllers;
  }

  void ocultarLoading(BuildContext context) {
    Navigator.pop(context); // Cierra el diálogo de loading
  }
}
