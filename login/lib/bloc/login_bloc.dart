import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginButtonPressed>(_login);
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login(
  LoginButtonPressed event,
      Emitter<LoginState> emit,
  ) async {

    try {

      emit(state.copyWith(email: event.email, password:  event.password,status: true));
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
       emit(state.copyWith(status: true));
      // Si la autenticación es exitosa, navega a la pantalla principal
      print('se logro perro');
    } catch (e) {
      emit(state.copyWith(status: false));
      print('Error de inicio de sesión: $e');
    }
  }

  }







