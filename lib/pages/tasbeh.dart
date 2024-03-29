import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:namozni_organaman/pages/home_page.dart';
import 'package:namozni_organaman/pages/strings.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class Tasbeh extends StatefulWidget {
  static const String id = "tasbeh";

  const Tasbeh({Key? key}) : super(key: key);

  @override
  State<Tasbeh> createState() => _TasbehState();
}

class _TasbehState extends State<Tasbeh> {
  late FixedExtentScrollController _controller;

  String zikrlar = stringPage().zikr1;

  int jami = 0;
  late final AudioCache _auidoCache;

  double foiz = 0.01;

  sounds(bosildi) {
    if (bosildi) {
      return _auidoCache.play("music.mp3", volume: 0);
    } else {
      return _auidoCache.play("music.mp3");
    }
  }
int son=0;
  int count = 0;

  forVibration() {
    HapticFeedback.heavyImpact();
  }

  foricon(ovoz) {
    if (ovoz) {
      return mute;
    } else {
      return notmute;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController();
    _auidoCache = AudioCache(prefix: "assets/music/");
  }

  bool sound = true;
  Icon mute = Icon(Icons.volume_off);
  Icon notmute = Icon(Icons.volume_up);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tasbeh",
          style: TextStyle(fontSize: 22),
        ),
        leading: IconButton(
          onPressed: (() {
            setState(() {
              sound = !sound;
            });
          }),
          icon: foricon(sound),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                count = 0;
                jami = 0;
                foiz = 0;
                son=0;
                zikrlar = stringPage().zikr1;
              });
            },
            icon: Icon(Icons.cached),
          ),
        ],
        centerTitle: true,
        backgroundColor: stringPage().maincolor,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                "Jami: $jami",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: stringPage().maincolor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.12,
                            ),
                            Container(
                              child: Text(
                                zikrlar,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: stringPage().maincolor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: ListWheelScrollView.useDelegate(
                          controller: _controller,
                          itemExtent: 100.0,
                          diameterRatio: 2.0,
                          magnification: 2,
                          overAndUnderCenterOpacity: 1,
                          offAxisFraction: 1.1,
                          physics: PageScrollPhysics(),
                          renderChildrenOutsideViewport: false,
                          squeeze: 1,
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              return Container(
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                  color: stringPage().screencolor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              );
                            },
                          ),
                          clipBehavior: Clip.hardEdge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.height * 0.25,
                        child: GestureDetector(
                          child: CircularProgressIndicator(
                            value: foiz,
                            backgroundColor: Colors.grey.shade500,
                            color: stringPage().maincolor,
                            strokeWidth: 20,
                          ),
                          onTap: () async {
                            await sounds(sound);
                            final nextIndex = _controller.selectedItem + 1;
                            _controller.animateToItem(nextIndex,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeOut);
                            setState(() {
                              son++;
                              jami++;
                              count++;
                              foiz += 0.01;

                              if (count == 99) {
                                foiz = 0.01;
                              }
                              if (count == 99) {
                                Vibrate.vibrate();
                                count = 0;
                                son=0;
                              }
                            });
                            if (count % 33 == 0 &&
                                count != 0 &&
                                jami % 33 == 0) {
                              Vibrate.vibrate();
                            }
                            if (son%33==0&&son!=0) {
                              setState(() {
                                zikrlar = stringPage().zikr2;
                              });
                            }
                            if (son%66==0&&son!=0) {
                              setState(() {
                                zikrlar = stringPage().zikr3;
                              });
                            }
                            if (son%99==0&&son!=0) {
                              setState(() {
                                zikrlar = stringPage().zikr1;
                              });
                            }
                            if (son==0){
                              setState(() {
                                zikrlar=stringPage().zikr1;
                              });


                            }
                          },
                        ),
                      ),
                      GestureDetector(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.height * 0.25,
                          child: Center(
                            child: Text(
                              "$count",
                              style: TextStyle(
                                  fontSize: 50,
                                  color: stringPage().screencolor),
                            ),
                          ),
                        ),
                        onTap: () async {
                          await await sounds(sound);
                          final nextIndex = _controller.selectedItem + 1;
                          _controller.animateToItem(nextIndex,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeOut);
                          setState(() {
                            son++;
                            jami++;
                            count++;
                            foiz += 0.01;

                            if (count == 99) {
                              foiz = 0.01;
                            }
                            if (count == 99) {
                              Vibrate.vibrate();
                              count = 0;
                              son=0;
                            }
                          });
                          if (count % 33 == 0 && count != 0) {
                            Vibrate.vibrate();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
      ),*/
    );
  }

  Future _launchUrl() async {
    final Uri _url = Uri.parse('https://namozvaqti.uz/');
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}
