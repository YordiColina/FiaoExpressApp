import 'package:flutter/material.dart';
import 'package:login/login_sreens/login_body.dart';

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
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.1),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                         border: Border.all(color: Colors.white),
                         borderRadius: BorderRadius.circular(20)
                         ),

                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('packages/login/assets/images/newlogo.jpg',scale: 1.5,fit: BoxFit.cover))

                      ),
                       const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("FIAO",style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Dorgan',
                          ),
                          ),
                          Text("EXPRESS",style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Dorgan',
                          ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60
                      ),
                      const LoginBody(),
                      const SizedBox(
                          height: 40
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
