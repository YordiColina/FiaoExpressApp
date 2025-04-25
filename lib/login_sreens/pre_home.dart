import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../data/service/FCM_service.dart';
import '../home_screens/categories_screen.dart';
import '../home_screens/home_aux.dart';
import '../home_screens/home_bloc/home_bloc.dart';
import '../home_screens/profile_screen.dart';
import '../home_screens/sign_out_screen.dart';
import '../utils/firebase_service.dart';

class PreHome extends StatefulWidget {
  final String email;
  final NotificationService notificationService;
  const PreHome({super.key, required this.email,required this.notificationService});

  @override
  State<PreHome> createState() => _PreHomeState();
}

class _PreHomeState extends State<PreHome> {
  TextEditingController searchController = TextEditingController();

  late HomeBloc homeBloc ;
  bool twoProducts = false;
  LoginBloc bloc = LoginBloc();
  String assetPDFPath = "";
  String assetPDFPath2 = "";
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
    homeBloc = BlocProvider.of<HomeBloc>(context);
    getToken();
    _requestPermission();
    homeBloc.getFileFromAsset("assets/linea_blanca.pdf").then((f) {
      setState(() {
        assetPDFPath = f.path;
        print(assetPDFPath);
      });
    });
    homeBloc.getFileFromAsset2("assets/CATALOGO_2025.pdf").then((f) {
      setState(() {
        assetPDFPath2 = f.path;
        print(assetPDFPath);
      });
    });

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

            if (aux < 3) {
              getproductslenght(state.status ?? false);
            }

          return Stack(
            children: [
              Container(
                height: 220,
                color: const Color(0xFFF0e23b),
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
                                  height: 50,
                                  width: 120,
                                  child: ClipRRect(
                                      child: Image.asset(
                                          'assets/images/FIAOEXPRESS_LOGO.jpg',

                                          fit: BoxFit.cover))),
                              const SizedBox(
                                width: 5,
                              ),

                            ],
                          ),
                           Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                   Visibility(
                                      visible: state.notificationStatus ?? false,
                                     child: Padding(
                                       padding: const EdgeInsets.only(top:6,left: 8),
                                       child: Container(
                                         height: 10,
                                          width: 10,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(20),
                                           color: Colors.red,

                                         ),
                                       ),
                                     ),
                                   ),
                                    IconButton(onPressed: () {
                                      homeBloc.add(NewNotificationRead( false,context));
                                    }, icon: const Icon(Icons.notifications_outlined)),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),

                                    child: ClipRRect(

                                        child: Image.asset('assets/images/social.png',
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
                    state.userDataController != null ? Padding(
                      padding: const EdgeInsets.only(left: 30,top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Hola,",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'WHOAA',
                                fontWeight: FontWeight.w600,
                                fontSize: 35),
                          ),
                           Text(
                           "${state.userDataController?[0].text.split(" ").first}!" ?? "usuario!",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 35),
                          ),
                          IconButton(onPressed: (){

                          }, icon: const Icon(Icons.arrow_forward_ios,size: 15,color: Colors.black,) )
                        ],
                      ),
                    ): const CircularProgressIndicator()
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.23),
                child: Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      color: const Color(0xFFEBEBEB),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 25, right: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 60),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: const Text(
                              "Resumen",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 10),
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

                              ],
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
                                    MaterialPageRoute(builder: (context) => CategoriesScreen(assetPDFPath: assetPDFPath, assetPDFPath2: assetPDFPath2 ,)));
                              }, icon:  Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)
                                  ),

                                  child: ClipRRect(
                                      child: Image.asset('assets/images/products.png',scale: 1.1,fit: BoxFit.contain))

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

                                      child: Image.asset('assets/images/person.png',scale: 1.1,fit: BoxFit.cover))

                              ),)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
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
    print(controllers.length);
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.grey,
                      width: 0.2
                    ),
                    color: Color(0xFFF4F4F4)),
                child: Image.asset(
                    'assets/images/fiaoff.png',
                    width: 50,
                    height: 20,
                    scale: 1.2,
                    fit: BoxFit.scaleDown)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 10),
            child: Stack(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: Row(
                      children: [
                        Text(
                          controllers.isNotEmpty
                              ? "${controllers[12].text}-"
                              : "Jaguar Tr150-",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),

                        Text(
                          controllers.isNotEmpty?
                        controllers[13].text : "moto" ,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 23),
                  child: Row(
                    children: [
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                    ),
                      Text(
                        controllers.isNotEmpty
                            ? " PLAN ${controllers[8].text.toUpperCase()}"
                            : "PLAN PlANIFICADO",
                        style: const TextStyle(
                          color: Color.fromRGBO(136, 136, 136, 10),
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w800,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50,left: 7),
                  child: Container(
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
                            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFF3E239),),
                          ),
                        ),
                       Text(
                        controllers.isNotEmpty ?  "CUOTAS: ${controllers[18].text}/${controllers[15].text}": "20/50",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color.fromRGBO(136, 136, 136, 10), // Contraste con la barra
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 150),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(onPressed: () {

                    }, icon: const Icon(Icons.arrow_forward_ios,size: 20,), color: Colors.black,),
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

      aux++;


  }
}

