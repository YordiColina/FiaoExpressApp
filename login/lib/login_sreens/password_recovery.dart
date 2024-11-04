
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}
TextEditingController _emailController = TextEditingController();

class _PasswordRecoveryState extends State<PasswordRecovery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Recuperar contraseña',  style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          fontFamily: 'Dorgan',
          fontStyle: FontStyle.italic,
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Correo electrónico' ,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Dorgan',
                      fontStyle: FontStyle.italic,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.black, // Color del borde
                        width: 2.0, // Ancho del borde
                      ),
                    )

                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  recuperarContrasena(context, _emailController.text);
                  Navigator.pushReplacementNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.black,width: 2)
                ),

                child: const Text('Enviar correo de recuperación',   style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Dorgan',
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> recuperarContrasena(BuildContext context, String email) async {
    try {
      // Envía el correo de restablecimiento de contraseña
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      // Muestra una confirmación al usuario
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correo de recuperación enviado a $email')),
      );
    } catch (e) {
      // Muestra un mensaje de error si algo sale mal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al enviar el correo de recuperación: $e')),
      );
    }
  }
}
