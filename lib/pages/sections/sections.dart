import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ibad_client/pages/list_layout/layout_home.dart';
import 'package:ibad_client/pages/sections/type_writer_box.dart';


class Sections_Screen extends StatefulWidget {
  const Sections_Screen({Key key}) : super(key: key);

  @override
  _Sections_ScreenState createState() => _Sections_ScreenState();
}

class _Sections_ScreenState extends State<Sections_Screen> {
  @override
  List<String>Ltitle=[
    "القطاع الزكوي","القطاع الثقافي","مدرسة المنار الإسلامية"
  ];
  List<String> Rtitle=[
    "القطاع التربوي","القطاع الخيري","القطاع الاجتماعي"
  ];
  Widget typetext(String text){
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 2),
      child: Container(
        width: 350,
        child: DefaultTextStyle(
          textAlign: TextAlign.left,
          style: const TextStyle(
           color: Colors.green,
            fontSize:18,
            fontWeight:FontWeight.bold,
            fontFamily: 'Agne',
          ),
          child: AnimatedTextKit(
            totalRepeatCount: 1,
            animatedTexts: [
              TypewriterAnimatedText(text,textAlign:TextAlign.right),
            ],
          ),
        ),
      ),
    );
  }
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Image(image: AssetImage("images/appbar.png")),
                ),
                 SizedBox(height: 10,),
                 typetext(":الرسالة"),
                 Container(child: typetext("تنشئة أجيالٍ مؤمنةٍ متخلّقةٍ بأخلاق الرسول صلى الله عليه وسلم، معتمدةٍ على نفسها، قادرةٍ على خدمة دينها ومجتمعها، وذلك عبر تهيئتها دينيّاً وتربويّاً وثقافيّاً واجتماعياً، وعبر الدعوة إلى مكارم الأخلاق وتفعيل التكافل الاجتماعي والتعاون مع كل من يريد الخير، وتأمين البيئة المناسبة لزيادة وعي المجتمع دينيّاً وإنسانيّاً وثقافيّاً")),
                 typetext(":الرؤية"),
                 typetext("تتطلّع الجماعة إلى الوصول إلى مجتمع مؤمن متكافل، يعرف دينه ويتخلّق بالأخلاق السامية"),
                 ListView.builder(
                   shrinkWrap: true,
                itemCount: Ltitle.length,
                 itemBuilder: (context,index){
                   return SizedBox(height:100,
                       child: TypeWriterBox(Ltitle: Ltitle[index],Rtitle: Rtitle[index],Rroute:LayoutScreen(Rtitle[index]),Lroute: LayoutScreen(Ltitle[index]),));
                 })],
            ),
          ),
        ));

  }
}
