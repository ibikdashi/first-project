import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ibad_client/pages/calendarnew/awsdata.dart';
import 'package:jiffy/jiffy.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'aws_api_connection.dart';
import 'awstablerow.dart';

class AWSCalendarScreen extends StatefulWidget {
  final Color c;

  const AWSCalendarScreen({Key key, this.c}) : super(key: key);
  @override
  _AWSCalendarScreenState createState() => _AWSCalendarScreenState();
}

class _AWSCalendarScreenState extends State<AWSCalendarScreen> {
  double tfs = 15;
  double bfs = 20;
  String hijri;
  String milade ;
  Data pray;
  ItemScrollController _scrollController = ItemScrollController();
  var x;
  String date;
  var today;
  var now=DateTime.now();
  var tColor = Colors.black;
  var lColor = Colors.blue;
  List<String> _dateList = [];
  Data list;
  List<Datum>list2=[];
  JsonConnection jsonConnection = JsonConnection();
 // String pattern = 'dd-mm-yyyy';
 String month;
  var end,start;
  double heightc;


  void initState() {
    super.initState();

    hijri =  hijri ?? "جاري التحميل";
    milade = milade ??"جاري التحميل";
    var df='dd-MM-yyyy';
    var e=DateTime.now().add(Duration(days: 7));
    end=Jiffy(e).format(df);
    start=Jiffy(now).format(df);
    //_controller.addListener(listenScrolling);
    today = DateTime.now().day.toString().padLeft(2, '0');
    print(end);
    print(start);
    getData(0);

  }
  void getData(int x) async {
    final String url = 'http://18.232.121.167:4000/salawats?page=1&limit=7&startDate=$start&endDate=$end';
    http.Response response = await http.get(Uri.parse(url), headers: {
      "Accept":
      "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });
      list= Data.fromJson(json.decode(response.body));
      list2= Data.fromJson(json.decode(response.body)).data;
    if(list!=null){
      print(list.length);
      setState(() {
        Data prayList=list;
        print("prayList.errors.toString()");
        var lenght = prayList.length;
        for (int i = 0; i < lenght; i++) {
          var _day = prayList.data[i].miladi;
          _dateList.add(_day);
          if (_dateList[i].contains("-")) {
            var parts = _day.split('-');
            var d = parts[0].trim();
            var today=parts[0].trim();
            print("DateList"+ today.toString());
            //print("Hijri:" + hijri.toString());
            hijri = Hijremonths(prayList.data[0].hijri.toString());
            //print("Hijri2:" + hijri.toString());
            milade = Milademonths(prayList.data[0].miladi);
            print(hijri);
            return d;
          }else {
            hijri = Hijremonths(prayList.data[x].hijri);
            print("hijrix"+hijri);
            milade = Milademonths(prayList.data[x].miladi);
          }
          }
        }
        );
    }


  }
  String Milademonths(String x){
    Map<String,String> arMonth = {"01":"كانون الثاني", "02":"شباط", "03":"آذار", "04":"نيسان",
      "05":"	أيار",
      "06":"حزيران",
      "07":"تموز",
      "08":"	آب",
      "09":"	أيلول",
      "10":"	تشرين الأول",
      "11":"تشرين الثاني",
      "12":'كانون الأول'
    };
    if(x.contains("-")){
      var parts = x.split('-');
      var month = parts[1].trim();
      return arMonth[month];
    }else return x;
  }
  String Hijremonths(String x) {
    Map<String,String>arhijri={'01':'مُحَرَّم', '02':'صَفَر', '03':'رَبِيْعُ الأَوّل', '04':'رَبِيْعُ الثَّانِي', '05':'جَمَادِي الأَوّل', '06':'جَمَادِي الثَّانِي', '07':'رَجَب', '08':'شَعْبَان', '09':'رَمَضَان ', '10':'شَوَّال', '11':'ذُوالْقَعْدَة', '12':'ذُوالْحِجَّة'};
    if (x.contains("-")) {
      var parts = x.split('-');
      var prefix = parts[1].trim();
      var month=arhijri[prefix];
      print("MonthHijri"+month);
      return month;
    } else
      print("Hijrifunction"+x);
      return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Table(
          textDirection: TextDirection.rtl,
            columnWidths: const <int, TableColumnWidth>{
              0: FractionColumnWidth(0.15),
              4: IntrinsicColumnWidth(),
            },
            border: TableBorder.all(color: Colors.black),
            children: [
              TableRow(
                  children: [
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
                      // softWrap: true,
                      // overflow: TextOverflow.clip,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: tColor,
                        fontSize: hijri.characters.length > 5 ? 11 : 15,
                      )),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(milade,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: milade.contains('ال') ? 11 : 15,
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
                color: Colors.white,
                 //height: MediaQuery.of(context).size.shortestSide*0.6,
                height: MediaQuery.of(context).size.shortestSide*0.47,
                child: (list2.isEmpty)
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: CircularProgressIndicator()),
                          Center(child: Text("الرجاء الإنتظار")),
                        ],
                      )
                    :ScrollablePositionedList.builder(
                  itemScrollController: _scrollController,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    Color cc = (index == x)
                        ? Colors.lightGreenAccent
                        : Colors.white;
                    Color bc = (index == x) ? Colors.red : Colors.black;
                    Color c = (index == x) ? Colors.lightGreenAccent : widget.c;
                    return PrayerView(pray: list.data[index],c: c ,bc: bc,cc: cc,);
                  },
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => Ptoday(),
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text(
                    "اليوم",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }


  void Ptoday() {
    if (_dateList.contains(start)) {
      month = DateTime.now().month.toString().padLeft(2, '0');
      x = _dateList.indexOf(start);
      Text(
        list.data[x].miladi,
        style: TextStyle(color: Colors.redAccent),
      );
      _scrollController.jumpTo(index: x);
      getData(x);
    } else
      print("mot true" + start.toString());
  }
}
