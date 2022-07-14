import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ibad_client/pages/calendar/Utils.dart';
import 'package:ibad_client/pages/calendar/api_connection.dart';
import 'package:ibad_client/pages/calendar/data.dart';
import 'package:ibad_client/pages/calendar/tablerow.dart';
import 'package:indexed_list_view/indexed_list_view.dart';
import 'package:http/http.dart' as http;

class CalendarScreen extends StatefulWidget {
  final Color c;

  const CalendarScreen({Key key, this.c}) : super(key: key);
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  double tfs = 15;
  double bfs = 20;

  String hijri;
  Data pray;
  String milade;
  var x;
  static double pLat;
  static double pLong;
  static String city = 'Beirut';
  static String country = 'Lebanon';
  static String month;
  //var _controller = IndexedScrollController();
  final _controller = ScrollController();
  String date;
  var today;
  var tColor = Colors.black;
  var lColor = Colors.blue;
  List<Datum> _prayList = [];
  List<String> _dateList = [];
  List<String> EnMonth = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  List<String> ArMonth = [
    "كانون الثاني",
    "شباط",
    "آذار",
    "نيسان",
    "	أيار",
    "حزيران",
    "تموز",
    "	آب",
    "	أيلول",
    "	تشرين الأول",
    "تشرين الثاني",
    'كانون الأول'
  ];
  JsonConnection jsonConnection = JsonConnection();

  String year;
  int method = 4;

  void initState() {
    super.initState();
    hijri = "Loading";
    milade = "loading";
    _controller.addListener(listenScrolling);
    today = DateTime.now().day.toString().padLeft(2, '0');
    month = DateTime.now().month.toString().padLeft(2, '0');
    year = DateTime.now().year.toString();
    getData(month, 0);
  }
  void listenScrolling() {
    print("Strat");
    if (_controller.position.atEdge) {
      final isTop = _controller.position.pixels == 0;

      if (isTop) {
        print("Reach Start");
        //Utils.showSnackBar(context, text: 'Reached Start');
      } else {
        print("Reach End");
        //Utils.showSnackBar(context, text: 'Reached End');
      }
    }
  }
  void getData(String m, int x) async {
    final String url =
        'https://api.aladhan.com/v1/calendarByCity?city=$city&country=$country&method=$method&month=$m&year=$year';
    //String date = DateTime.now().toIso8601String();

    http.Response response = await http.get(url);
    setState(() {
      _prayList = Data.fromJson(json.decode(response.body)).data;
      var lenght = _prayList.length;

      for (int i = 0; i < lenght; i++) {
        _dateList.add(_prayList[i].date.gregorian.day);
      }
      pray = Data.fromJson(json.decode(response.body));
      if (x == 0) {
        hijri = pray.data[0].date.hijri.month.ar;
        milade = pray.data[0].date.gregorian.month.en;
        if (EnMonth.contains(milade)) {
          int i = EnMonth.indexOf(milade);
          milade = ArMonth[i];
        }
      } else {
        hijri = pray.data[x].date.hijri.month.ar;
        milade = pray.data[x].date.gregorian.month.en;
        if (EnMonth.contains(milade)) {
          int i = EnMonth.indexOf(milade);
          milade = ArMonth[i];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Table(
            textDirection: TextDirection.rtl,
            columnWidths: const <int, TableColumnWidth>{
              0: FractionColumnWidth(0.15),
              4:IntrinsicColumnWidth(),
            },
            border: TableBorder.all(color: Colors.black),
            children: [
              TableRow(children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Text('أيام ألاسبوع',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: tColor,
                          fontSize: tfs)),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(hijri,
                      softWrap: false,
                      overflow:TextOverflow.clip,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: tColor,
                        fontSize: hijri.contains('ذو')? 11:15,
                      )),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(milade,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: tfs,
                          color: tColor)),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text('الفجر',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: tfs,
                          color: tColor)),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text('الشروق',
                      overflow: TextOverflow.clip,
                      softWrap: false,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: tfs,
                          color: tColor)),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    child: Text('الظهر',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: tfs,
                            color: tColor)),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    //color: Colors.lightGreen,
                    child: Text('العصر',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: tfs,
                            color: tColor)),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    //color: Colors.lightGreen,
                    child: Text('المغرب',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: tfs,
                            color: tColor)),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text('العشاء',
                      overflow: TextOverflow.clip,
                      softWrap: false,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: tfs,
                          color: tColor)),
                ),
              ]),
            ]),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              //height: 150,
               color: Colors.white,
              height: MediaQuery.of(context).size.shortestSide*0.5,
              // child: FutureBuilder(
              //   future: jsonConnection.getPTData(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState ==
              //         ConnectionState.waiting) {
              //       return Center(child: Column(
              //         children: [
              //           CircularProgressIndicator(),
              //           Text("Loading please wait"),
              //         ],
              //       ));
              //     } else {
              //
              //       return IndexedListView.builder(
              //         minItemCount: 0,
              //           maxItemCount: _prayList.length-1,
              //           controller: controller,
              //           itemBuilder: (context,index){
              //             Color cc=(index == x) ? Colors.yellow : Colors.white;
              //             Color bc=(index == x) ? Colors.red : Colors.black;
              //             Color c=(index == x) ? Colors.yellow : widget.c;
              //           return PrayScreen(_prayList[index], c, bc, cc);
              //         },
              //       );
              //     }
              //   },
              // ),
              child: (_prayList.isEmpty)?  Column(
                children: [
                  CircularProgressIndicator(),
                  Text("Loading please wait"),
                ],
              ) : ListView.builder(
                      // minItemCount: 0,
                      //   maxItemCount: _prayList.length-1,
                itemCount: _prayList.length-1,
                        controller: _controller,
                        itemBuilder: (context,index){
                          Color cc=(index == x) ? Colors.lightGreenAccent : Colors.white;
                          Color bc=(index == x) ? Colors.red : Colors.black;
                          Color c=(index == x) ? Colors.lightGreenAccent : widget.c;
                        return PrayScreen(_prayList[index], c, bc, cc);
                      },
                    ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("الشهر السابق"),
                IconButton(
                    icon: Icon(FontAwesomeIcons.arrowAltCircleLeft),
                    onPressed: () => premonth()),
                IconButton(
                    icon: Icon(FontAwesomeIcons.arrowAltCircleRight),
                    onPressed: () => nextmonth()),
                Text("الشهر القادم"),
                ElevatedButton(
                  onPressed: () => Ptoday(),
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text("TODAY",style: TextStyle(color: Colors.black),),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  void nextmonth() {
    var m = DateTime.now().month;
    setState(() {
      m = m + 1;
      month = m.toString().padLeft(2, '0');
      getData(month, 0);
    });
  }

  void premonth() {
    var m = DateTime.now().month;
    setState(() {
      m = m - 1;
      month = m.toString().padLeft(2, '0');
      getData(month, 0);
    });
  }

  void Ptoday() {
    if (_dateList.contains(today)) {
      month = DateTime.now().month.toString().padLeft(2, '0');
      x = _dateList.indexOf(today);
      Text(
        _prayList[x].date.gregorian.day,
        style: TextStyle(color: Colors.redAccent),
      );
      print("index:" + x.toString());
      //_controller.jumpToIndex(x);
      double y=x+.0;
      _controller.jumpTo(y);
      getData(month, x);
    } else
      print("mot true" + today.toString());
  }
}
