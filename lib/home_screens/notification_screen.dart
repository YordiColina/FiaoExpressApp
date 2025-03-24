import 'package:fiao_express_app/data/models/notification_body.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  final NotificationData notificationData;
  const NotificationScreen({super.key, required this.notificationData});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.52,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(235, 235, 235, 1),
                borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text("Notificaciones", style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          border: Border.all(color: Color.fromRGBO(243, 226, 57, 1) )
                      ),
                      child: Row(
                        children: [
                          Icon(widget.notificationData.data == "info" ? Icons.notifications_none_outlined : Icons.star_outlined, size: 35,
                            color: Color.fromRGBO(243, 226, 57, 1)),

                          Padding(
                            padding: const EdgeInsets.only(left: 20,top: 40),
                            child: Column(
                              children: [
                                Text(widget.notificationData.title, style: TextStyle(
                                    fontSize: 18,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),),

                                Text(widget.notificationData.body,style: TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500
                                ),),

                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  child: Text("Cerrar notificación", style: TextStyle(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w500
                                  ),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
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
                        fontSize: 22,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
