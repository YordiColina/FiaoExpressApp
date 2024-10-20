import 'package:flutter/material.dart';
import 'package:login/login_sreens/login_body.dart';
import 'package:login/login_sreens/login_buttons.dart';

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
          color: Colors.black
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.1),
                child: Column(
                  children: [
                    Image.asset('packages/login/assets/images/fiaologo.PNG'),
                     const Row(
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
                    const SizedBox(
                      height: 80
                    ),
                    const LoginBody(),
                    const SizedBox(
                        height: 40
                    ),
                    const LoginButtons()
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
