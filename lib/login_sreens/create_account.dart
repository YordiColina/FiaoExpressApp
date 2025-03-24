import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../bloc/login_bloc.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

TextEditingController _nameController = TextEditingController();
TextEditingController _idController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _repeatPasswordController = TextEditingController();

class _CreateAccountState extends State<CreateAccount> {
  @override
  void initState() {
    _emailController.text = "";
    _passwordController.text = "";
    _idController.text = "";
    _nameController.text = "";
    _repeatPasswordController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color.fromRGBO(235, 235, 235, 100)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'Crear cuenta',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Nombre completo',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight
                                .w600 // Cambia este color según tus preferencias
                            ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _idController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Cédula',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight
                                .w600 // Cambia este color según tus preferencias
                            ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Correo electrónico',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight
                                .w600 // Cambia este color según tus preferencias
                            ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Contraseña',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight
                                .w600 // Cambia este color según tus preferencias
                            ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _repeatPasswordController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Repetir contraseña',
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Dorgan',
                              fontStyle: FontStyle.italic,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black, // Color del borde
                                width: 2.0, // Ancho del borde
                              ),
                            )),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight
                                .w600 // Cambia este color según tus preferencias
                            ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_emailController.text != "" &&
                                _passwordController.text != "" &&
                                _nameController.text != "" &&
                                _idController.text != "" &&
                                _repeatPasswordController.text != "") {
                              context.read<LoginBloc>().add(CreateAccountEvent(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                  context,_nameController.text.trim(),
                                  _idController.text.trim(),_repeatPasswordController.text.trim()));
                              _emailController.text = "";
                              _passwordController.text = "";
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(243, 226, 57, 95),
                          ),
                          child: const Text('Registrarme',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dorgan',
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(186, 186, 186, 95),
                          ),
                          child: const Text('Iniciar sesión',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dorgan',
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
