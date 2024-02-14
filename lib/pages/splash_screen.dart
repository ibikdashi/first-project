import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'bottombar/bottom_navigator_bar.dart';


class SplashScreen extends StatefulWidget {
  @override
  VideoState createState() => VideoState();
}



class VideoState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  var _visible = true;
  AudioPlayer player;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 7);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AnimatedBottomBar(),));
  }

  @override
  Future<void> start() async {
    await player.setAsset('assets/sounds/2.mp3');
    player.play();
  }
   initState() {
    super.initState();
    player = AudioPlayer();


    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 7));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
    start();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(image:DecorationImage(image: AssetImage('images/splashbackground.jpg'),fit: BoxFit.fill, )),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  'images/logo.png',
                  width: animation.value * 250,
                  height: animation.value * 250,
                ),
                Image.asset('images/welcome.png',
                  width:animation.value * 200 ,
                height:animation.value * 150,),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Text('Developed By Ibrahim Bikdashi',textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight:FontWeight.w400),),
          )
        ],
      ),
    );
  }
}
