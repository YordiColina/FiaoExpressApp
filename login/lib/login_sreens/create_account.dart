

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/login_bloc.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();



class _CreateAccountState extends State<CreateAccount> {
  @override
  void initState() {
    _emailController.text = "";
    _passwordController.text = "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.18),
          child: const Text('Crear cuenta',  style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: 'Dorgan',
            fontStyle: FontStyle.italic,
          ),
          ),
        ),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
       return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Correo electrónico' ,
                    hintStyle: const TextStyle(
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
                    ),
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600// Cambia este color según tus preferencias
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Contraseña' ,
                    hintStyle: const TextStyle(
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
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600// Cambia este color según tus preferencias
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    if(_emailController.text != "" && _passwordController.text != "") {
                      context.read<LoginBloc>().add(CreateAccountEvent(_emailController.text.trim(),
                          _passwordController.text.trim(), context));
                      _emailController.text = "";
                      _passwordController.text = "";
                    }

                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black,width: 2)
                  ),

                  child: const Text('Crear cuenta', style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Dorgan',
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                  )),
                ),
              ),
            ],
          ),
        ),
      );
  },
  )


    );
  }


}
