import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ibad_client/pages/Services/network_image.dart';

class SwapImage extends StatefulWidget {
  final String title;
  const SwapImage({ @required this.title}) ;
  @override
  _SwapImageState createState() => _SwapImageState();
}

class _SwapImageState extends State<SwapImage> {
  final dbRef = FirebaseDatabase.instance.reference().child("images");
  List lists = [];
  var title;

  Widget build(BuildContext context) {
   // Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: dbRef.child(widget.title).onValue,
        builder: (context,snapshot){
          if (snapshot.hasData && !snapshot.hasError && snapshot.data.snapshot.value != null) {
            print(widget.title);
            lists.clear();
            DataSnapshot dataValues = snapshot.data.snapshot;
            Map<dynamic, dynamic> values = dataValues.value;
            values.forEach((key, values) {
              lists.add(values);
            });return buildPopularCard(lists);
          }else return Column(
            children: [
              Center(child: CircularProgressIndicator()),
              Center(child: Text("الرجاء الإنتظار")),
            ],
          );
        });
  }
  Widget buildPopularCard(List pic) {
    //Size size = MediaQuery.of(context).size;
    return new Swiper(
      // layout: SwiperLayout.STACK,
      // itemHeight: 200,
      // itemWidth: 300,
      autoplay: true,
      itemBuilder: (BuildContext context, int index) {
        return
          PNetworkImage(pic[index], fit: BoxFit.cover );
      },
      itemCount: pic.length,
      viewportFraction: 0.8,
      scale: 0.9,
    );
}
}