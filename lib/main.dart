import 'package:fiao_express_app/utils/firebase_local_notifications.dart';
import 'package:fiao_express_app/utils/firebase_service.dart';
import 'package:fiao_express_app/utils/notification_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'home_screens/home_bloc/home_bloc.dart';
import 'home_screens/home_screen.dart';
import 'home_screens/profile_screen.dart';
import 'login_sreens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  notificationService.initializeNotifications();
  FirebaseNotifications().initialize();

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(notificationService),
        ),
      ],
      child: MyApp(),
    ),
  );
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Mensaje recibido en segundo plano: ${message.notification?.title}");
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationService().initializeNotifications();
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(notificationService),
          ),
        ],
    child:  MaterialApp(
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
  ),
    );
  }
}
