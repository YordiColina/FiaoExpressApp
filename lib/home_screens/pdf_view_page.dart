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
      appBar: AppBar(
        title: Text("My Document"),
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
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
            onPageChanged: PageChangedCallback.
            onPageError: (page, e) {},
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
              ? FloatingActionButton.extended(
            backgroundColor: Colors.red,
            label: Text("Go to ${_pagina_actual - 1}"),
            onPressed: () {
              _pagina_actual -= 1;
              _pdfViewController.setPage(_pagina_actual);
            },
          )
              : Offstage(),
          _pagina_actual+1 < _total_de_paginas
              ? FloatingActionButton.extended(
            backgroundColor: Colors.green,
            label: Text("Go to ${_pagina_actual + 1}"),
            onPressed: () {
              _pagina_actual += 1;
              _pdfViewController.setPage(_pagina_actual);
            },
          )
              : Offstage(),
        ],
      ),
    );
  }
}