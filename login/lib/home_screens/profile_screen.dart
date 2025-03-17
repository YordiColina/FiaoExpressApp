import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/login_bloc.dart';

import 'home_bloc/home_bloc.dart';

class ProfileScreen extends StatefulWidget {
 final String nombre;
 final String cedula;
 final String correo;
 final String direccion;
 final String telefono;
  const ProfileScreen({super.key, required this.nombre, required this.cedula,
    required this.correo, required this.direccion, required this.telefono});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


TextEditingController _idController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _addressController = TextEditingController();
TextEditingController _phoneController = TextEditingController();
HomeBloc homeBloc = HomeBloc();

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    _emailController.text = widget.correo;
    _addressController.text = widget.direccion;
    _idController.text = widget.cedula;
    _phoneController.text = widget.telefono;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MultiBlocProvider(
          providers: [
            BlocProvider<HomeBloc>(
              create: ((context) => homeBloc),
            ),
          ],
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50,top: 100),
                  child: Column(
                    children: [
                      Center(
                        child: SizedBox(
                            height: 20,
                            child: ClipRRect(
                                child: Image.asset(
                                    'packages/login/assets/images/fiao.png',
                                    scale: 5.5,
                                    fit: BoxFit.cover))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          widget.nombre,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: Text(
                          'Datos del cliente',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            color: Color.fromRGBO(161, 161, 161, 1)
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                          child: const Text("Cédula de identidad",style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                          ),)),

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
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Text("Dirección",style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          ),)),
                      TextField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Dirección',
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
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Text("Número de contacto",style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          ),)),
                      TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Número de contacto',
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

                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Text("Correo de electronico",style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          ),)),
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
                      const SizedBox(height: 20),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: IconButton(onPressed: () {
                            Navigator.pop(context);
                          }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                        )
                      ),

                    ],
                  ),
                ),
              );
            },
          ),      ));

  }
}
