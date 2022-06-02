import 'package:flutter/material.dart';
import 'package:namozni_organaman/pages/strings.dart';
import 'package:namozni_organaman/pages/youtubeplayer.dart';

class Xatoliklar extends StatefulWidget {
  static const String id = "Xatoliklar";

  const Xatoliklar({Key? key}) : super(key: key);

  @override
  State<Xatoliklar> createState() => _XatoliklarState();
}

class _XatoliklarState extends State<Xatoliklar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: stringPage().screencolor,
      appBar: AppBar(
        title: Text("Namoz o'qishdagi xatoliklar"),
        centerTitle: true,
        backgroundColor: Color(0xFF007437),
      ),
      body: Padding(
        padding: const EdgeInsets.only( left: 15, right: 15),
        child:SingleChildScrollView(
          child: Text(stringPage().xatolar,style: TextStyle(fontSize: 18),),
        )
      ),
    );
  }
}
