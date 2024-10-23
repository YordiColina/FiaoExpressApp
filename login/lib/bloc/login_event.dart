part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
   String email;
   String password;
   BuildContext context;
   LoginEvent(this.email,this.password,this.context);

  @override
  List<Object> get props => [email,password, context]; // Equatable permite comparar objetos
}

class LoginButtonPressed extends LoginEvent {
  LoginButtonPressed(String email, String password, BuildContext context) : super(email, password, context);

  @override
  List<Object> get props => [email, password,context];
}