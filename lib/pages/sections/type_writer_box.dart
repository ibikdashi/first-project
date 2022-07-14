import 'package:flutter/material.dart';
import 'package:ibad_client/pages/sections/type_writer_text.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';


class TypeWriterBox extends StatefulWidget {
  final String Ltitle;
  final String Rtitle;
  final Widget Lroute;
  final Widget Rroute;
  static final boxDecoration = BoxDecoration(
      color: Colors.blueGrey[600],
      borderRadius: BorderRadius.all
        (Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 15,
            offset: Offset(0, 8),
            spreadRadius: 5
        )
      ]);

  const TypeWriterBox({Key key, this.Ltitle, this.Rtitle,this.Rroute,this.Lroute}) : super(key: key);

  @override
  _TypeWriterBoxState createState() => _TypeWriterBoxState();
}

class _TypeWriterBoxState extends State<TypeWriterBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title: Text("Flutter Animates TypeWriter Box Demo"),
      //   centerTitle: true,
      //   automaticallyImplyLeading: false,
      // ),
      body: Center(
        child: PlayAnimation<double>(
          duration: 400.milliseconds,
          tween: 0.0.tweenTo(80.0),
          builder: (context, child, height) {
            return PlayAnimation<double>(
              duration: 1600.milliseconds,
              delay: 500.milliseconds,
              tween: 2.0.tweenTo(180.0),
              builder: (context, child, width) {
                return Row(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap:(){Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => widget.Lroute));} ,
                          child: Container(
                            decoration: TypeWriterBox.boxDecoration,
                            width: width,
                            height: height,
                            child: typewriter(width)
                                ? TypeWriterText(widget.Ltitle)
                                : Container(),
                          ),
                        ),
                      ),
                    ),
                    //SizedBox(width:10 ,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap:(){Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => widget.Rroute));} ,
                          child: Container(
                            decoration: TypeWriterBox.boxDecoration,
                            width: width,
                            height: height,
                            child: typewriter(width)
                                ? TypeWriterText(widget.Rtitle)
                                : Container(),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  bool typewriter(double width) => width > 15;
}


