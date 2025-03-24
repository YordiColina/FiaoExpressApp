import 'package:fiao_express_app/data/models/notification_body.dart';
import 'package:flutter/material.dart';

import '../home_screens/notification_screen.dart';


class NotificationPreScreen extends StatefulWidget {
  final List<NotificationData> notificationData;

  const NotificationPreScreen({super.key, required this.notificationData});
  @override
  State<NotificationPreScreen> createState() => _NotificationPreScreenState();
}

class _NotificationPreScreenState extends State<NotificationPreScreen> {
  bool read = false;
  @override
  void initState() {
    super.initState();
    print("NotificationData: ${widget.notificationData.length}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 20,right: 20, top: MediaQuery.of(context).size.height * 0.15),
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.82,
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
                    Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount:widget.notificationData.isNotEmpty? widget.notificationData.length : 1,//,
                        itemBuilder: (context, index) {
                          return widget.notificationData.isNotEmpty ? Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    read = true;
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => NotificationScreen(notificationData: widget.notificationData[index] ,)));
                                  });
                               },
                                  child: notificationCard(widget.notificationData[index])),
                            ],
                          ):
                              Container(
                                child: Center(child: Text("No hay notificaciones")),
                              );
                        },
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
          SizedBox(
            height: 20,
          )
        ],
      )
    );
  }
  Widget notificationCard(NotificationData notificationData) {
    return Padding(
        padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.18,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
       border: Border.all(color:  read == false ? Color.fromRGBO(243, 226, 57, 1) : Colors.grey)
        ),
        child: Row(
          children: [
            Icon(notificationData.data == "info" ? Icons.notifications_none_outlined : Icons.star_outlined, size: 35,
            color: read == false ?Color.fromRGBO(243, 226, 57, 1): Colors.grey,),

            Padding(
              padding: const EdgeInsets.only(left: 20,top: 40),
              child: Column(
                children: [
                  Text(notificationData.title, style: TextStyle(
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),),

                  Text(notificationData.body,style: TextStyle(
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

