import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/login_sreens/create_account.dart';
import 'package:login/login_sreens/password_recovery.dart';
import '../bloc/login_bloc.dart';
import '../home_screens/home_screen.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool eyeActivated = false;
  bool _obscureText = true;
  bool adminAccess = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginBloc bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: ((context) => bloc),
          ),
        ],
     child:  BlocBuilder<LoginBloc, LoginState>(

      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only( right: MediaQuery.of(context).size.width * 0.38,),
              child: const Text("Iniciar sesión",style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Dorgan',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                  fontSize: 25
              ),),
            ),
            const SizedBox(
              height: 20,
            ),

            Visibility(
              visible: true,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextField(
                  controller: emailController,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Dorgan',
                    fontStyle: FontStyle.italic,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Ingresa tu correo",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Dorgan',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
                      borderSide: const BorderSide(
                        color: Colors.black, // Color del borde
                        width: 2.0, // Ancho del borde
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: true,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextField(
                  controller: passwordController,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Dorgan',
                    fontStyle: FontStyle.italic,
                  ),
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          eyeActivated = !eyeActivated;
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: eyeActivated ? Colors.black : Colors.grey,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Ingresa tu contraseña",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Dorgan',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
                      borderSide: const BorderSide(
                        color: Colors.white, // Color del borde
                        width: 2.0, // Ancho del borde
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: true,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return DraggableScrollableSheet(
                        expand: false,
                        builder: (context, scrollController) {
                          return const PasswordRecovery();
                        },
                      );
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.38,
                    top: 10,
                  ),
                  child: const Text(
                    "¿Olvidaste tu contraseña?",
                    style: TextStyle(
                      color: Color.fromRGBO(71, 145, 255, 10),
                      fontFamily: 'Dorgan',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
                height: 40
            ),

            Visibility(
              visible: true,
              child: SizedBox(
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    bloc.add(LoginButtonPressed(emailController.text.trim(), passwordController.text.trim(),context,"","",""));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                  ),
                  child: const Text("Iniciar Sesión",style: TextStyle(
                      color: Color.fromRGBO(243, 226, 57, 100),
                      fontFamily: 'Dorgan',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w800,
                      fontSize: 16
                  ),),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                 // bloc.add(LoginButtonPressed("clientuserfiao@gmail.com", "123456",context));
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return BlocProvider.value(
                        value: bloc,  // Usa el mismo LoginBloc de LoginBody
                        child: DraggableScrollableSheet(
                          expand: false,
                          minChildSize: 0.8,
                          initialChildSize: 0.8,
                          builder: (context, scrollController) {
                            return const CreateAccount();
                          },
                        ),
                      );
                    },
                  );

                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                ),
                child: const Text("Regístrate",style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Dorgan',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                    fontSize: 16
                ),),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("FIAO",style: TextStyle(
                  color: Color.fromRGBO(14, 14, 11, 100),
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Dorgan',
                ),
                ),
                Text("EXPRESS",style: TextStyle(
                  color: Color.fromRGBO(14, 14, 11, 100),
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Dorgan',
                ),
                ),
              ],
            ),
          ],
        );
      },
    )

    );
  }
}
