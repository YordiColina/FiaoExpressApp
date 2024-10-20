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
                    Text("FiaoExpressApp",style: TextStyle(
                      color: Colors.lime[400],
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),)
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
