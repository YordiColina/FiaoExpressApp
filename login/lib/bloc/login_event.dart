part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
   String email;
   String password;
   LoginEvent(this.email,this.password);

  @override
  List<Object> get props => [email,password]; // Equatable permite comparar objetos
}

class LoginButtonPressed extends LoginEvent {
  LoginButtonPressed(String email, String password) : super(email, password);

  @override
  List<Object> get props => [email, password];
}