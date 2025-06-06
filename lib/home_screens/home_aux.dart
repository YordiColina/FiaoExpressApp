import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../utils/firebase_service.dart';
import 'home_bloc/home_bloc.dart';

class HomeAux extends StatefulWidget {
 final List<TextEditingController> clientData;
 final int indexProduct;
  const HomeAux({super.key, required this.clientData, required this.indexProduct});

  @override
  State<HomeAux> createState() => _HomeAuxState();
}

class _HomeAuxState extends State<HomeAux> {
  List<TextEditingController> controllers = [];
  LoginBloc bloc = LoginBloc();
  String? selectedOption;
  String? selectedPlanOption;
  double progressBar = 0.0;
  bool readyToDelivery = false;
  NotificationService notificationService = NotificationService();
  late HomeBloc homeBloc ;
  List<String> options = ['Ahorro', 'Planificado', 'Entrega inmediata',];
  List<String> statusOptions = ['Inicial', 'Asociado', 'Pre-adjudicación','Adjudicación',
    'Post-adjudicación','Culminado','Anulado'];
  final List<String> labels = [
    "Contrato no",
    "Fecha de Contrato",
    "Asesor",// section 1
    ////// section 2
    "Nombre",
    "Cédula",
    "Teléfono",
    "Ubicación",
    "Dirección",
    /////// section 3
    "Plan",
    "grupo",
    "Nro de lista",
    "Posición en la lista",
    "Modelo de moto",
    "Marca de la moto",
    "Valor de couta mensual en \$",
    "Nro de cuotas totales",
    //// section 4
    "Cuota inicial",
    "Gastos Adm",
    "Nro de cuotas canceladas",
    "Nro de coutas restantes",
    "Próxima fecha de pago",
    // section 5
    "Días de retraso",
    "Morosidad",
    // section 6
    "Estatus",
    // section 7
    "Fecha de entrega",
    "Color",
    "Serial motor",
    "Serial carroceria",
        "Placa",
    "Observación"
  ];
  final List<String> sectionTitles = [
    "Información del contrato",
    "Datos del cliente",
    "Grupo inscrito",
    "Pagos realizados",
    "Pago de Morosidad",
    "Estatus en FiaoExpress",
    "Datos de entrega de la moto"
  ];
  String userEmail = "";
  bool editable = true;

  @override
  void initState() {
    homeBloc = HomeBloc(notificationService);
    print("numero de cliente ${widget.indexProduct}");
    for (var i = 0; i <= labels.length; i++) {
      controllers.add(TextEditingController());
    }
    if(widget.clientData != null && widget.clientData.isNotEmpty) {
      controllers = widget.clientData;
      selectedPlanOption = widget.clientData[8].text.trim();
      selectedOption = widget.clientData[23].text.trim();
      int totalCuotas = int.parse(widget.clientData[15].text);
      int cuotasPagadas = int.parse(widget.clientData[18].text);
      progressBar = cuotasPagadas/totalCuotas;
    }
    userEmail = bloc.getCurrentUserEmail();
    print(userEmail);
    if(userEmail != "fiaoexpressapp@gmail.com") {
      editable = false;
    } else {
      editable = true;
    }
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:   BlocBuilder<HomeBloc, HomeState>(

            builder: (context, state) {
       return Padding(
        padding: EdgeInsets.only(top: MediaQuery
            .of(context)
            .size
            .width * 0.15,
            left: MediaQuery.of(context).size.width * 0.050,
            right: MediaQuery.of(context).size.width * 0.050 ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                    child: const Icon(Icons.arrow_back_ios_new)),


              ],
            ),
        Expanded(
        child: ListView(
        children: List.generate(
          labels.length ,
              (index) =>
           labels[index] == "Plan" && editable ?
           selectableWidget(labels[index],index)
           : labels[index] == "Estatus" && editable ?
           selectableStatusWidget(labels[index], index)    
          : _textFielWidget(
                  labels[index],
                  controllers[index],
                index
              )
        ),
               ),
              ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: editable,
              child: ElevatedButton(
                  onPressed: () {
                    homeBloc.add(GetFieldValuesEvent(controllers,context,widget.indexProduct));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300]),
                  child: const Text(" Crear cliente",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                      ))),
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: editable,
              child: ElevatedButton(
                  onPressed: () {
                    homeBloc.add(GetFieldValuesEvent(controllers,context,widget.indexProduct));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300]),
                  child: const Text(" Editar cliente",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                      ))),
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: editable,
              child: ElevatedButton(
                  onPressed: () {
                    if(controllers[4].text.isNotEmpty) {
                      List<TextEditingController> auxControllers = [];
                      auxControllers.add(controllers[4]);
                      homeBloc.add(DeleteClientEvent(auxControllers,context));
                      setState(() {
                        controllers = homeBloc.cleanFields(30);
                      });

                    }

                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300]),
                  child: const Text(" borrar cliente",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                      ))),
            ),
            const SizedBox(
              height: 20,
            ),
             ],
        ),

       );
  },
  ),
    );
  }

  Widget _textFielWidget(String title, TextEditingController controller,
       int index) {
    return Visibility(
      visible: (!readyToDelivery && !editable) && (index == 23 ||index == 24 || index == 25 || index == 26 || index == 27
      || index == 28 || index == 29) ? false : true,
      child: Column(
        children: [
          Visibility(
            visible: index == 0 || index == 3 || index == 8 || index == 16 || index == 21 || index == 23 ||
            index  == 24,
            child: Padding(
              padding: EdgeInsets.only(
                  right:  MediaQuery.of(context).size.width * 0.40 ),
              child: index == 0 ? Container(alignment: Alignment.center,child: Text(sectionTitles[0],style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
              ),maxLines: 2,),) : Text(
                index == 3 ? sectionTitles[1] : index == 8 ? sectionTitles[2]
                    : index == 16 ? sectionTitles[3] : index == 21 ? sectionTitles[4] :
                index == 23 ? sectionTitles[5] : index == 24 ? sectionTitles[6] :"",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                ),
                maxLines: 2,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          TextField(
            readOnly: !editable,
            controller: controller,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.italic,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: title,
              hintStyle: const TextStyle(
                color: Colors.grey,
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
            height: 10,
          ),
         Visibility(
           visible: index == 20,
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: Container(
                   alignment: Alignment.centerLeft,
                   child:  Text(
                     "Progreso del pago ${controllers[18].text ?? ""}/${controllers[15].text ?? ""} cuotas",
                     style: const TextStyle(
                       color: Colors.black,
                       fontSize: 12,
                       fontStyle: FontStyle.italic,
                       fontWeight: FontWeight.w800,
                     ),
                   ),
                 ),
               ),
               const SizedBox(
                 height: 10,
               ),
               Container(
                   height: 50,
                   decoration: BoxDecoration(
                       border: Border.all(color: Colors.black),
                       borderRadius: BorderRadius.circular(20)
                   ),
                   child: LinearProgressIndicator(
                     value: progressBar,
                     backgroundColor: Colors.white,
                     valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                     borderRadius: BorderRadius.circular(20),
                   )
               ),
               const SizedBox(
                 height: 10,
               ),
             ],
           ),
         )
        ],
      ),
    );
  }
   Widget selectableWidget(String title,int index) {
    return Column(
      children: [
        Visibility(
          visible: index == 0 || index == 3 || index == 8 || index == 16 || index == 21 || index == 23 ||
              index  == 24,
          child: Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.40),
            child: Text(
              index == 0 ? sectionTitles[0]: index == 3 ? sectionTitles[1] : index == 8 ? sectionTitles[2]
                  : index == 16 ? sectionTitles[3] : index == 21 ? sectionTitles[4] :
              index == 23 ? sectionTitles[5] : index == 24 ? sectionTitles[6] :"",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
              ),
              maxLines: 2,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            alignment: Alignment.centerLeft,
            child:  Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 60,
          child: InputDecorator(
            decoration: const InputDecoration(border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
            )),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedPlanOption,
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(20),
                hint: const Text("Selecciona un plan", style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                ),),
                items: options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    controllers[8].text = newValue  ?? "";
                    selectedPlanOption = newValue;
                    if(selectedPlanOption == "Ahorro" || selectedOption == "Planificado") {
                      controllers[15].text = "24";
                      readyToDelivery = false;
                    } else {
                      controllers[15].text = "8";
                      readyToDelivery = true;
                    }
                  });
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
   }

  Widget selectableStatusWidget(String title,int index) {
    return Column(
      children: [
        Visibility(
          visible: index == 0 || index == 3 || index == 8 || index == 16 || index == 21 || index == 23 ||
              index  == 24,
          child: Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.40),
            child: Text(
              index == 0 ? sectionTitles[0]: index == 3 ? sectionTitles[1] : index == 8 ? sectionTitles[2]
                  : index == 16 ? sectionTitles[3] : index == 21 ? sectionTitles[4] :
              index == 23 ? sectionTitles[5] : index == 24 ? sectionTitles[6] :"",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
              ),
              maxLines: 2,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            alignment: Alignment.centerLeft,
            child:  Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 60,
          child: InputDecorator(
            decoration: const InputDecoration(border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
            )),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedOption,
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(20),
                hint: const Text("Selecciona el estatus", style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                ),),
                items: statusOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {

                    controllers[23].text = newValue  ?? "";
                      selectedOption = newValue;


                  });
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
