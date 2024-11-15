import 'package:flutter/material.dart';

class HomeAux extends StatefulWidget {
  const HomeAux({super.key});

  @override
  State<HomeAux> createState() => _HomeAuxState();
}

class _HomeAuxState extends State<HomeAux> {
  final List<TextEditingController> controllers = [];
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
    "plan",
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
    "Serial carroceria"
        "placa",
    "observación"
  ];
  final List<String> sectionTitles = [
    "Datos del contrato",
    "Datos del cliente",
    "Grupo inscrito",
    "Pagos realizados",
    "Pago de Morosidad",
    "Estatus en FiaoExpress",
    "Datos de entrega de la moto"
  ];

  @override
  void initState() {
    for (var i = 0; i < labels.length; i++) {
      controllers.add(TextEditingController());
    }
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery
            .of(context)
            .size
            .width * 0.15,
            left: MediaQuery.of(context).size.width * 0.050,
            right: MediaQuery.of(context).size.width * 0.050 ),
        child: Column(
          children: [
        Expanded(
        child: ListView(
        children: List.generate(
          labels.length,
              (index) =>
              _textFielWidget(
                  labels[index],
                  controllers[index],
                  true,
                index
              ),
        ),
               ),
              ),
             ],
        ),
       ),
    );
  }

  Widget _textFielWidget(String title, TextEditingController controller,
      bool editable, int index) {
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
                fontFamily: 'Dorgan',
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
                fontFamily: 'Dorgan',
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
            fontFamily: 'Dorgan',
            fontStyle: FontStyle.italic,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: title,
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
          height: 10,
        ),
      ],
    );
  }
}
