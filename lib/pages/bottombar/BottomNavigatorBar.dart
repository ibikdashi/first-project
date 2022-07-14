import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:ibad_client/pages/Services/asset_url.dart';
import 'package:ibad_client/pages/Services/hyperlink.dart';
import 'package:ibad_client/pages/books/coverbooks/productions_home.dart';
import 'package:ibad_client/pages/location_page.dart';
import 'package:ibad_client/pages/main_screen.dart';
import 'package:ibad_client/pages/Services/webpage.dart';
import 'package:ibad_client/pages/sections/sections.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  @override
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int selectedPage = 0;
  final _pageOptions = [
    SecondScreen(),
    ProductionsScreen(),
    Sections_Screen(),
    Location(),
    FBVideo(),
    //EmsakyeScreen(),
     URLSite(title: "للتبرع",),
    // URLSite(title:"راسلنا" ,),
    //MyWebView(selectedUrl:"https://ibad.org.lb/content/%D8%A5%D8%B3%D8%AA%D9%85%D8%A7%D8%B1%D8%A9-%D8%A7%D9%84%D8%AA%D8%A8%D8%B1%D8%B9),
    MyWebView(selectedUrl: "https://ibad.org.lb/contact"),
  ];
  void initState() {
    initOneSignalMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      _pageOptions[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: 0, //optional, default as 0
        onTap: (int index) => setState(() => selectedPage = index),
        style: TabStyle.flip,
        items: [
          TabItem(icon: Icons.home_work, title: 'من نحن'),
          TabItem(icon: Icons.home, title: 'إصدارات'),
          TabItem(icon: Icons.cast_connected, title: "برامجنا"),
          TabItem(icon: Icons.credit_card_rounded, title: 'المرافق'),
          TabItem(icon: Icons.calendar_today_rounded, title: 'إمساكية'),
          TabItem(icon: Icons.monetization_on_rounded, title: 'للتبرع'),
          TabItem(icon: Icons.email_rounded, title: 'راسلنا'),
        ],
        activeColor: Colors.yellowAccent,
        //backgroundColor: Colors.black54,
        backgroundColor: Colors.blueGrey[800],
      ),
    );
  }
  Future < void >  initOneSignalMethod () async {
    String _debugLabelString = "";
    await  OneSignal .shared. init ( "6db34dd4-a169-4dd7-890e-649356b11017" );
    OneSignal .shared
        . setInFocusDisplayType ( OSNotificationDisplayType .notification);

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      this.setState(() {_debugLabelString =
      "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });

    OneSignal .shared
        . setNotificationOpenedHandler (( OSNotificationOpenedResult result) {
      print ( 'Clicked on tray' );
    });
  }
}
