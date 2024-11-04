import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/bloc/login_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
LoginBloc bloc = LoginBloc();

TextEditingController contractNumberController = TextEditingController();
TextEditingController contractDateController = TextEditingController();
TextEditingController nextPayDateController = TextEditingController();
TextEditingController adviserController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController identificationController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController groupController = TextEditingController();
TextEditingController modelController = TextEditingController();
TextEditingController brandController = TextEditingController();
TextEditingController feesController = TextEditingController();
TextEditingController admBillsController = TextEditingController();
TextEditingController fleesNumberController = TextEditingController();
TextEditingController totalfeesnumberController = TextEditingController();
TextEditingController lateDaysController = TextEditingController();
TextEditingController latePayController = TextEditingController();
TextEditingController statusController = TextEditingController();
TextEditingController feeMonthCost = TextEditingController();
TextEditingController totalFeeCostController = TextEditingController();
TextEditingController deliveryDateController = TextEditingController();
TextEditingController plateController = TextEditingController();
TextEditingController colorController = TextEditingController();
TextEditingController motorSerialController = TextEditingController();
TextEditingController bodySerialController = TextEditingController();
TextEditingController observationController = TextEditingController();
TextEditingController ubicationController = TextEditingController();
TextEditingController searchController = TextEditingController();
TextEditingController planController = TextEditingController();
TextEditingController deleteController = TextEditingController();
TextEditingController positionListController = TextEditingController();
TextEditingController numberOfListController = TextEditingController();
bool toEdit = false;
String auxTotalFees = fleesNumberController.text;
String auxPayFees = totalFeeCostController.text;
int totalFees = 0;
int payFees = 0;
double progressBar = 0.0;
bool editable = true;
bool readyToDelivery = false;
String? selectedOption;
List<String> options = ['Ahorro planificado', 'Entrega inmediata',];
String userEmail = "";

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    userEmail = bloc.getCurrentUserEmail();
    print(userEmail);
    if(userEmail != "fiaoexpressapp@gmail.com") {
      editable = false;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.050,
                      right: MediaQuery.of(context).size.width * 0.050),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          signOut(context);
                        },
                        child: Padding(
                          padding:  EdgeInsets.only(left: 10),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child:  Text(
                            editable != false ? "Cerrar sesión" : "Atrás",
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dorgan',
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                         editable != false ? "Registro de Clientes" : "Consultar información",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Visibility(
                        visible: !editable,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.050,
                              right: MediaQuery.of(context).size.width * 0.050),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: searchController,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Dorgan',
                              fontStyle: FontStyle.italic,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Ingresa la cédula de identidad ",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Dorgan',
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                // Esquinas redondeadas
                                borderSide: const BorderSide(
                                  color: Colors.white, // Color del borde
                                  width: 2.0, // Ancho del borde
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      Visibility(
                        visible: !editable,
                        child: ElevatedButton(
                            onPressed: () {
                              obtenerYGuardarDatos(searchController.text);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[300]),
                            child: const Text("Consultar",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Dorgan',
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w800,
                                ))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.40),
                        child: const Text(
                          "Datos del contrato",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Contrato No",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        keyboardType: TextInputType.number,
                        controller: contractNumberController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Contrato No",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Fecha de contrato",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        controller: contractDateController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Fecha contrato",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Asesor",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        controller: adviserController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Asesor",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.050,
                      right: MediaQuery.of(context).size.width * 0.050),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.40),
                        child: const Text(
                          "Datos del cliente",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Nombre",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        controller: nameController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Nombre",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Cédula",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        keyboardType: TextInputType.number,
                        controller: identificationController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Cédula",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Teléfono",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Teléfono",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Ubicación",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        controller: ubicationController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Ubicación",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Dirección",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        controller: addressController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Dirección",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.050,
                      right: MediaQuery.of(context).size.width * 0.050),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.50),
                        child: const Text(
                          "Grupo Inscrito",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Plan",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        child: InputDecorator(
                          decoration: const InputDecoration(border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          )),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedOption,
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              hint: const Text("Selecciona un plan", style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Dorgan',
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                              ),),
                              items: options.map((String option) {
                                return DropdownMenuItem<String>(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  planController.text = newValue  ?? "";
                                  selectedOption = newValue;
                                  if(selectedOption == "Ahorro planificado") {
                                    totalFeeCostController.text = "24";
                                  } else {
                                    totalFeeCostController.text = "8";
                                    readyToDelivery = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Grupo",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        controller: groupController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Grupo",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Nro de lista",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        controller: numberOfListController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Nro de lista",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Posición en la lista",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        controller: positionListController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Posición en la lista",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Modelo de moto",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        controller: modelController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Modelo de moto",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Marca de la moto",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        controller: brandController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Marca de la moto",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Valor de cuota mensual en \$",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        controller: feeMonthCost,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Valor de cuota mensual en \$",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Nro de cuotas totales",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        keyboardType: TextInputType.number,
                        controller: totalFeeCostController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Nro de cuotas totales",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            auxTotalFees = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.050,
                      right: MediaQuery.of(context).size.width * 0.050),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.40),
                        child: const Text(
                          "Pagos realizados",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Cuota inicial",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        keyboardType: TextInputType.number,
                        controller: feesController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Cuota inicial",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "GastosADM",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        controller: admBillsController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Gastos ADM",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Nro de cuotas canceladas",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        keyboardType: TextInputType.number,
                        controller: fleesNumberController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Nro de cuotas canceladas",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            auxPayFees = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Nro de cuotas restantes",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        keyboardType: TextInputType.number,
                        controller: totalfeesnumberController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Nro de cuotas restantes",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Próxima fecha de pago",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        controller: nextPayDateController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Próxima fecha de pago",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child:  Text(
                            "Progreso del pago $payFees/$totalFees cuotas",
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: LinearProgressIndicator(
                              value: progressBar,
                            backgroundColor: Colors.white,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                            borderRadius: BorderRadius.circular(20),
                          )
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.050,
                      right: MediaQuery.of(context).size.width * 0.050),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.40),
                        child: const Text(
                          "Pago de morosidad",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Días de retraso",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        keyboardType: TextInputType.number,
                        controller: lateDaysController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Días de retraso",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Morosidad",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        keyboardType: TextInputType.number,
                        controller: latePayController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Morosidad",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.050,
                      right: MediaQuery.of(context).size.width * 0.050),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.40),
                        child: const Text(
                          "Estatus en FiaoExpress",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Estatus",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        readOnly: !editable,
                        controller: statusController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Estatus",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Esquinas redondeadas
                            borderSide: const BorderSide(
                              color: Colors.white, // Color del borde
                              width: 2.0, // Ancho del borde
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: readyToDelivery && !editable,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.050,
                        right: MediaQuery.of(context).size.width * 0.050),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.40),
                          child: const Text(
                            "Datos de entrega de la moto",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Dorgan',
                              fontStyle: FontStyle.italic,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Fecha de entrega",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dorgan',
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          readOnly: !editable,
                          controller: deliveryDateController,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Fecha de entrega",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Dorgan',
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              // Esquinas redondeadas
                              borderSide: const BorderSide(
                                color: Colors.white, // Color del borde
                                width: 2.0, // Ancho del borde
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Color",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dorgan',
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          readOnly: !editable,
                          controller: colorController,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Color",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Dorgan',
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              // Esquinas redondeadas
                              borderSide: const BorderSide(
                                color: Colors.white, // Color del borde
                                width: 2.0, // Ancho del borde
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Serial motor",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dorgan',
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          readOnly: !editable,
                          controller: motorSerialController,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Serial motor",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Dorgan',
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              // Esquinas redondeadas
                              borderSide: const BorderSide(
                                color: Colors.white, // Color del borde
                                width: 2.0, // Ancho del borde
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Serial carrorería",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dorgan',
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          readOnly: !editable,
                          controller: bodySerialController,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Serial carrocería",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Dorgan',
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              // Esquinas redondeadas
                              borderSide: const BorderSide(
                                color: Colors.white, // Color del borde
                                width: 2.0, // Ancho del borde
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Placa",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dorgan',
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          readOnly: !editable,
                          controller: plateController,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Placa",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Dorgan',
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              // Esquinas redondeadas
                              borderSide: const BorderSide(
                                color: Colors.white, // Color del borde
                                width: 2.0, // Ancho del borde
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Observación",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dorgan',
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          readOnly: !editable,
                          controller: observationController,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Dorgan',
                            fontStyle: FontStyle.italic,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Observación",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Dorgan',
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              // Esquinas redondeadas
                              borderSide: const BorderSide(
                                color: Colors.white, // Color del borde
                                width: 2.0, // Ancho del borde
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: editable,
                  child: ElevatedButton(
                      onPressed: () {
                        crearDocumentoEnFirestore();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300]),
                      child: const Text(" Crear cliente",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Dorgan',
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: editable,
                  child: ElevatedButton(
                      onPressed: () {
                        cleanFields();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300]),
                      child: const Text(" Limpiar campos",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Dorgan',
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: editable,
                  child: ElevatedButton(
                      onPressed: () {
                        obtenerYGuardarDatos(searchController.text);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300]),
                      child: const Text(" Consultar cliente",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Dorgan',
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: editable,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.050,
                        right: MediaQuery.of(context).size.width * 0.050),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: searchController,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Dorgan',
                        fontStyle: FontStyle.italic,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Ingresa la cédula de identidad ",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          // Esquinas redondeadas
                          borderSide: const BorderSide(
                            color: Colors.white, // Color del borde
                            width: 2.0, // Ancho del borde
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: editable,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Si quieres editar, primero consulta el cliente ingresando su cédula en el campo y luego presiona el botón de 'Consultar cliente', procede a editar los campos que desees y guarda los cambios en el botón 'Editar cliente' ",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Dorgan',
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w800,
                        ),
                        maxLines: 5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: editable,
                  child: ElevatedButton(
                      onPressed: () {
                        crearDocumentoEnFirestore();
                        setState(() {
                          toEdit = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300]),
                      child: const Text("Editar cliente",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Dorgan',
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: editable,
                  child: ElevatedButton(
                      onPressed: () {
                        eliminarDocumentoPorId(deleteController.text);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300]),
                      child: const Text(" Eliminar cliente",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Dorgan',
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: editable,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.050,
                        right: MediaQuery.of(context).size.width * 0.050),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: deleteController,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Dorgan',
                        fontStyle: FontStyle.italic,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Ingresa la cédula del cliente a eliminar ",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Dorgan',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          // Esquinas redondeadas
                          borderSide: const BorderSide(
                            color: Colors.white, // Color del borde
                            width: 2.0, // Ancho del borde
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> crearDocumentoEnFirestore() async {
    mostrarLoading(context);
    // Referencia a la colección donde se almacenarán los documentos
    CollectionReference clientes =
        FirebaseFirestore.instance.collection('clientes');
    if (contractNumberController.text != "" &&
        contractDateController.text != "" &&
        adviserController.text != "" &&
        nameController.text != "" &&
        identificationController.text != "" &&
        phoneController.text != "" &&
        addressController.text != "" &&
        groupController.text != "" &&
        modelController.text != "" &&
        brandController.text != "" &&
        feesController.text != "" &&
        admBillsController.text != "" &&
        fleesNumberController.text != "" &&
        totalfeesnumberController.text != "" &&
        lateDaysController.text != "" &&
        latePayController.text != "" &&
        nextPayDateController.text != "" &&
        statusController.text != "" &&
        feeMonthCost.text != "" &&
        totalFeeCostController.text != "" &&
        deliveryDateController.text != "" &&
        colorController.text != "" &&
        motorSerialController.text != "" &&
        bodySerialController.text != "" &&
        plateController.text != "" &&
        observationController.text != "") {
      try {
        // Crea un mapa con los datos del contrato
        Map<String, dynamic> datosContrato = {
          'contratoNo': contractNumberController.text,
          'fechaContrato': contractDateController.text,
          'asesor': adviserController.text,
        };

        // Crea un mapa con los datos del cliente
        Map<String, dynamic> datosCliente = {
          'nombre': nameController.text,
          'cédula': identificationController.text,
          'teléfono': phoneController.text,
          'ubicación': ubicationController.text,
          'dirección': addressController.text,
        };

        Map<String, dynamic> grupo_inscrito = {
          'plan': planController.text,
          'grupo': groupController.text,
          'nro_de_lista': numberOfListController.text,
          'posicion_en_la_lista': positionListController.text,
          'modelo_de_moto': modelController.text,
          'marca_de_moto': brandController.text,
          'valor_cuota_mensual_en_dolares': feeMonthCost.text,
          'nro_de_cuotas_totales': totalFeeCostController.text
        };

        Map<String, dynamic> pagosRealizados = {
          'cuotaInicial': feesController.text,
          'gastosADM': admBillsController.text,
          'nro_de_cuotas_canceladas': fleesNumberController.text,
          'nro_de_cuotas_restantes': totalfeesnumberController.text,
          'proxima_fecha_de_pago': nextPayDateController.text
        };

        Map<String, dynamic> pago_de_morosidad = {
          'díasDeRetraso': lateDaysController.text,
          'morosidad': latePayController.text,
        };

        Map<String, dynamic> estatus_en_fiaoExpress = {
          'estatus': statusController.text,
        };

        Map<String, dynamic> datos_de_entrega_de_la_moto = {
          'fecha_de_entrega': deliveryDateController.text,
          'color': colorController.text,
          'serialMotor': motorSerialController.text,
          'serialCarroceria': bodySerialController.text,
          'placa': plateController.text,
          'observacion': observationController.text
        };

        // Combina los dos mapas en un solo documento
        Map<String, dynamic> documentoCompleto = {
          'datosContrato': datosContrato,
          'datosCliente': datosCliente,
          'grupo_inscrito': grupo_inscrito,
          'pagos_realizados': pagosRealizados,
          'pago_de_morosidad': pago_de_morosidad,
          'estatus_en_fiaoExpress': estatus_en_fiaoExpress,
          'datos_de_entrega_de_la_moto': datos_de_entrega_de_la_moto,
        };

        // Agrega el documento a Firestore
        await clientes
            .doc(identificationController.text)
            .set(documentoCompleto);
        ocultarLoading(context);
        print('Documento creado exitosamente');
        mostrarFlushbar(
            context,
            toEdit
                ? "Cliente editado exitosamente"
                : "Cliente creado exitosamente",
            false);
        setState(() {
          contractNumberController.text = "";
          contractDateController.text = "";
          adviserController.text = "";
          nameController.text = "";
          identificationController.text = "";
          phoneController.text = "";
          addressController.text = "";
          groupController.text = "";
          modelController.text = "";
          brandController.text = "";
          feesController.text = "";
          nextPayDateController.text = "";
          planController.text = "";
          admBillsController.text = "";
          fleesNumberController.text = "";
          totalfeesnumberController.text = "";
          lateDaysController.text = "";
          latePayController.text = "";
          totalFeeCostController.text = "";
          statusController.text = "";
          feeMonthCost.text = "";
          deliveryDateController.text = "";
          plateController.text = "";
          colorController.text = "";
          motorSerialController.text = "";
          bodySerialController.text = "";
          observationController.text = "";
          ubicationController.text = "";
          positionListController.text = "";
          numberOfListController.text = "";
        });
      } catch (e) {
        ocultarLoading(context);
        mostrarFlushbar(context, "Error al crear cliente", true);
        print('Error al crear el documento: $e');
      }
    } else {
      ocultarLoading(context);
      mostrarFlushbar(context, "Compruebe que los campos esten completos", true);
    }
  }

  Future<void> obtenerYGuardarDatos(String contratoNo) async {
    CollectionReference clientes =
        FirebaseFirestore.instance.collection('clientes');
    mostrarLoading(context);
    try {
      // Realiza la consulta para obtener el documento con el número de contrato
      QuerySnapshot querySnapshot = await clientes
          .where('datosCliente.cédula', isEqualTo: searchController.text)
          .get();

      // Verifica si se encontró algún documento
      if (querySnapshot.docs.isNotEmpty) {
        ocultarLoading(context);
        // Itera sobre los documentos encontrados (en este caso, solo debe haber uno)
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          // Obtiene los datos del documento completo
          Map<String, dynamic> datos = doc.data() as Map<String, dynamic>;

          setState(() {
            // Extrae los datos del contrato
            Map<String, dynamic> contractData = datos['datosContrato'];
            contractNumberController.text = contractData['contratoNo'];
            contractDateController.text = contractData['fechaContrato'];
            adviserController.text = contractData['asesor'];

            // Extrae los datos del cliente
            Map<String, dynamic> clientData = datos['datosCliente'];
            nameController.text = clientData['nombre'];
            identificationController.text = clientData['cédula'];
            phoneController.text = clientData['teléfono'];
            ubicationController.text = clientData['ubicación'];
            addressController.text = clientData['dirección'];

            Map<String, dynamic> selectedGroup = datos['grupo_inscrito'];
            planController.text = selectedGroup['plan'];
            selectedOption = selectedGroup['plan'];
            groupController.text = selectedGroup['grupo'];
            numberOfListController.text = selectedGroup['nro_de_lista'];
            positionListController.text = selectedGroup['posicion_en_la_lista'];
            modelController.text = selectedGroup['modelo_de_moto'];
            brandController.text = selectedGroup['marca_de_moto'];
            feeMonthCost.text = selectedGroup['valor_cuota_mensual_en_dolares'];
            totalFeeCostController.text =
                selectedGroup['nro_de_cuotas_totales'];



            Map<String, dynamic> successPayments = datos['pagos_realizados'];
            feesController.text = successPayments['cuotaInicial'];
            admBillsController.text = successPayments['gastosADM'];
            fleesNumberController.text =
                successPayments['nro_de_cuotas_canceladas'];
            totalfeesnumberController.text =
                successPayments['nro_de_cuotas_restantes'];
            nextPayDateController.text =
                successPayments["proxima_fecha_de_pago"];

            Map<String, dynamic> latePayment = datos['pago_de_morosidad'];
            lateDaysController.text = latePayment['díasDeRetraso'];
            latePayController.text = latePayment['morosidad'];

            Map<String, dynamic> fiaoExpressStatus =
                datos['estatus_en_fiaoExpress'];
            statusController.text = fiaoExpressStatus['estatus'];

            Map<String, dynamic> bikeDeliveryData =
                datos['datos_de_entrega_de_la_moto'];
            colorController.text = bikeDeliveryData['color'];
            deliveryDateController.text = bikeDeliveryData['fecha_de_entrega'];
            motorSerialController.text = bikeDeliveryData['serialMotor'];
            bodySerialController.text = bikeDeliveryData['serialCarroceria'];
            plateController.text = bikeDeliveryData['placa'];
            observationController.text = bikeDeliveryData['observacion'];

            setState(() {
              auxPayFees = successPayments['nro_de_cuotas_canceladas'];
              auxTotalFees = selectedGroup['nro_de_cuotas_totales'];
              payFees = int.parse(auxPayFees);
              totalFees = int.parse(auxTotalFees);
              progressBar = payFees/ totalFees;
            });

            searchController.text = "";
            mostrarFlushbar(context, "Cliente encontrado", false);
          });
        }
      } else {
        ocultarLoading(context);
        mostrarFlushbar(context, "Cliente no encontrado", true);
        print(
            'No se encontró ningún documento con el número de contrato: $contratoNo');
      }
    } catch (e) {
      ocultarLoading(context);
      print(searchController.text);
      mostrarFlushbar(context, "Error al consultar cliente", true);
      print('Error al obtener los datos: $e');
    }
  }

  Future<void> eliminarDocumentoPorId(String documentId) async {
    CollectionReference clientes =
        FirebaseFirestore.instance.collection('clientes');
    mostrarLoading(context);
    try {
      // Elimina el documento usando su ID
      await clientes.doc(documentId).delete();
      ocultarLoading(context);
      mostrarFlushbar(context,
          "Cliente eliminado ${deleteController.text} exitosamente", false);
      cleanFields();
      setState(() {
        deleteController.text = "";
      });
      print('Documento con ID $documentId eliminado correctamente.');
    } catch (e) {
      ocultarLoading(context);
      mostrarFlushbar(context, "Error al eliminar cliente", true);
      print('Error al eliminar el documento: $e');
    }
  }

  void cleanFields() {
    setState(() {
      contractNumberController.text = "";
      contractDateController.text = "";
      adviserController.text = "";
      nameController.text = "";
      identificationController.text = "";
      phoneController.text = "";
      addressController.text = "";
      groupController.text = "";
      modelController.text = "";
      brandController.text = "";
      feesController.text = "";
      admBillsController.text = "";
      fleesNumberController.text = "";
      planController.text = "";
      totalfeesnumberController.text = "";
      lateDaysController.text = "";
      latePayController.text = "";
      statusController.text = "";
      totalFeeCostController.text = "";
      deliveryDateController.text = "";
      plateController.text = "";
      feeMonthCost.text = "";
      colorController.text = "";
      nextPayDateController.text = "";
      motorSerialController.text = "";
      bodySerialController.text = "";
      observationController.text = "";
      ubicationController.text = "";
      positionListController.text = "";
      numberOfListController.text = "";
    });
  }

  void mostrarFlushbar(BuildContext context, String message, bool fail) {
    Flushbar(
      message: message,
      messageColor: fail ? Colors.red : Colors.white,
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      // Sale desde arriba
      backgroundColor: Colors.blueGrey[800]!,
      icon: Icon(
        fail ? Icons.warning : Icons.check_circle,
        color: fail ? Colors.red : Colors.white,
      ),
    )..show(context);
  }

  Future<void> signOut(BuildContext context) async {
    mostrarLoading(context);
    try {
      await FirebaseAuth.instance.signOut();
      ocultarLoading(context);

      // Opcional: Navegar a la pantalla de inicio de sesión después del cierre de sesión
      Navigator.pushReplacementNamed(context, '/login');
      mostrarFlushbar(context, "Sesión cerrada exitosamente", false);
      print('Sesión cerrada correctamente.');
    } catch (e) {
      ocultarLoading(context);
      print('Error al cerrar sesión: $e');

      // Mostrar un mensaje de error si ocurre algún problema
      mostrarFlushbar(context, "Error al cerrar sesión", true);
    }
  }

  void mostrarLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Evita que el usuario cierre el diálogo
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            height: 100,
            child: Center(
              child: CircularProgressIndicator(), // Indicador de carga circular
            ),
          ),
        );
      },
    );
  }

  void ocultarLoading(BuildContext context) {
    Navigator.pop(context); // Cierra el diálogo de loading
  }
}
