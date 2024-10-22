
import 'package:flutter/material.dart';

class PaymentAdditionalFees extends StatefulWidget {
  const PaymentAdditionalFees({super.key});

  @override
  State<PaymentAdditionalFees> createState() => _PaymentAdditionalFeesState();
}

class _PaymentAdditionalFeesState extends State<PaymentAdditionalFees> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
