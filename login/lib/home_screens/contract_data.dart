

import 'package:flutter/material.dart';

class ContractData extends StatefulWidget {
  const ContractData({super.key});

  @override
  State<ContractData> createState() => _ContractDataState();
}

class _ContractDataState extends State<ContractData> {
  TextEditingController contractNumberController = TextEditingController();
  TextEditingController contractDateController = TextEditingController();
  TextEditingController adviserController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.050,
          right: MediaQuery.of(context).size.width *0.050),
      child: Column(
        children: [
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
    );
  }
}
