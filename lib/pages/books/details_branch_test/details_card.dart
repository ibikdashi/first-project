import 'package:flutter/material.dart';
import 'package:ibad_client/pages/Services/network_image.dart';


class SectionCard extends StatelessWidget {
  final String image,title;
  final bool pdfUrl;
  final Function onPress;

  const SectionCard({ this.title,this.image,@required this.pdfUrl,this.onPress});

  @override

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.18),
            blurRadius: 8,
            offset: Offset(0, 1),
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          ImageCard(
            imageSource: image,
          ),
          ContentCard(
            press:this.onPress,
            title: title,
            pdf: this.pdfUrl,
          ),
        ],
      ),
    );
  }
}

// Widget Content List
class ContentCard extends StatelessWidget {
  const ContentCard({
    Key key,
    @required this.press,
    @required this.title,
    @required this.pdf,
  }) : super(key: key);

  final String title;
  final bool pdf;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 1.8,
      height: 120,
      margin: EdgeInsets.only(left: 110, top: 10),
      padding: EdgeInsets.all(2),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              this.title,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                wordSpacing: 0,
                fontWeight: FontWeight.w400,
                fontSize: size.width * 0.035,
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment:CrossAxisAlignment.end ,
              children: <Widget>[
                GestureDetector(
                  onTap: this.press,
                  child: Visibility(
                    visible: this.pdf,
                    child: Text(
                      "OPEN PDF",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: size.width * 0.03,color: Colors.red
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                Icon(
                  Icons.picture_as_pdf,
                  size: 20,
                  color: Colors.redAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Image List
class ImageCard extends StatelessWidget {
  final String imageSource;
  const ImageCard({
    Key key,
    @required this.imageSource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      child: PNetworkImage(this.imageSource, fit: BoxFit.cover ),
    );
  }
}
