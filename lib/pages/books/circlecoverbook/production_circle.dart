import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart' as wheel;

class CircularListPage extends StatefulWidget {
  final List items;
  final Function onPress;

  const CircularListPage({Key key, this.items, this.onPress}) : super(key: key);
  @override
  _CircularListPageState createState() => _CircularListPageState();
}

class _CircularListPageState extends State<CircularListPage> {
  wheel.FixedExtentScrollController _controller;

  _listListener() {
    setState(() {});
  }

  @override
  void initState() {
    _controller = wheel.FixedExtentScrollController();
    _controller.addListener(_listListener);
    Bookslist();
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listListener);
    _controller.dispose();
    super.dispose();
  }
StreamBuilder Bookslist(){
  final dbRef = FirebaseDatabase.instance.reference().child("BooksCover");
  final List clist = [];
  return StreamBuilder(
      stream: dbRef.onValue,
      builder: (context,snapshot){
        if (snapshot.hasData && !snapshot.hasError && snapshot.data.snapshot.value != null) {
          print("Error on the way");
          clist.clear();
          DataSnapshot dataValues = snapshot.data.snapshot;
          Map<dynamic, dynamic> values = dataValues.value;
          values.forEach((key, values) {
            clist.add(values);
            characters=clist;
            print(clist);
          });
        }
      }
  );
}
  List characters=<Character>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wheel.CircleListScrollView.useDelegate(
        childDelegate: wheel.CircleListChildBuilderDelegate(
          builder: (context, index) {
            int currentIndex = 0;
            try {
              currentIndex = _controller.selectedItem;
            } catch (_) {}
            final resizeFactor =
            (1 - (((currentIndex - index).abs() * 0.3).clamp(0.0, 1.0)));
            return CircleListItem(
              resizeFactor: resizeFactor,
              character: characters[index],
            );
          },
          childCount: characters.length,
        ),
        physics: wheel.CircleFixedExtentScrollPhysics(),
        controller: _controller,
        axis: Axis.vertical,
        itemExtent: 120,
        radius: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }
}

class CircleListItem extends StatelessWidget {
  final double resizeFactor;
  final Character character;
  //final int index;

  const CircleListItem({Key key, this.resizeFactor,this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            character.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22 * resizeFactor,
            ),
          ),
        ),
        Container(
          width: 120 * resizeFactor,
          height: 120 * resizeFactor,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Colors.orange,
          ),
          child: Align(
            child: Container(
              child:CircleAvatar(
    backgroundImage: AssetImage(character.image),
    radius: 90,
    ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.grey[200],
              ),
              height: 110 * resizeFactor,
              width: 110 * resizeFactor,
            ),
          ),
        ),
      ]),
    );
  }
}
class Character {
  final String title;
  final String image;

  Character({
    this.title,
    this.image,
  });
}
