import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kLabelMapTextStyle = TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold, color: Color(0XFF3f51b5));
const kLabelTextStyle = TextStyle(color: Color(0XFF34a5c1),fontSize: 16.0,);
const kLabelTitleTextStyle = TextStyle(fontSize: 22.0,fontWeight: FontWeight.normal, color: Color(0XFF3f51b5));
const kLabelPhoneTextStyle = TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal,color: Color(0XFF007AFF));

Container boxproduct(String data) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
    alignment: Alignment.centerRight,
    child: Text(
      data,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: kLabelTextStyle,
    ),
  );
}

const List<String> books2 = [
 'https://firebasestorage.googleapis.com/v0/b/fir-sms-96e0e.appspot.com/o/books%2FDSC_0008.png?alt=media&token=64856265-2852-4659-a867-e8f676b9d780',
  'https://firebasestorage.googleapis.com/v0/b/fir-sms-96e0e.appspot.com/o/books%2FDSC_0559_0.png?alt=media&token=78f35925-f1c8-4f5a-95fb-d31902ca0aeb',
  'https://firebasestorage.googleapis.com/v0/b/fir-sms-96e0e.appspot.com/o/books%2FDSC_0571_1.png?alt=media&token=299d04a9-dcda-4cad-8f71-6ad10539a82e',
  'https://firebasestorage.googleapis.com/v0/b/fir-sms-96e0e.appspot.com/o/books%2FDSC_0577_0.png?alt=media&token=8cb02dca-5aee-4f45-8efb-c499b759e2e7'
];

 const String calandar1='https://firebasestorage.googleapis.com/v0/b/fir-sms-96e0e.appspot.com/o/calendar%2Fcalendar1.jpg?alt=media';
 const String calandar2='https://firebasestorage.googleapis.com/v0/b/fir-sms-96e0e.appspot.com/o/calendar%2Fcalendar2.jpg?alt=media';
 const String ramadan1='https://firebasestorage.googleapis.com/v0/b/fir-sms-96e0e.appspot.com/o/calendar%2Femsakeya1.jpg?alt=media';
 const String ramadan2='https://firebasestorage.googleapis.com/v0/b/fir-sms-96e0e.appspot.com/o/calendar%2Femsakeya2.jpg?alt=media';
 const String zakat= "https://firebasestorage.googleapis.com/v0/b/fir-sms-96e0e.appspot.com/o/unnamed.jpg?alt=media";

