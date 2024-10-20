

import 'package:flutter/material.dart';

class LoginButtons extends StatefulWidget {
  const LoginButtons({super.key});

  @override
  State<LoginButtons> createState() => _LoginButtonsState();
}

class _LoginButtonsState extends State<LoginButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 60,
          child: ElevatedButton(
              onPressed: () {

              },
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black54,
            side: BorderSide(color: Colors.white,width: 2)
            ),
              child: Text("Iniciar Sesión",style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Dorgan',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                  fontSize: 16
              ),),
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

            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.white,width: 2)
            ),
            child: Text("Crear Cuenta",style: TextStyle(
                color: Colors.black,
                fontFamily: 'Dorgan',
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w800,
                fontSize: 16
            ),),
          ),
        )
      ],
    );
  }
}
