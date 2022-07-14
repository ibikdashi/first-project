import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ibad_client/pages/Services/pdf_viewer.dart';

import 'details_card.dart';


class DetailsList extends StatefulWidget {
  final String bName;

  const DetailsList({ @required this.bName}) ;
  @override
  _DetailsListState createState() => _DetailsListState();
}

class _DetailsListState extends State<DetailsList> {
  final dbRef = FirebaseDatabase.instance.reference().child("Books");
  List lists = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder(
                stream: dbRef.child(widget.bName).onValue,
                  builder: (context,snapshot){
                  print(widget.bName.toString());
                if (snapshot.hasData && !snapshot.hasError && snapshot.data.snapshot.value != null) {
                  print("Error on the way");
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
                      return lists[index]["pdf"] != null ? buildPopularCard(index,true):buildPopularCard(index, false);
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
  Widget buildPopularCard(int index,bool visible) {
    return SectionCard(
      title: lists[index]["title"],image:lists[index]["image"],pdfUrl: visible ,
        onPress: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>PdfviewerScreen(lists[index]["pdf"])),
      );
    });
  }
}
