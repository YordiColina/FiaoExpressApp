import 'package:another_flushbar/flushbar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../home_screens/home_screen.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginButtonPressed>(_login);
    on<CreateAccountEvent>(_registerUser);
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login(
  LoginButtonPressed event,
      Emitter<LoginState> emit,
  ) async {

    try {
      mostrarLoading(event.context);
      emit(state.copyWith(email: event.email, password:  event.password,status: true));
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
       emit(state.copyWith(status: true));
      ocultarLoading(event.context);
      if(state.status == true) {
        Navigator.of(event.context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
      // Si la autenticación es exitosa, navega a la pantalla principal
     mostrarFlushbar(event.context, "Inicio de sesión exitoso", false);
    } catch (e) {
      ocultarLoading(event.context);
      emit(state.copyWith(status: false));
      mostrarFlushbar(event.context, "Error de inicio de sesión", true);
      print('Error de inicio de sesión: $e');
    }
  }

  Future<void> _registerUser(CreateAccountEvent event ,
      Emitter<LoginState> emit) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      Navigator.pushReplacementNamed(event.context, '/login');

      mostrarFlushbar(event.context, "Cuenta creada exitosamente", false);
    } catch (e) {
      // Muestra un mensaje de error
      mostrarFlushbar(event.context, "Error al crear cuenta", true);
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
      flushbarPosition: FlushbarPosition.TOP, // Sale desde arriba
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
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
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







