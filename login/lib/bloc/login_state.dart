part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String? email;
  final String? password;
  bool? status;

  LoginState({this.email, this.password, this.status});

  @override
  List<Object?> get props => [email, password];

  LoginState copyWith({
    String? email,
    String? password,
    bool? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
