import 'package:flutter/material.dart';

import 'login_body.dart';


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
          color: Color(0xFFF3E239),
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
                         borderRadius: BorderRadius.circular(20)
                         ),

                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('packages/login/assets/images/fiao.png',scale: 1.1,fit: BoxFit.cover))

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
