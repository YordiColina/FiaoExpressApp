import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/home_screens/home_aux.dart';

import '../../data/models/client_data.dart';
import '../../data/models/contract_data.dart';
import '../../data/models/fiao_express_status.dart';
import '../../data/models/late_payment.dart';
import '../../data/models/motorcycle_delivery_data.dart';
import '../../data/models/payments_made.dart';
import '../../data/models/registered_group.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<GetFieldValuesEvent>(_createUser);
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
                observacion: event.controllers[29].text)));
        await _clientes
            .doc(state.datosCliente?.cedula)
            .set(state.toMap());
        print(state.toMap());
      } else {
        print("no paso la validación papu");
      }


    } catch (e) {
      print(e);
    }
  }

  String getCurrentUserEmail() {
    return _auth.currentUser?.email ?? "";
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

  void ocultarLoading(BuildContext context) {
    Navigator.pop(context); // Cierra el diálogo de loading
  }
}
