import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ibad_client/pages/Services/assets.dart';
import 'package:ibad_client/pages/Services/network_image.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ibad_client/pages/books/coverbooks/productions_list.dart';


class ProductionsScreen extends StatefulWidget {
  @override
  _ProductionsScreenState createState() => _ProductionsScreenState();
}
class _ProductionsScreenState extends State<ProductionsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          //color: Colors.black54,
          color: Colors.teal,
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 180,
                child: new Swiper(
                  autoplay: true,
                  itemBuilder: (BuildContext context, int index) {
                    return
                      PNetworkImage(books2[index], fit: BoxFit.cover );
                  },
                  itemCount: 4,
                  viewportFraction: 0.8,
                  scale: 0.9,
                ),
              ),
              Divider(height: 5,),
              ProductionsList(
                //listSection: recents,
              )
            ],
          ),
        ),
      ),
    );
  }
}
