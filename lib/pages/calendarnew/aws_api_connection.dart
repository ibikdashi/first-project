import 'dart:convert';
import 'package:http/http.dart' as http;
import 'awsdata.dart';

class JsonConnection {

  Data praylist;
  String hijri = "جاري التحميل";
  String milade = "جاري التحميل";
  //final String url = 'http://18.232.121.167:4000/salawats?page=1&limit=10 ';
  //final String url = 'http://18.232.121.167:4000/salawats?page=1&limit=7&startDate=1-12-2023&endDate=31-12-2023 ';
  final String postsURL = "http://18.232.121.167:4000/salawats?page=1&limit=7&startDate=1-12-2023&endDate=31-12-2023";

  Future getPTData() async {
    http.Response res = await http.get(Uri.parse(postsURL), headers: {
      "Accept":
      "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });
    Data results = Data.fromJson(json.decode(res.body));
    praylist=results;
    if (results != null) {
      print("lenght"+results.length.toString());
      print("The Values are:" +results.data[0].hijri);
      header(results, 0);
      return results;
    }else print("null");
  }


  Future HijriTData() async {
    http.Response res = await http.get(Uri.parse(postsURL), headers: {
      "Accept":
      "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });
    Data results = Data.fromJson(json.decode(res.body));
    if (results == null) {
      hijri="جاري التحميل";
      milade="جاري التحميل";
    }else {
      hijri = Hijremonths(results.data[0].hijri.toString());
      print("Hijri2:" + hijri.toString());
      milade = Milademonths(results.data[0].miladi);
    }
  }

  String date = DateTime.now().toIso8601String();

  String header(Data _prayList,int x,){
    List<String> _dateList = [];
    print(_prayList);
    var lenght = _prayList.length;
    for (int i = 0; i < lenght; i++) {
      var _day = _prayList.data[i].miladi;
       _dateList.add(_day);
      if (_dateList.contains("-")) {
        var parts = _day.split('-');
        var d = parts[0].trim();
        return d;
      }
      Data pray =_prayList;
      if (x == 0) {
        hijri = Hijremonths(pray.data[0].hijri);
        print("Hijri:" + hijri.toString());
        milade = Milademonths(pray.data[0].miladi);
      }
      else {
        hijri = Hijremonths(pray.data[x].hijri);
        milade = Milademonths(pray.data[x].miladi);
      }
    }
  }
  String Milademonths(String x){
    Map<String,String> arMonth = {"01":"كانون الثاني", "022":"شباط", "03":"آذار", "04":"نيسان",
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
      print("object"+arMonth[month]);
      return arMonth[month];
    }else
      print(x);
      return x;
  }
  String Hijremonths(String x) {
    Map<String,String>arhijri={'01':'مُحَرَّم', '02':'صَفَر', '03':'رَبِيْعُ الأَوّل', '04':'رَبِيْعُ الثَّانِي', '05':'جَمَادِي الأَوّل', '06':'جَمَادِي الثَّانِي', '07':'رَجَب', '08':'شَعْبَان', '09':'رَمَضَان ', '10':'شَوَّال', '11':'ذُوالْقَعْدَة', '12':'ذُوالْحِجَّة'};
    if (x.contains("-")) {
      var parts = x.split('-');
      var prefix = parts[1].trim();
      var month=arhijri[prefix];
      print("Hijrimonths"+month);
      return month;
    } else
      print(x);
      return x;
  }
}