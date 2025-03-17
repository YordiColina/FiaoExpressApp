import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  Stack(
        children: [

          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(235, 235, 235, 1),
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40,top: 200),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 40,right: 40),
                child: Column(
                  children: [
                    Center(
                      child: Text("Próximamente",style: TextStyle(
                          fontSize: 32,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                    Text("Podrás ver nuestro cátalogo en cualquier momento.",style: TextStyle(
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                    ),maxLines: 3,),
                    Text("¡Pendiente a tus notificaciones!",style: TextStyle(
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),maxLines: 3,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 85,left: 60,right: 60),
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color.fromRGBO(243, 226, 57, 1),
                    ),
                    child: const Text('Regresar',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Dorgan',
                          fontSize: 22,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ),
            ],
          ),



        ],
      ),
    );
  }
}
