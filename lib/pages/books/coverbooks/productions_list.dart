import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ibad_client/pages/books/coverbooks/productions_card.dart';
import 'package:ibad_client/pages/books/details_branch_test/details_home.dart';



class ProductionsList extends StatefulWidget {
  //final List<Sections> listSection;

  //const ProductionsList({ }) ;
  @override
  _ProductionsListState createState() => _ProductionsListState();
}

class _ProductionsListState extends State<ProductionsList> {
  final dbRef = FirebaseDatabase.instance.reference().child("BooksCover");
  List _lists = [];
  @override
  Widget build(BuildContext context) {
    return Expanded(
        //flex: 4,
       child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        StreamBuilder(
            stream: dbRef.onValue,
            builder: (context,snapshot){
              if (snapshot.hasData && !snapshot.hasError && snapshot.data.snapshot.value != null) {
                print("Error on the way");
                _lists.clear();
                DataSnapshot dataValues = snapshot.data.snapshot;
                Map<dynamic, dynamic> values = dataValues.value;
                values.forEach((key, values) {
                  _lists.add(values);
                });
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _lists.length,
                    itemBuilder: (context,index){
                      return buildPopularCard(index);
                    },
                  ),
                );
              }else return Column(
                children: [
                  CircularProgressIndicator(),
                  Text("Loading"),
                ],
              );
            })
      ],
    ),
      );
  }

  Widget buildPopularCard(int index) {
    return SectionCard(
      //recent: widget.listSection[index],
      image: _lists[index]["image"],title: _lists[index]["title"],
      onPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsScreen(_lists[index]["title"])),
        );
      },
    );
  }
}
