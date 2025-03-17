part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String? email;
  final String? password;
  bool? status;
  UserData? user;

  LoginState({this.email, this.password, this.status, this.user});

  @override
  List<Object?> get props => [email, password, user];

  LoginState copyWith({
    String? email,
    String? password,
    bool? status,
    UserData? user
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        user: user ?? this.user
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'datosCliente': user?.toMap(),
      // Convierte otras propiedades a mapas...
    };
  }
}
