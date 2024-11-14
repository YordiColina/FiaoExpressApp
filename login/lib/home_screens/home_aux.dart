

import 'package:flutter/material.dart';

class HomeAux extends StatefulWidget {
  const HomeAux({super.key});

  @override
  State<HomeAux> createState() => _HomeAuxState();
}

class _HomeAuxState extends State<HomeAux> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.15),
      child: const SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
