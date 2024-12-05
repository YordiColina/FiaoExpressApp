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
    if(searchController.text.isNotEmpty) {
      controllers.add(searchController);
      homeBloc.add(SetValuesEvent(controllers, context));
    }

    userEmail = bloc.getCurrentUserEmail();
    print(userEmail);
    if(userEmail != "fiaoexpressapp@gmail.com") {
      canCreate = false;
    } else {
      canCreate = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: ((context) => homeBloc),
          ),
        ],
        child:  BlocBuilder<HomeBloc, HomeState>(

          builder: (context, state) {
       return Padding(
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.09,
            right: MediaQuery.of(context).size.width * 0.09,
            top: MediaQuery.of(context).size.height * 0.25),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
              "Ingresa tu numero de Cédula",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Dorgan',
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: searchController,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                fontFamily: 'Dorgan',
                fontStyle: FontStyle.italic,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Ingresa tu cédula",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Dorgan',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  // Esquinas redondeadas
                  borderSide: const BorderSide(
                    color: Colors.white, // Color del borde
                    width: 2.0, // Ancho del borde
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  if(value.isNotEmpty && value != "") {
                    emptySearch = false;
                    print("your mom");
                  } else {
                    emptySearch = true;
                  }
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: true,
              child: ElevatedButton(
                  onPressed: () async {
                    if(searchController.text.isNotEmpty) {
                      FCMService().obtenerYActualizarToken(searchController.text);
                      controllers.add(searchController);
                      homeBloc.add(SetValuesEvent(controllers,context));
                     twoProducts = await homeBloc.checkProduct(2, searchController);
                     threeProducts = await homeBloc.checkProduct(3, searchController);
                     setState(() {
                       if(state.status == true && !twoProducts && !threeProducts) {
                         listSize = 1;
                       } else if (twoProducts && !threeProducts) {
                         listSize = 2;
                         homeBloc.add(GetProductEvent(controllers, context, listSize));
                         print("MANDAMOS EL 2");
                       } else if(threeProducts) {
                         listSize = 3;
                         homeBloc.add(GetProductEvent(controllers, context, listSize-2));
                         homeBloc.add(GetProductEvent(controllers, context, listSize-1));
                         homeBloc.add(GetProductEvent(controllers, context, listSize));
                       } else {
                         listSize = 0;
                       }
                     });

                     print("se encontro 2 productos $twoProducts y tres? $threeProducts");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black)),
                  child: const Text(" Cargar ",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Dorgan',
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                      ))),
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: canCreate && emptySearch,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BlocProvider.value(
                              value: homeBloc,
                              child:  HomeAux(clientData: state.fieldsController ?? [],indexProduct: 0,)
                          )

                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black)
                      ),
                      child: const Text(" Crear cliente ",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Dorgan',
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ))),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),

            Visibility(
              visible: canCreate,
              child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BlocProvider.value(
                          value: homeBloc,
                          child:  NotificationScreen()
                      )

                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black)
                  ),
                  child: const Text("Crear notificación",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Dorgan',
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                      ))),
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: state.status == true,
              child: Expanded(
                child: ListView(
                  children: List.generate(
                    listSize,
                        (index) =>
                       Column(
                         children: [
                           GestureDetector(
                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => BlocProvider.value(
                                   value: homeBloc,
                                     child: index == 0 ? HomeAux(clientData: state.fieldsController ?? [],indexProduct: index,) :
                                         index == 1 ? HomeAux(clientData: state.productTwoData ?? [],indexProduct: index+1,) :
                                         HomeAux(clientData: state.productThreeData ?? [],indexProduct: index+1,)
                                 )

                                 ),
                               );
                             },
                               child: index == 0 ? productCard(state.fieldsController ?? []) :
                               index  == 1 ? productCard(state.productTwoData ?? []) : productCard(state.productThreeData ?? [])


                           ),
                           const SizedBox(
                             height: 20,
                           ),
                           Visibility(
                             visible: index == listSize -1 && listSize != 0,
                               child: GestureDetector(
                                 onTap: () {
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context) => BlocProvider.value(
                                         value: homeBloc,
                                         child:  AddProduct(clientData: state.fieldsController ?? [] ,indexProduct: listSize == 1 ? 2 : 3,))),
                                   );
                                 },
                                 child: Container(
                                     height: 50,
                                     width: 50,
                                     decoration: BoxDecoration(
                                       border: Border.all(color: Colors.black),
                                       borderRadius: BorderRadius.circular(50)

                                     ),
                                     child: const Icon(Icons.add,size: 50,)),
                               ))
                         ],
                       )
                        ),
                  ),
                ),
            ),
          ],
        ),
      );
  },
  ),

  )
    );
  }

  Widget productCard (List<TextEditingController> controllers) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black)
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(controllers.isNotEmpty ? controllers[3].text :"nombre",style:const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Dorgan',
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                  ) ,),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(controllers.isNotEmpty ? controllers[13].text :"Moto",style:const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Dorgan',
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                  ) ,),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(controllers.isNotEmpty ? controllers[8].text : "plan",style:const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Dorgan',
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                ) ,),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(controllers.isNotEmpty ? controllers[12].text : "modelo",style:const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Dorgan',
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                ) ,),
              )
            ],
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
