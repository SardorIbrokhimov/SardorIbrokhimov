import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Mp3 extends StatefulWidget {
  static const String id = "mp3";

  const Mp3({Key? key}) : super(key: key);

  @override
  State<Mp3> createState() => _Mp3State();
}

class _Mp3State extends State<Mp3> {
  AudioPlayer audioPlayer = new AudioPlayer();

  Duration position = new Duration();
  Duration duration = new Duration();
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          InkWell(
            child: Icon(playing == false
                ? Icons.play_circle_fill_outlined
                : Icons.pause_circle_filled_outlined
            ),
          ),
          SizedBox(
            width: 15,
          ),
          slider(),

        ],
      ),
    );
  }

  Widget slider() {
    return Slider.adaptive(
      min: 0.0,
      value: position.inSeconds.toDouble(),
      max: duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {});
      },
    );
  }
}
