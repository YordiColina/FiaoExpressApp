import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/home_screens/home_aux.dart';
import '../home_screens/home_bloc/home_bloc.dart';

class PreHome extends StatefulWidget {
  const PreHome({super.key});

  @override
  State<PreHome> createState() => _PreHomeState();
}

class _PreHomeState extends State<PreHome> {
  TextEditingController searchController = TextEditingController();
  HomeBloc homeBloc = HomeBloc();

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
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: true,
              child: ElevatedButton(
                  onPressed: () {
                    List<TextEditingController> controllers = [];
                    controllers.add(searchController);
                    homeBloc.add(SetValuesEvent(controllers));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300]),
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
            Expanded(
              child: ListView(
                children: List.generate(
                  2,
                      (index) =>
                     Column(
                       children: [
                         GestureDetector(
                           onTap: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => BlocProvider.value(
                                 value: homeBloc,
                                   child: const HomeAux())),
                             );
                           },
                             child: productCard()),
                         const SizedBox(
                           height: 20,
                         )
                       ],
                     )
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

  Widget productCard () {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black)
      ),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("nombre",style:TextStyle(
                    color: Colors.black,
                    fontFamily: 'Dorgan',
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                  ) ,),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text("Moto",style:TextStyle(
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
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("plan",style:TextStyle(
                  color: Colors.black,
                  fontFamily: 'Dorgan',
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                ) ,),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text("contrato",style:TextStyle(
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
}
