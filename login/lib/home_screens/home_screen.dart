import 'package:cloud_firestore/cloud_firestore.dart';
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

            TextField(
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

            TextField(
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
            TextField(
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

            TextField(
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

            TextField(
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

            TextField(
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

            TextField(
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

            TextField(
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

            TextField(
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

            TextField(
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
            TextField(
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

            TextField(
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
                  )))

            ],
          ),
        ),
      )
    );
  }
  Future<void> crearDocumentoEnFirestore(

  ) async {
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

        print('Documento creado exitosamente');
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
        print('Error al crear el documento: $e');
      }
    }
  }


}
