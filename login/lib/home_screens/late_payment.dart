
import 'package:flutter/material.dart';

class LatePayment extends StatefulWidget {
  const LatePayment({super.key});

  @override
  State<LatePayment> createState() => _LatePaymentState();
}

class _LatePaymentState extends State<LatePayment> {
  @override
  Widget build(BuildContext context) {
    TextEditingController lateDaysController = TextEditingController();
    TextEditingController latePayController = TextEditingController();
    return Padding(
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
    );
  }
}
