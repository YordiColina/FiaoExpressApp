import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/home_screens/client_data.dart';
import 'package:login/home_screens/contract_data.dart';
import 'package:login/home_screens/importan_milestones_dates.dart';
import 'package:login/home_screens/initial_invertion.dart';
import 'package:login/home_screens/motorcycle_delivery_data.dart';
import 'package:login/home_screens/payment_additional_fees.dart';
import 'package:login/home_screens/selection_group_description.dart';

import 'late_payment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController contractNumberController = TextEditingController();
TextEditingController contractDateController = TextEditingController();
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
TextEditingController subtotalController = TextEditingController();
TextEditingController lateDaysController = TextEditingController();
TextEditingController latePayController = TextEditingController();
TextEditingController faseController = TextEditingController();
TextEditingController nextPayController = TextEditingController();
TextEditingController nextAwardController = TextEditingController();
TextEditingController nextdeliverDateController = TextEditingController();
TextEditingController deliveryDateController = TextEditingController();
TextEditingController plateController = TextEditingController();
TextEditingController colorController = TextEditingController();
TextEditingController motorSerialController = TextEditingController();
TextEditingController bodySerialController = TextEditingController();
TextEditingController observationController = TextEditingController();
TextEditingController ubicationController = TextEditingController();
TextEditingController searchController = TextEditingController();
TextEditingController deleteController = TextEditingController();
bool toEdit = false;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width *0.15 ),
        child:  SingleChildScrollView(
          child: Column(
            children: [
          Padding(
          padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.050,
            right: MediaQuery.of(context).size.width *0.050),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                signOut(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: const Text("Cerrar sesión",style:
                  TextStyle(
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
            const Center(
              child: Text("Registro de Clientes", style:TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                fontFamily: 'Dorgan',
                fontStyle: FontStyle.italic,
              ),),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width *0.40),
              child: const Text("Datos del contrato",style: TextStyle(
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
                child: const Text("Contrato No",style:
                TextStyle(
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
                child: const Text("Fecha de contrato",style:
                TextStyle(
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
              keyboardType: TextInputType.datetime,
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
                child: const Text("Asesor",style:
                TextStyle(
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.050,
            right: MediaQuery.of(context).size.width *0.050),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width *0.40),
              child: const Text("Datos del cliente",style: TextStyle(
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
                child: const Text("Nombre",style:
                TextStyle(
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
                child: const Text("Cédula",style:
                TextStyle(
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
                child: const Text("Teléfono",style:
                TextStyle(
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
                child: const Text("Dirección",style:
                TextStyle(
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.050,
            right: MediaQuery.of(context).size.width *0.050),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width *0.40),
              child: const Text("Descripción del grupo seleccionado",style: TextStyle(
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
                child: const Text("Grupo",style:
                TextStyle(
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
                child: const Text("Modelo de moto",style:
                TextStyle(
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
                child: const Text("Marca",style:
                TextStyle(
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
                hintText: "Marca",
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
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.050,
            right: MediaQuery.of(context).size.width *0.050),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width *0.40),
              child: const Text("Inversión inicial",style: TextStyle(
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
                child: const Text("Cuota No",style:
                TextStyle(
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
                hintText: "Cuota No",
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

            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text("GastosADM",style:
                TextStyle(
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
              keyboardType: TextInputType.number,
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.050,
            right: MediaQuery.of(context).size.width *0.050),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width *0.40),
              child: const Text("Pago de cuotas adicionales",style: TextStyle(
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
                child: const Text("No de cuotas",style:
                TextStyle(
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
                hintText: "No de cuotas",
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

            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text("Subtotal",style:
                TextStyle(
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
              keyboardType: TextInputType.number,
              controller: subtotalController,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                fontFamily: 'Dorgan',
                fontStyle: FontStyle.italic,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Subtotal",
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
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.050,
            right: MediaQuery.of(context).size.width *0.050),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width *0.40),
              child: const Text("Pago de morosidad",style: TextStyle(
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
                child: const Text("Días de retraso",style:
                TextStyle(
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
                child: const Text("Morosidad",style:
                TextStyle(
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.050,
            right: MediaQuery.of(context).size.width *0.050),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width *0.40),
              child: const Text("Fechas de hitos importantes",style: TextStyle(
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
                child: const Text("Fase",style:
                TextStyle(
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
              controller: faseController,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                fontFamily: 'Dorgan',
                fontStyle: FontStyle.italic,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "fase",
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

            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text("Fecha próximo pago",style:
                TextStyle(
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
              keyboardType: TextInputType.datetime,
              controller: nextPayController,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                fontFamily: 'Dorgan',
                fontStyle: FontStyle.italic,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Fecha próximo pago",
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

            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text("Fecha próxima adjudicación",style:
                TextStyle(
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
              keyboardType: TextInputType.datetime,
              controller: nextAwardController,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                fontFamily: 'Dorgan',
                fontStyle: FontStyle.italic,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Fecha próxima adjudicación",
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

            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text("Fecha próxima entrega",style:
                TextStyle(
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
              keyboardType: TextInputType.datetime,
              controller: nextdeliverDateController,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                fontFamily: 'Dorgan',
                fontStyle: FontStyle.italic,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Fecha próxima entrega",
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
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.050,
            right: MediaQuery.of(context).size.width *0.050),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width *0.40),
              child: const Text("Datos de entrega de la moto",style: TextStyle(
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
                child: const Text("Fecha de entrega",style:
                TextStyle(
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
              keyboardType: TextInputType.datetime,
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
                child: const Text("Color",style:
                TextStyle(
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
                child: const Text("Serial motor",style:
                TextStyle(
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
                child: const Text("Serial carrorería",style:
                TextStyle(
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
                child: const Text("Placa",style:
                TextStyle(
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
                child: const Text("Observación",style:
                TextStyle(
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
              controller: observationController ,
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
                  borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
              Padding(
                padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.050,
                    right: MediaQuery.of(context).size.width *0.050),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width *0.60),
                      child: const Text("Ubicación",style: TextStyle(
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
                        child: const Text("Ciudad",style:
                        TextStyle(
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
                        hintText: "Ciudad",
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

                    const SizedBox(
                      height: 10,
                    ),

                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                  crearDocumentoEnFirestore();
              },
                  style:  ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300]
                  ),
                  child: const Text(" Crear cliente",style:
                  TextStyle(
                    color: Colors.black,
                    fontFamily: 'Dorgan',
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                  ))),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                  cleanFields();
                  },
                  style:  ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300]
                  ),
                  child: const Text(" Limpiar campos",style:
                  TextStyle(
                    color: Colors.black,
                    fontFamily: 'Dorgan',
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                  ))),

              const SizedBox(
                height: 10,
              ),

              ElevatedButton(
                  onPressed: () {
                  obtenerYGuardarDatos(searchController.text);
                  },
                  style:  ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300]
                  ),
                  child: const Text(" Consultar cliente",style:
                  TextStyle(
                    color: Colors.black,
                    fontFamily: 'Dorgan',
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                  ))),

              const SizedBox(
                height: 10,
              ),

              Padding(
                padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.050, right: MediaQuery.of(context).size.width *0.050 ),
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
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text("Si quieres editar, primero consulta el cliente ingresando su cédula en el campo y luego presiona el botón de 'Consultar cliente', procede a editar los campos que desees y guarda los cambios en el botón 'Editar cliente' ",style:
                  TextStyle(
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
               const SizedBox(
                 height: 10,
               ),
              ElevatedButton(
                  onPressed: () {
                    crearDocumentoEnFirestore();
                    setState(() {
                      toEdit = true;
                    });
                  },
                  style:  ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300]
                  ),
                  child: const Text("Editar cliente",style:
                  TextStyle(
                    color: Colors.black,
                    fontFamily: 'Dorgan',
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                  ))),

              const SizedBox(
                height: 10,
              ),

              ElevatedButton(
                  onPressed: () {
                   eliminarDocumentoPorId(deleteController.text);
                  },
                  style:  ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300]
                  ),
                  child: const Text(" Eliminar cliente",style:
                  TextStyle(
                    color: Colors.black,
                    fontFamily: 'Dorgan',
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                  ))),

              const SizedBox(
                height: 10,
              ),

              Padding(
                padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.050, right: MediaQuery.of(context).size.width *0.050 ),
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
                height: 30,
              ),




            ],
          ),
        ),
      )
    );
  }
  Future<void> crearDocumentoEnFirestore(

  ) async {
    mostrarLoading(context);
    // Referencia a la colección donde se almacenarán los documentos
    CollectionReference clientes = FirebaseFirestore.instance.collection(
        'clientes');
    if (contractNumberController.text != "" &&
        contractDateController.text != "" && adviserController.text != ""
        && nameController.text != "" && identificationController.text != "" &&
        phoneController.text != "" &&
        addressController.text != "" && groupController.text != "" &&
        modelController.text != "" && brandController.text != ""
        && feesController.text != "" && admBillsController.text != "" &&
        fleesNumberController.text != "" &&
        subtotalController.text != "" && lateDaysController.text != "" &&
        latePayController.text != "" &&
        faseController.text != "" && nextPayController.text != "" &&
        nextAwardController.text != "" &&
        nextdeliverDateController.text != "" &&
        deliveryDateController.text != "" && colorController.text != "" &&
        motorSerialController.text != "" && bodySerialController.text != "" &&
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
          'dirección': addressController.text,
        };

        Map<String, dynamic> descripcion_del_grupo_seleccionado = {
          'grupo': groupController.text,
          'modelo_de_moto': modelController.text,
          'marca': brandController.text,
        };

        Map<String, dynamic> inversionInicial = {
          'cuota_no': feesController.text,
          'gastosADM': admBillsController.text,

        };

        Map<String, dynamic> pagoDeCuotasAdicionales = {
          'no_de_cuotas': fleesNumberController.text,
          'subtotal': subtotalController.text,

        };

        Map<String, dynamic> pago_de_morosidad = {
          'díasDeRetraso': lateDaysController.text,
          'morosidad': latePayController.text,

        };

        Map<String, dynamic> fechas_de_hitos_importantes = {
          'fase': faseController.text,
          'fecha_proximo_pago': nextPayController.text,
          'fecha_proxima_adjudicacion': nextAwardController.text,
          'fecha_proxima_entrega': nextdeliverDateController.text,
        };

        Map<String, dynamic> datos_de_entrega_de_la_moto = {
          'fecha_de_entrega': deliveryDateController.text,
          'color': colorController.text,
          'serialMotor': motorSerialController.text,
          'serialCarroceria': bodySerialController.text,
          'placa': plateController.text,
          'observacion': observationController.text
        };

        Map<String, dynamic> ubicacion = {
          'ciudad': ubicationController.text,

        };

        // Combina los dos mapas en un solo documento
        Map<String, dynamic> documentoCompleto = {
          'datosContrato': datosContrato,
          'datosCliente': datosCliente,
          'descripcion_del_grupo_seleccionado': descripcion_del_grupo_seleccionado,
          'inversion_inicial': inversionInicial,
          'pago_de_cuotas_adicionales': pagoDeCuotasAdicionales,
          'pago_de_morosidad': pago_de_morosidad,
          'fechas_de_hitos_importantes': fechas_de_hitos_importantes,
          'datos_de_entrega_de_la_moto': datos_de_entrega_de_la_moto,
          'ubicacion': ubicacion,
        };

        // Agrega el documento a Firestore
        await clientes.doc(identificationController.text).set(
            documentoCompleto);
        ocultarLoading(context);
        print('Documento creado exitosamente');
        mostrarFlushbar(context, toEdit ? "Cliente editado exitosamente": "Cliente creado exitosamente", false);
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
          subtotalController.text = "";
          lateDaysController.text = "";
          latePayController.text = "";
          faseController.text = "";
          nextPayController.text = "";
          nextAwardController.text = "";
          nextdeliverDateController.text = "";
          deliveryDateController.text = "";
          plateController.text = "";
          colorController.text = "";
          motorSerialController.text = "";
          bodySerialController.text = "";
          observationController.text = "";
          ubicationController.text = "";
        });


      } catch (e) {
        ocultarLoading(context);
        mostrarFlushbar(context, "Error al crear cliente", true);
        print('Error al crear el documento: $e');
      }
    }
  }

  Future<void> obtenerYGuardarDatos(String contratoNo) async {
    CollectionReference clientes = FirebaseFirestore.instance.collection('clientes');
   mostrarLoading(context);
    try {
      // Realiza la consulta para obtener el documento con el número de contrato
      QuerySnapshot querySnapshot = await clientes.where('datosCliente.cédula', isEqualTo: searchController.text).get();

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
            addressController.text = clientData['dirección'];

            Map<String, dynamic> selectedGroup = datos['descripcion_del_grupo_seleccionado'];
            groupController.text = selectedGroup['grupo'];
            modelController.text = selectedGroup['modelo_de_moto'];
            brandController.text = selectedGroup['marca'];

            Map<String, dynamic> initialInversion = datos['inversion_inicial'];
           feesController.text = initialInversion['cuota_no'];
           admBillsController.text = initialInversion['gastosADM'];


            Map<String, dynamic> feesAditionalPay = datos['pago_de_cuotas_adicionales'];
            fleesNumberController.text = feesAditionalPay['no_de_cuotas'];
            subtotalController.text = feesAditionalPay['subtotal'];


            Map<String, dynamic> latePayment = datos['pago_de_morosidad'];
            lateDaysController.text = latePayment['díasDeRetraso'];
            latePayController.text =latePayment['morosidad'];


            Map<String, dynamic> importantDates = datos['fechas_de_hitos_importantes'];
            faseController.text = importantDates['fase'];
            nextAwardController.text = importantDates['fecha_proxima_adjudicacion'];
            nextPayController.text = importantDates['fecha_proximo_pago'];
            nextdeliverDateController.text = importantDates['fecha_proxima_entrega'];

            Map<String, dynamic> bikeDeliveryData = datos['datos_de_entrega_de_la_moto'];
            colorController.text = bikeDeliveryData['color'];
            deliveryDateController.text = bikeDeliveryData['fecha_de_entrega'];
            motorSerialController.text = bikeDeliveryData['serialMotor'];
            bodySerialController.text = bikeDeliveryData['serialCarroceria'];
            plateController.text = bikeDeliveryData['placa'];
           observationController.text = bikeDeliveryData['observacion'];

            Map<String, dynamic> ubicationData = datos['ubicacion'];
            ubicationController.text = ubicationData['ciudad'];

            searchController.text = "";
            mostrarFlushbar(context, "Cliente encontrado", false);
          });
        }
      } else {
        ocultarLoading(context);
        mostrarFlushbar(context, "Cliente no encontrado", true);
        print('No se encontró ningún documento con el número de contrato: $contratoNo');
      }
    } catch (e) {
      ocultarLoading(context);
      print(searchController.text);
      mostrarFlushbar(context, "Error al consultar cliente", true);
      print('Error al obtener los datos: $e');
    }
  }

  Future<void> eliminarDocumentoPorId(String documentId) async {
    CollectionReference clientes = FirebaseFirestore.instance.collection('clientes');
    mostrarLoading(context);
    try {
      // Elimina el documento usando su ID
      await clientes.doc(documentId).delete();
      ocultarLoading(context);
      mostrarFlushbar(context, "Cliente eliminado ${deleteController.text} exitosamente", false);
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
      subtotalController.text = "";
      lateDaysController.text = "";
      latePayController.text = "";
      faseController.text = "";
      nextPayController.text = "";
      nextAwardController.text = "";
      nextdeliverDateController.text = "";
      deliveryDateController.text = "";
      plateController.text = "";
      colorController.text = "";
      motorSerialController.text = "";
      bodySerialController.text = "";
      observationController.text = "";
      ubicationController.text = "";
    });
  }

  void mostrarFlushbar(BuildContext context, String message, bool fail) {
    Flushbar(
      message: message,
      messageColor: fail ? Colors.red : Colors.white,
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP, // Sale desde arriba
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
