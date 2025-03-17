import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/home_screens/profile_screen.dart';
import '../bloc/login_bloc.dart';
import '../data/service/FCM_service.dart';
import '../home_screens/categories_screen.dart';
import '../home_screens/home_aux.dart';
import '../home_screens/home_bloc/home_bloc.dart';
import '../home_screens/sign_out_screen.dart';

class PreHome extends StatefulWidget {
  final String email;
  const PreHome({super.key, required this.email});

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
  String userId = "";
  int aux = 0;
  List<TextEditingController> controllers = [];
  List<TextEditingController> userController = [];
  bool emptySearch = true;

  @override
  void initState() {
    getToken();
    _requestPermission();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Mensaje clickeado: ${message.notification?.title}');
      // Aquí puedes redirigir al usuario a otra pantalla
    });
    _getUserId();

    homeBloc.add(GetUserDataEvent(userController, context, widget.email));

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
        if(aux < 3) {
          getproductslenght(state.status ?? false);
        }
          return Stack(
            children: [
              Container(
                height: 170,
                color: const Color.fromRGBO(243, 226, 57, 1),
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
                           Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                const Icon(Icons.notifications_none_outlined),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),

                                    child: ClipRRect(

                                        child: Image.asset('packages/login/assets/images/social.png',
                                            scale: 1.1,fit: BoxFit.cover, color: Colors.black,))

                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                IconButton(onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => const SignOutScreen()));

                                }, icon: const Icon(Icons.logout))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: state.userDataController != null ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Hola,",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                           Text(
                           state.userDataController?[0].text ?? "usuario!",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 22),
                          ),
                          IconButton(onPressed: (){

                          }, icon: const Icon(Icons.arrow_forward_ios,size: 15,color: Colors.black,) )
                        ],
                      ): const CircularProgressIndicator()
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
                        const EdgeInsets.only(left: 20, top: 60, right: 20),
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
                        Expanded(
                          child: ListView(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => BlocProvider.value(
                                      value: homeBloc,
                                      child:HomeAux(clientData: state.fieldsController ?? [],indexProduct: 0,))));
                                },
                                child: Container(
                                  child: state.fieldsController != null? productCard(state.fieldsController ?? []): Container()
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              Visibility(
                                visible: twoProducts,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => BlocProvider.value(
                                        value: homeBloc,
                                        child:  HomeAux(clientData: state.productTwoData ?? [],indexProduct: 2))));
                                  },
                                  child: Container(
                                      child: state.fieldsController != null? productCard(state.productTwoData ?? []): Container()
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Visibility(
                                visible: threeProducts,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => BlocProvider.value(
                                        value: homeBloc,
                                        child:  HomeAux(clientData: state.productThreeData ?? [],indexProduct: 3,))));
                                  },
                                  child: Container(
                                      child: state.fieldsController != null? productCard(state.productThreeData ?? []): Container()
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => const CategoriesScreen()));
                                    }, icon:  Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20)
                                        ),

                                        child: ClipRRect(
                                            child: Image.asset('packages/login/assets/images/products.png',scale: 1.1,fit: BoxFit.contain))

                                    ),),
                                    IconButton(onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => ProfileScreen(
                                            nombre: state.userDataController?[0].text ?? "usuario!",
                                            cedula: userId ?? "1234",
                                            correo: widget.email,
                                            direccion: state.fieldsController?[7].text ?? "",
                                            telefono: state.fieldsController?[5].text ?? "",
                                          )));
                                    }, icon:  Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20)
                                        ),

                                        child: ClipRRect(

                                            child: Image.asset('packages/login/assets/images/person.png',scale: 1.1,fit: BoxFit.cover))

                                    ),)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        

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
    print(controllers.length);
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
                              ? "${controllers[12].text}-"
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
                          controllers.isNotEmpty?
                        controllers[13].text : "moto" ,
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
                          ? "PLAN ${controllers[8].text.toUpperCase()}"
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
                              value: controllers.isNotEmpty ?
                              int.parse(controllers[18].text) / int.parse(controllers[15].text): 20/50,// Progreso dinámico (20 cuotas de 50)
                              minHeight: 25,
                              backgroundColor: Colors.grey[300],
                              valueColor: const AlwaysStoppedAnimation<Color>(Color.fromRGBO(243, 226, 57, 0.95)),
                            ),
                          ),
                         Text(
                          controllers.isNotEmpty ?  "Cuotas: ${controllers[18].text}/${controllers[15].text}": "20/50",
                            style: const TextStyle(
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
  void _getUserId() async {
      userId = await  homeBloc.getCurrentId(widget.email);
      print(userId);
      if (userId != "") {
        print("si pasoooooopo");
        searchController.text = userId;
        controllers.add(searchController);
        homeBloc.add(SetValuesEvent(controllers, context));
      }
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


  Future<void> getproductslenght(bool status) async {
    if(searchController.text.isNotEmpty) {
      if(!canCreate) {
        FCMService().obtenerYActualizarToken(searchController.text);
      }
      controllers.add(searchController);
      homeBloc.add(SetValuesEvent(controllers,context));
      twoProducts = await homeBloc.checkProduct(2, searchController);
      threeProducts = await homeBloc.checkProduct(3, searchController);
      setState(() {
        if(status == true && !twoProducts && !threeProducts) {
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
    setState(() {
      aux++;
    });

  }
}

