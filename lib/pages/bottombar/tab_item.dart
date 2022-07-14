import 'package:flutter/material.dart';

class TabItems extends StatelessWidget {
  final IconData icon;
  final String text;
  final String label;
  final BuildContext context1;
  final Widget secondroute;

  const TabItems({@required this.icon, @required this.label,  @required this.secondroute,@required this.context1,@required this.text});
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          tooltip: text,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => secondroute));
          },
        ),
        Text(text,textAlign: TextAlign.center,),
      ],
    );
  }
}
