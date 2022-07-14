
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibad_client/pages/calendar/data.dart';

class PrayScreen extends StatefulWidget {
  final Datum pray;
  final Color c;
  final Color cc;
  final Color bc;
  const PrayScreen(this.pray,this.c,this.bc,this.cc);

  @override
  _PrayScreenState createState() => _PrayScreenState();
}

class _PrayScreenState extends State<PrayScreen> {
   double w=10;
   Color c=Colors.white;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Table(
        textDirection: TextDirection.rtl,
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const <int, TableColumnWidth>{
          0: FractionColumnWidth(0.15),
        },
        border: TableBorder.all(color: widget.bc),
        children: [
          TableRow(
              children: <Widget>[
            Container(color:widget.c,child: Text(widget.pray.date.hijri.weekday.ar,style:TextStyle(fontWeight:FontWeight.bold), textAlign: TextAlign.center)),
            TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Container(color:widget.cc,child: Text(widget.pray.date.hijri.day,style: TextStyle(fontWeight:FontWeight.w500,fontSize: 15), textAlign: TextAlign.center))),
            TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Container(color:widget.cc,child: Text(widget.pray.date.gregorian.day, style: TextStyle(fontWeight:FontWeight.w500,fontSize: 15),textAlign: TextAlign.center))),
                Container(color:widget.cc,child: Text(prayertime(widget.pray.timings.fajr), style: TextStyle(fontWeight:FontWeight.w500),textAlign: TextAlign.center),),
                Container(color:widget.cc,child: Text(prayertime(widget.pray.timings.sunrise),style: TextStyle(fontWeight:FontWeight.w500), textAlign: TextAlign.center)),
                Container(color:widget.cc,child: Text(prayertime(widget.pray.timings.dhuhr),style: TextStyle(fontWeight:FontWeight.w500), textAlign: TextAlign.center)),
                Container(color:widget.cc,child: Text(prayertime(widget.pray.timings.asr),style: TextStyle(fontWeight:FontWeight.w500), textAlign: TextAlign.center),),
                Container(color:widget.cc,child: Text(prayertime(widget.pray.timings.maghrib), style: TextStyle(fontWeight:FontWeight.w500),textAlign: TextAlign.center)),
                Container(color:widget.cc,child: Text(prayertime(widget.pray.timings.isha), style: TextStyle(fontWeight:FontWeight.w500),textAlign: TextAlign.center)),
          ]),
        ],
      ),
    )
    ;}
   String prayertime(String x){
     if(x.contains("(")){
       var parts = x.split('(');
       var prefix = parts[0].trim();
       return prefix;
     }else return x;
   }
}

