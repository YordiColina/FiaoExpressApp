import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/service/FCM_service.dart';
import 'package:login/home_screens/add_product.dart';
import 'package:login/home_screens/home_aux.dart';
import 'package:login/login_sreens/notifications_admin.dart';
import '../bloc/login_bloc.dart';
import '../home_screens/home_bloc/home_bloc.dart';

class PreHome extends StatefulWidget {
  const PreHome({super.key});

  @override
  State<PreHome> createState() => _PreHomeState();
}

class _PreHomeState extends State<PreHome> {
  TextEditingController searchController = TextEditingController();
  HomeBloc homeBloc = HomeBloc();
  bool twoProducts = false;
  LoginBloc bloc = LoginBloc();
  String userEmail = "";
  bool canCreate = false;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  bool threeProducts = false;
  int listSize = 0;
  List<TextEditingController> controllers = [];
  bool emptySearch = true;

  @override
  void initState() {
    getToken();
    _requestPermission();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Mensaje clickeado: ${message.notification?.title}');
      // Aquí puedes redirigir al usuario a otra pantalla
    });
    if (searchController.text.isNotEmpty) {
      controllers.add(searchController);
      homeBloc.add(SetValuesEvent(controllers, context));
    }

    userEmail = bloc.getCurrentUserEmail();
    print(userEmail);
    if (userEmail != "fiaoexpressapp@gmail.com") {
      canCreate = false;
    } else {
      canCreate = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: ((context) => homeBloc),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                height: 170,
                color: const Color.fromRGBO(243, 226, 57, 95),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 20,
                                  child: ClipRRect(
                                      child: Image.asset(
                                          'packages/login/assets/images/fiao.png',
                                          scale: 5.5,
                                          fit: BoxFit.cover))),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "FIAO",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Dorgan',
                                ),
                              ),
                              const Text(
                                "EXPRESS",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Dorgan',
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                Icon(Icons.notifications),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(Icons.access_alarm_outlined),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(Icons.logout),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hola,",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                          Text(
                            "Yordi!",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 22),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.17),
                child: Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 30, right: 20),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Resumen",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dorgan',
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: productCard(controllers),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ));
  }

  Widget productCard(List<TextEditingController> controllers) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.grey),
                    color: const Color.fromRGBO(244, 244, 244, 100)),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                      child: Image.asset(
                          'packages/login/assets/images/fiaoff.png',
                          width: 50,
                          height: 20,
                          scale: 1,
                          fit: BoxFit.none)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 10),
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          controllers.isNotEmpty
                              ? controllers[3].text
                              : "Jaguar Tr150-",
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Dorgan',
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        Text(
                          controllers.isNotEmpty ? controllers[13].text : "Toro",
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Dorgan',
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      controllers.isNotEmpty
                          ? controllers[8].text
                          : "PLAN PlANIFICADO",
                      style: const TextStyle(
                        color: Color.fromRGBO(136, 136, 136, 10),
                        fontFamily: 'Dorgan',
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 150, // Ajusta el ancho según lo que necesites
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300], // Color de fondo
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: LinearProgressIndicator(
                              value: 20 / 50, // Progreso dinámico (20 cuotas de 50)
                              minHeight: 25,
                              backgroundColor: Colors.grey[300],
                              valueColor: const AlwaysStoppedAnimation<Color>(Color.fromRGBO(243, 226, 57, 95)),
                            ),
                          ),
                          const Text(
                            "Cuotas: 20/50",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(136, 136, 136, 10), // Contraste con la barra
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 150),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(onPressed: () {

                    }, icon: const Icon(Icons.arrow_forward_ios)),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  void _requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Permisos otorgados');
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      print('Permisos denegados');
    }
  }

  void getToken() async {
    String? token = await messaging.getToken();
    print("FCM Token: $token");
  }
}
