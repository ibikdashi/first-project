import 'package:flutter/material.dart';
import 'package:ibad_client/pages/bottombar/BottomNavigatorBar.dart';
import 'bottombar/BottomNavigatorBar.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBarScreen();
  }
}
