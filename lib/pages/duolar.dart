import 'package:flutter/material.dart';
import 'package:namozni_organaman/pages/strings.dart';

class Duolar extends StatefulWidget {
  static const String id = "duolar";

  const Duolar({Key? key}) : super(key: key);

  @override
  State<Duolar> createState() => _DuolarState();
}

class _DuolarState extends State<Duolar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: stringPage().screencolor,
      appBar: AppBar(
        title: Text("Qo'shimcha Duolar"),
        centerTitle: true,
        backgroundColor: Color(0xFF007437),
      ),
      body: Padding(
          padding: const EdgeInsets.only( left: 15, right: 15,bottom: 10),
          child:SingleChildScrollView(
            child: Text(stringPage().duo,textAlign:TextAlign.center,style: TextStyle(fontSize: 18),),
          )
      ),
    );
  }
}
