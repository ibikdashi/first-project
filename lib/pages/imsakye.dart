import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:ibad_client/pages/Services/assets.dart';
import 'package:ibad_client/pages/Services/network_image.dart';

class EmsakyeScreen extends StatefulWidget {
  @override
  _EmsakyeScreenState createState() => _EmsakyeScreenState();
}

class _EmsakyeScreenState extends State<EmsakyeScreen> {
  @override
  // final dbRef = FirebaseDatabase.instance.reference().child("images");
  //
  // List lists = [];

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Center(child: Text("إمساكية رمضان")),
      ),
      body: buildCard(),
      // body: Column(
      //   children: [
      //     StreamBuilder(
      //         stream: dbRef.child("إمساكية رمضان").onValue,
      //         builder: (context,snapshot){
      //           if (snapshot.hasData && !snapshot.hasError && snapshot.data.snapshot.value != null) {
      //             lists.clear();
      //             DataSnapshot dataValues = snapshot.data.snapshot;
      //             Map<dynamic, dynamic> values = dataValues.value;
      //             values.forEach((key, values) {
      //               lists.add(values);
      //             });return buildPopularCard();
      //           }else return Column(
      //             children: [
      //               Center(child: CircularProgressIndicator()),
      //               Center(child: Text("Loading")),
      //             ],
      //           );
      //         }),
      //   ],
      // ),
    ));
  }

  Widget buildCard(){
    return Container(
      color: Colors.black54,
      alignment: Alignment.center,
      //width: MediaQuery.of(context).size.width/0.5,
      width: double.infinity,
      child: ImageSlideshow(
        // width: 400,
          height: MediaQuery.of(context).size.height/1.25,
          initialPage: 0,
          children:[
            PNetworkImage(ramadan1,fit: BoxFit.fill,),
            PNetworkImage(ramadan2,fit: BoxFit.fill,),
          ]),
    );
  }
  // Widget buildPopularCard() {
  //   return Container(
  //     width: double.infinity,
  //     child: new Swiper(
  //       layout: SwiperLayout.TINDER,
  //       itemHeight: MediaQuery.of(context).size.height/1.25,
  //       itemWidth: double.infinity,
  //       autoplay: false,
  //       itemBuilder: (BuildContext context, int index) {
  //         return
  //           PNetworkImage(lists[index], fit: BoxFit.contain );
  //       },
  //       itemCount: lists.length,
  //       scrollDirection: Axis.vertical,
  //       viewportFraction: 0.8,
  //       scale: 0.9,
  //       //duration: 300,
  //     ),
  //   );
  // }
}

