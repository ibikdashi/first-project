import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'layout_card.dart';


class LayoutList extends StatefulWidget {
  final String mName;

  const LayoutList({ @required this.mName}) ;
  @override
  _LayoutListState createState() => _LayoutListState();
}

class _LayoutListState extends State<LayoutList> {
  final dbRef = FirebaseDatabase.instance.reference();
  List lists = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder(
                stream: dbRef.child(widget.mName).onValue,
                  builder: (context,snapshot){
                if (snapshot.hasData && !snapshot.hasError && snapshot.data.snapshot.value != null) {
                  //print("Error on the way");
                  lists.clear();
                  DataSnapshot dataValues = snapshot.data.snapshot;
                  Map<dynamic, dynamic> values = dataValues.value;
                  values.forEach((key, values) {
                    lists.add(values);
                  });
                 return Expanded(
                   child: ListView.builder(
                     scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: lists.length,
                    itemBuilder: (context,index){
                      return buildPopularCard(index);
                    },
                ),
                 );
              }else return Column(
                children: [
                  Center(child: CircularProgressIndicator()),
                  Center(child: Text("Loading")),
                ],
              );
                })
            ],
          ),
        );
  }
  Widget buildPopularCard(int index,) {
    return SectionCard(
      mTitle: lists[index]["title"],imageUrl:lists[index]["image"],descript:lists[index]["description"] ,
        onPress: () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) =>PdfViewer_Screen(lists[index]["pdf"])),
      //);
    });
  }
}
