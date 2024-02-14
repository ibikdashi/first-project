import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ibad_client/pages/list_layout/layout_home.dart';

class ProgramsTitlesPage extends StatefulWidget {
  @override
  _ProgramsTitlesPageState createState() => _ProgramsTitlesPageState();
}

class _ProgramsTitlesPageState extends State<ProgramsTitlesPage> {
  @override

  Widget build(BuildContext context) {

    List<String>title=[
      "القطاع التربوي","القطاع الخيري","القطاع الاجتماعي","القطاع الزكوي","القطاع الثقافي","القطاع التعليمي"
    ];
    List<String>number=[
      "واحد","إثنان","ثلاثة","أربعة","خمسة"," ستة"
    ];
    List<Color>color=[
      Colors.amber,Colors.blueGrey,Colors.greenAccent,Colors.lightGreen,Colors.redAccent,Colors.blue
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("برامج عباد الرحمن"),
          ],
        ),
      ),
      body: Container(
          height:MediaQuery.of(context).size.height,
        //color: Colors.grey.shade300,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/copy.png"),fit: BoxFit.cover)),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: title.length,
          itemBuilder: (context,index){
            return AnimCard(
              color[index],
              title[index],
              number[index],
              '',
            );
          },
        ),
      ),
    );
  }
}

class AnimCard extends StatefulWidget {
  final Color color;
  final String num;
  final String numEng;
  final String content;

  AnimCard(this.color, this.num, this.numEng, this.content);

  @override
  _AnimCardState createState() => _AnimCardState();
}

class _AnimCardState extends State<AnimCard> {
  var padding = 100.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          AnimatedPadding(
            padding: EdgeInsets.only(left: padding),
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
            child: Container(
              child: CardItem(
                widget.color,
                widget.num,
                widget.numEng,
                widget.content,
                    () {
                  setState(
                        () => padding = padding == 0 ? 100.0 : 0.0,
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ClipPath(
              clipper: ArcClipper(),
              child: Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final Color color;
  final String num;
  final String numEng;
  final String content;
  final onTap;


  CardItem(this.color, this.num, this.numEng, this.content, this.onTap,);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: color.withOpacity(0.5),
          height: 80,
          width: 250,
          child: Row(
            children: <Widget>[
              RotatedBox(
                quarterTurns: 3,
                child: Container(
                  width: 100,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    numEng,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: color.withOpacity(1),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){ Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LayoutScreen(num),));},
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    num,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    content,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    var arcPath = Path.combine(
      PathOperation.difference,
      path,
      Path()
        ..addArc(
          Rect.fromCircle(
            center: Offset(0, size.height / 2),
            radius: size.height / 3,
          ),
          0,
          2 * pi,
        ),
    );
    return arcPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}