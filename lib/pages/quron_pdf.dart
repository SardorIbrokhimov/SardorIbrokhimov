import 'package:flutter/material.dart';
import 'package:namozni_organaman/pages/strings.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class QuranPdf extends StatefulWidget {
  static const String id = "pdf";

  const QuranPdf({Key? key}) : super(key: key);

  @override
  State<QuranPdf> createState() => _QuranPdfState();
}

class _QuranPdfState extends State<QuranPdf> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: stringPage().maincolor,
        title: Text('Quron kitobi'),
      ),
      body: SfPdfViewer.network(
        'http://www.wayu.uz/uploads/1/XklEfI67uMZfdNUE-5DQbsFT9l0nDvAt.pdf',
        key: _pdfViewerKey,
        
      ),
    );
    ;
  }
}
