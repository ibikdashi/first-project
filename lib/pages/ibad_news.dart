import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibad_client/pages/Services/asset_image.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            TAnimation("أنشطة العباد"),
            //Text("أنشطة العباد",style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),),
            Container(
                width: double.infinity,
                height: 200,
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.blueAccent)
                // ),
                child: SwapImage(title: "أنشطة العباد")),
            //Divider(),
          ],
    );
  }
  Widget TAnimation(String text){
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.teal,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      child: AnimatedTextKit(
        totalRepeatCount: 2,
        animatedTexts: [
           //WavyAnimatedText(text),
          TyperAnimatedText(text)
        ],
        isRepeatingAnimation: true,
      ),
    );
  }
}
