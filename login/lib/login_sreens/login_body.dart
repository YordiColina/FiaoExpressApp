import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            Visibility(
              visible: adminAccess,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
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
                      borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
              visible: adminAccess,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
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
                      borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
              visible: adminAccess,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // Permite que ocupe todo el espacio disponible
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
                    left: MediaQuery.of(context).size.width * 0.38,
                    top: 10,
                  ),
                  child: const Text(
                    "Olvidé mi contraseña",
                    style: TextStyle(
                      color: Colors.black,
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
              visible: !adminAccess,
              child: Container(
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                   setState(() {
                      adminAccess = true;
                   });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: BorderSide(color: Colors.white,width: 2)
                  ),
                  child: const Text("     Acceso\nAdministrador",style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Dorgan',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w800,
                      fontSize: 16
                  ),
                    maxLines: 2,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: adminAccess,
              child: Container(
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    bloc.add(LoginButtonPressed(emailController.text.trim(), passwordController.text.trim(),context));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: BorderSide(color: Colors.white,width: 2)
                  ),
                  child: const Text("Iniciar Sesión",style: TextStyle(
                      color: Colors.white,
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
            Container(
              width: 200,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  bloc.add(LoginButtonPressed("clientuserfiao@gmail.com", "123456",context));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.black,width: 2)
                ),
                child: const Text("Acceso cliente",style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Dorgan',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                    fontSize: 16
                ),),
              ),
            ),
          ],
        );
      },
    )

    );
  }
}
