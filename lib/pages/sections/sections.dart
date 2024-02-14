import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Sections_Screen extends StatefulWidget {
  const Sections_Screen({Key key}) : super(key: key);

  @override
  _Sections_ScreenState createState() => _Sections_ScreenState();
}

class _Sections_ScreenState extends State<Sections_Screen> {
  @override
  Widget typetext(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 2),
      child: Container(
        width: 350,
        child: DefaultTextStyle(
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'kufi',
           // fontFamily: 'Agne',
          ),
          child: Text(
            text,
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.all(8.0),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/letter.png"), fit: BoxFit.fill)),
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          Container(
            child: Image(image: AssetImage("images/appbar.png")),
          ),
          SizedBox(
            height: 40,
          ),
          typetext("الرسالة:"),
          Container(
              child: typetext(
            "تنشئة أجيالٍ مؤمنةٍ متخلّقةٍ بأخلاق الرسول صلى الله عليه وسلم، معتمدةٍ على نفسها، قادرةٍ على خدمة دينها ومجتمعها، وذلك عبر تهيئتها دينيّاً وتربويّاً وثقافيّاً واجتماعياً، وعبر الدعوة إلى مكارم الأخلاق وتفعيل التكافل الاجتماعي والتعاون مع كل من يريد الخير، وتأمين البيئة المناسبة لزيادة وعي المجتمع دينيّاً وإنسانيّاً وثقافيّاً",
          )),
          typetext("الرؤية:"),
          typetext(
              "تتطلّع الجماعة إلى الوصول إلى مجتمع مؤمن متكافل، يعرف دينه ويتخلّق بالأخلاق السامية"),
        ]),
      ),
    ));
  }
}
