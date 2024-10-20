
import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              label: const Text("Ingresa tu correo", style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Dorgan',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400
              ),),
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
        const SizedBox(
            height: 20
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              label: const Text("Ingresa tu contraseña", style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Dorgan',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400
              ),),
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
        Padding(
          padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.38, top: 10 ),
          child: Text("Olvidé mi contraseña", style: TextStyle(
              color: Colors.white,
              fontFamily: 'Dorgan',
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400
          ),),
        )
      ],
    );
  }
}
