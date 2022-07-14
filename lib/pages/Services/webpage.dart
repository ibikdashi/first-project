import 'dart:async';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  //final String title;
  final String selectedUrl;


  MyWebView({
    //@required this.title,
    @required this.selectedUrl,
  });

  @override

  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  final dbRef = FirebaseDatabase.instance.reference().child("URLLinks");
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.black,
          //   title:
          //   Container(
          //     padding: EdgeInsets.only(left: 0,top: 0,right: 20.0),
          //     alignment: Alignment.centerRight,
          //     child: Text(title,style: TextStyle(fontSize: 22.0,fontWeight:FontWeight.bold),),
          //   ),
          //   leading: new IconButton(
          //       icon: new Icon(Icons.arrow_back),
          //       color: Colors.white,
          //       onPressed: () {
          //         Navigator.pop(context);
          //       }),
          // ),
          body: WebView(
                initialUrl: widget.selectedUrl,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
              )
          ),
    );
  }
}
