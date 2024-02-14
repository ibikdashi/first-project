import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ibad_client/pages/Services/hyperlink.dart';
import 'package:ibad_client/pages/Services/webpage.dart';
import 'package:ibad_client/pages/books/coverbooks/productions_home.dart';
import 'package:ibad_client/pages/home_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class AnimatedBottomBar extends StatefulWidget {
  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  int _currentPage;

  @override
  void initState() {
    _currentPage = 0;
    initOneSignalMethod();
    super.initState();
  }
  Future < void >  initOneSignalMethod() async {
    String _debugLabelString = "";
    await  OneSignal .shared. init ( "7a9f34a1-69b4-4d12-b58d-ad10092f1e17" );
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: getPage(_currentPage),
      bottomNavigationBar: AnimatedBottomNav(
          currentIndex: _currentPage,
          onChange: (index) {
            setState(() {
              _currentPage = index;
            });
          }),
    );
  }

  getPage(int page) {
    switch (page) {
      case 0:
        return  HomeScreen();
      case 1:
        return  ProductionsScreen();
      case 2:
        return FBVideo() ;
      case 3:
        return  MyWebView(selectedUrl: 'https://www.ibad.org.lb/index.php/home/donationdoors');
    }
  }
}


class AnimatedBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onChange;
  const AnimatedBottomNav({Key key, this.currentIndex, this.onChange})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      decoration: const BoxDecoration(color: Colors.blueGrey),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => onChange(0),
              child: BottomNavItem(
                icon: FontAwesomeIcons.home,
                title: 'من نحن',
                isActive: currentIndex == 0,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(1),
              child: BottomNavItem(
                icon: FontAwesomeIcons.bookOpen,
                title: 'إصدارات',
                isActive: currentIndex == 1,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(2),
              child: BottomNavItem(
                icon: FontAwesomeIcons.newspaper,
                title: " أخبارالعباد",
                isActive: currentIndex == 2,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(3),
              child: BottomNavItem(
                icon: FontAwesomeIcons.moneyCheck,
                title: 'للتبرع',
                isActive: currentIndex == 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatefulWidget {
  final bool isActive;
  final IconData icon;
  final Color activeColor;
  final Color inactiveColor;
  final String title;
  const BottomNavItem(
      {Key key,
        this.isActive = false,
        this.icon,
        this.activeColor,
        this.inactiveColor,
        this.title})
      : super(key: key);

  @override
  _BottomNavItemState createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 200),
      child: widget.isActive
          ? Container(
        color: Colors.teal,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: widget.activeColor ?? Colors.amber,
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              width: 5.0,
              height: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.activeColor ?? Colors.amber,
              ),
            ),
          ],
        ),
      )
          : Icon(
        widget.icon,
        color: widget.inactiveColor ?? Colors.white,
      ),
    );
  }
}