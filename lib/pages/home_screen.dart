import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibad_client/pages/imsakye.dart';
import 'package:ibad_client/pages/sections/programs_titles.dart';
import 'package:ibad_client/pages/sections/sections.dart';
import 'Services/oval_right_clipper.dart';
import 'Services/webpage.dart';
import 'calendarnew/newcalendar_home.dart';
import 'ibad_news.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final Color primary = Colors.white;

  final Color active = Colors.grey.shade800;

  final Color divider = Colors.grey.shade600;

  Color c = Colors.teal[200];

  void navigationPage(Widget page) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => page,));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: AppBar(backgroundColor: Colors.teal,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('أخبار وإعلانات',textAlign: TextAlign.right,style:TextStyle(fontSize: 25),),
            ],
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _key.currentState.openDrawer();
            },
          ),
        ),
        drawer: _buildDrawer(),
        body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: NewsScreen(),
              ),
              Divider(),
              TAnimation("رزنامة العباد"),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(color: c,child: AWSCalendarScreen(c: c,),),
              )
            ]),
      ),
    );
  }

  _buildDrawer() {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary, boxShadow: const [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(image:DecorationImage(image: AssetImage('images/slide.jpg'),fit: BoxFit.cover, ),color: Colors.grey.shade100),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: active,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.orange, Colors.deepOrange])),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/logo.png'),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  const Text(
                    "جماعة عباد الرحمن",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  // Text(
                  //   "@erika07",
                  //   style: TextStyle(color: active, fontSize: 16.0),
                  // ),
                  const SizedBox(height: 30.0),
                  _buildRow(Icons.message, "رسالة  جماعة عباد الرحمن",Sections_Screen()),
                  _buildDivider(),
                  // _buildRow(Icons.person_pin, "My profile"),
                  // _buildDivider(),
                  _buildRow(Icons.calendar_view_month, "إمساكية رمضان",AWSCalendarScreen()),
                  //_buildRow(Icons.message, "Messages", showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.cast_connected_sharp, " برامج العباد",ProgramsTitlesPage()),
                  _buildDivider(),
                  _buildRow(Icons.email, "راسلنا",MyWebView(selectedUrl: "https://www.ibad.org.lb/index.php/home/contactus")),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }

  Widget TAnimation(String text){
    return DefaultTextStyle(
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.teal,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      child: AnimatedTextKit(
        totalRepeatCount: 2,
        animatedTexts: [
          //WavyAnimatedText(text),
          TyperAnimatedText(text,textAlign: TextAlign.center)
        ],
        isRepeatingAnimation: true,
      ),
    );
  }

  Widget _buildRow(IconData icon, String title,Widget route, {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return GestureDetector(
      onTap: (){navigationPage(route);},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(children: [
          Icon(
            icon,
            color: active,
          ),
          const SizedBox(width: 10.0),
          Text(
            title,
            style: tStyle,
          ),
          const Spacer(),
          if (showBadge)
            Material(
              color: Colors.deepOrange,
              elevation: 5.0,
              shadowColor: Colors.red,
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                width: 25,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Text(
                  "10+",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
        ]),
      ),
    );
  }
}