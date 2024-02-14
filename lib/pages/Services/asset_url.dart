import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class URLSite extends StatefulWidget {
  final String title;
  final String selectedUrl;

  const URLSite({Key key, this.title,@required this.selectedUrl}) : super(key: key);

  @override
  _URLSiteState createState() => _URLSiteState();
}

class _URLSiteState extends State<URLSite> {

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    readData();
  }
  String data;
  final dbRef = FirebaseDatabase.instance.reference().child("URLLinks");
  Widget build(BuildContext context) {
    return SafeArea(
      child:Center(
        child: _launchURL(widget.selectedUrl),
      ),
      // child: Center(
      //   child: Container(
      //     width: Size.infinite.width,
      //     color: Colors.teal,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         ElevatedButton(onPressed: ()=>_launchURL(widget.selectedUrl),child: Text("للتبرع",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),)
      //         //ElevatedButton(onPressed: ()=>_launchURL(widget.s),child: Text("راسلنا",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)))
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  void  readData(){
    dbRef.child(widget.title).child("url").once().then((DataSnapshot snapshot) {

      String key=snapshot.key.toString();
      print(key);
      if(key=="url"){
         String value='${snapshot.value}';
        data=value;
      }
    });
  }
  _launchURL(String u) async {
    String url = u;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
