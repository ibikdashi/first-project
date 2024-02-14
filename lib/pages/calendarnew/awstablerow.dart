import 'package:flutter/material.dart';
import 'package:ibad_client/pages/calendarnew/awsdata.dart';

class PrayerView extends StatefulWidget {
  final Datum pray;
  final Color c;
  final Color cc;
  final Color bc;

  const PrayerView({Key key, this.pray, this.c, this.cc, this.bc});

  @override
  State<PrayerView> createState() => _PrayerViewState();
}

class _PrayerViewState extends State<PrayerView> {
  double w=10;
  Color c=Colors.white;

  @override
  Widget build(BuildContext context) {
    return Table(
      textDirection: TextDirection.rtl,
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const <int, TableColumnWidth>{
        0: FractionColumnWidth(0.15),
      },
      border: TableBorder.all(color: widget.bc),
      children: [
        TableRow(
            children: <Widget>[
              Container(color:widget.c,child: Text(widget.pray.day,style:TextStyle(fontWeight:FontWeight.bold), textAlign: TextAlign.center)),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Container(color:widget.cc,child: Text(Hijremonths(widget.pray.hijri),style: TextStyle(fontWeight:FontWeight.w500,fontSize: 15), textAlign: TextAlign.center))),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Container(color:widget.cc,child: Text(Milademonths(widget.pray.miladi), style: TextStyle(fontWeight:FontWeight.w500,fontSize: 15),textAlign: TextAlign.center))),
              Container(color:widget.cc,child: Text("${widget.pray.fajrHours}:${widget.pray.fajrMins}",style: TextStyle(fontWeight:FontWeight.w500), textAlign: TextAlign.center ,)),
              Container(color:widget.cc,child: Text("${widget.pray.shorouqHours}:${widget.pray.shorouqMins}",style: TextStyle(fontWeight:FontWeight.w500), textAlign: TextAlign.center)),
              Container(color:widget.cc,child: Text("${widget.pray.duhrHours}:${widget.pray.duhrMins}",style: TextStyle(fontWeight:FontWeight.w500), textAlign: TextAlign.center)),
              Container(color:widget.cc,child: Text("${widget.pray.asurHours}:${widget.pray.asurMins}",style: TextStyle(fontWeight:FontWeight.w500), textAlign: TextAlign.center),),
              Container(color:widget.cc,child: Text("${widget.pray.maghribHours}:${widget.pray.maghribMins}", style: TextStyle(fontWeight:FontWeight.w500),textAlign: TextAlign.center)),
              Container(color:widget.cc,child: Text("${widget.pray.ishaHours}:${widget.pray.ishaMins}", style: TextStyle(fontWeight:FontWeight.w500),textAlign: TextAlign.center)),
            ]),
      ],
    );
  }
}
String Milademonths(String x){
  if(x.contains("-")){
    var parts = x.split('-');
    var mday= parts[0].trim();
    return mday;
  }else return x;
}
String Hijremonths(String x) {
  if (x.contains("-")) {
    var parts = x.split('-');
    var hday=parts[0].trim();
    return hday;
  } else
    return x;
}

