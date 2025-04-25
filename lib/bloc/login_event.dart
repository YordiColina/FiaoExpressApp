part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
   String nombre;
   String cedula;
   String email;
    String telefono;
   String password;
   String repeatPassword;
   BuildContext context;
   LoginEvent(this.email,this.telefono,this.password,this.context, this.nombre,this.cedula,this.repeatPassword);

  @override
  List<Object> get props => [email,password, context]; // Equatable permite comparar objetos
}

class LoginButtonPressed extends LoginEvent {
  LoginButtonPressed(String email, String password, BuildContext context,String nombre,String cedula, String repeatPassword)
      : super(email, password,"", context,nombre,cedula,repeatPassword);

  @override
  List<Object> get props => [email, password,context];
}

class CreateAccountEvent extends LoginEvent {

  CreateAccountEvent(String email, String telefono, String password, BuildContext context,String nombre,String cedula, String repeatPassword)
      : super(email,telefono, password, context,nombre,cedula,repeatPassword);

  @override
  List<Object> get props => [email,telefono, password,context];
}