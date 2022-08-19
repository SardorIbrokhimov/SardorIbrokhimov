import 'dart:async';
import 'dart:io';

import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:namozni_organaman/pages/quron_pdf.dart';
import 'package:namozni_organaman/pages/strings.dart';
import 'package:namozni_organaman/pages/webview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QuranPage extends StatefulWidget {
  static const String id = "quran";

  const QuranPage({Key? key}) : super(key: key);

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/sample.pdf');

    setState(() => _isLoading = false);
  }

  changePDF(value) async {
    setState(() => _isLoading = true);
    if (value == 1) {
      document = await PDFDocument.fromAsset('assets/sample2.pdf');
    } else if (value == 2) {
      document = await PDFDocument.fromURL(
        "https://www.ecma-international.org/wp-content/uploads/ECMA-262_12th_edition_june_2021.pdf",

        /* cacheManager: CacheManager(
          Config(
            "customCacheKey",
            stalePeriod: const Duration(days: 2),
            maxNrOfCacheObjects: 10,
          ),
        ), */
      );
    } else {
      document = await PDFDocument.fromAsset('assets/sample.pdf');
    }
    setState(() => _isLoading = false);
  }

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  double progres = 0;
  Color maincolor = Color(0xFF007437);
  Color screencolor = Color(0xFF0C8744);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: stringPage().maincolor,
        title: const Text('Quron Kitobi'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.1,
            bottom: MediaQuery.of(context).size.height * 0.5),
       decoration: BoxDecoration(
         color: stringPage().screencolor,
       image: DecorationImage(
         image: AssetImage("assets/images/quran.png",),
         fit: BoxFit.contain
       )
       ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                elevation: 5,
                  color: stringPage().maincolor,
                  child: Text(
                    "Quron kitobini o'qish",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuranPdf(),
                      ),
                    );
                  }),
              RaisedButton(
                elevation: 5,
              color: stringPage().maincolor,
                  child: Text(
                    "Quron kitobini eshitish",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Mp3(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
/* body: Column(
        children: [
          LinearProgressIndicator(
            minHeight: 3,
            value: progres,
            color: Color(0xff0C8744),
            backgroundColor: Colors.red,
          ),
          Expanded(
            child: WebView(
              initialUrl: 'https://namozvaqti.uz/',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              gestureNavigationEnabled: true,
              backgroundColor: const Color(0x00000000),
              onProgress: (progres) => setState(
                    () {
                  this.progres = progres / 100;
                },
              ),
            ),
          ),
        ],
      ),*/
