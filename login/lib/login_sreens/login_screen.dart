import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.1),
                child: Column(
                  children: [
                    Container(
                      child: Image.asset('packages/login/assets/images/fiaologo.PNG'),
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("FIAO",style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Dorgan',
                        ),
                        ),
                        Text("EXPRESS",style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Dorgan',
                        ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20
                    ),

                    TextField(

                      decoration: InputDecoration(

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
                          borderSide: BorderSide(
                            color: Colors.white, // Color del borde
                            width: 2.0, // Ancho del borde
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 20
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
                          borderSide: BorderSide(
                            color: Colors.white, // Color del borde
                            width: 2.0, // Ancho del borde
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
