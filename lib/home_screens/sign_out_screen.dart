import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/firebase_service.dart';
import 'home_bloc/home_bloc.dart';

class SignOutScreen extends StatefulWidget {
  const SignOutScreen({super.key});

  @override
  State<SignOutScreen> createState() => _SignOutScreenState();
}
NotificationService notificationService = NotificationService();
late HomeBloc homeBloc ;
class _SignOutScreenState extends State<SignOutScreen> {

  @override
  void initState() {
    homeBloc = HomeBloc(notificationService);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:MultiBlocProvider(
        providers: [
        BlocProvider<HomeBloc>(
        create: ((context) => homeBloc),
    ),
    ],
      child: BlocBuilder<HomeBloc, HomeState>(
    builder: (context, state) {

      return  Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 200),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(235, 235, 235, 1),
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 60,right: 60,top: 250),
            child: Center(
              child: Column(
                children: [
                  const Text("¿Quieres cerrar sesión?",style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis
                  ),),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                         homeBloc.signOut(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color.fromRGBO(243, 226, 57, 1),
                      ),
                      child: const Text('Sí',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color.fromRGBO(217, 217, 217, 1),
                      ),
                      child: const Text('No',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  },
  ),
      ));
  }
}
