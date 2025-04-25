import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewPage extends StatefulWidget {
  final String path;

  const PdfViewPage({Key? key, required this.path}) : super(key: key);

  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  int _total_de_paginas = 0;
  int _pagina_actual = 0;
  bool _estaListoPDF = false;
  late PDFViewController _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Catálogo"),
      ),
      body: Stack(

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: PDFView(
              filePath: widget.path,
              swipeHorizontal: true,
              onError: (e) {
                print(e);
              },
              onRender: (_pages) {
                setState(() {
                  _total_de_paginas = _pages!;
                  _estaListoPDF = true;
                });
              },
              onViewCreated: (PDFViewController vc) {
                _pdfViewController = vc;
              },
              onPageChanged: (int? page, int? total) {
                setState(() {
                  _pagina_actual = page ?? 0;
                });
              },
              onPageError: (page, e) {},
            ),
          ),
          !_estaListoPDF
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Offstage()
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _pagina_actual > 0
              ? IconButton(onPressed: (){
            _pagina_actual -= 1;
            _pdfViewController.setPage(_pagina_actual);
          }, icon: Icon(Icons.arrow_back_ios))
              : Offstage(),
          _pagina_actual + 1 < _total_de_paginas
              ? IconButton(onPressed: (){
            _pagina_actual += 1;
            _pdfViewController.setPage(_pagina_actual);
          } , icon: Icon(Icons.arrow_forward_ios))
              : Offstage(),
        ],
      ),
    );
  }
}
