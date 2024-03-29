import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibad_client/pages/ibad_news.dart';
import 'calendarnew/newcalendar_home.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Color c = Colors.teal[200];
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: NewsScreen(),
              ),
              Divider(),
              Column(children: [
                TAnimation("رزنامة العباد"),
                SizedBox(
                  height: 10,
                ),
                Container(color: c,child: AWSCalendarScreen(c: c,),)
              ])
            ]),
      ),
    );
  }
  Widget TAnimation(String text){
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.teal,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      child: AnimatedTextKit(
        totalRepeatCount: 4,
        animatedTexts: [
          //WavyAnimatedText(text),
          TyperAnimatedText(text)
        ],
        isRepeatingAnimation: true,
      ),
    );
  }
}
