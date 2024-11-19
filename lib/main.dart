import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/home_screens/home_screen.dart';
import 'package:login/login_sreens/login_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login', // Ruta inicial de la aplicación
      routes: {
        '/login': (context) => const Loginscreen(), // Definición de la ruta para la pantalla de login
        '/home': (context) => const HomeScreen(),  // Aquí deberías definir tu pantalla principal
        // Puedes agregar más rutas para otras pantallas aquí
      },
    );
  }
}
