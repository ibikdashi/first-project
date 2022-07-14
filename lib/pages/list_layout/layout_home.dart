import 'package:flutter/material.dart';
import 'package:ibad_client/pages/Services/asset_image.dart';
import 'layout_list.dart';

class LayoutScreen extends StatefulWidget {
  final String title;
  const LayoutScreen(this.title);

  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar:  AppBar(backgroundColor:Colors.teal,title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text(widget.title)],),),
          body:Container(
            //color: Colors.black54,
            color: Colors.teal[400],
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Container(
                    width: size.width,
                    height: 150,
                    child: SwapImage(title: widget.title)),
                 Divider(height: 5,),
                 LayoutList(mName: widget.title)
              ],
            ),
          ) ,

    )
    );
  }
}
