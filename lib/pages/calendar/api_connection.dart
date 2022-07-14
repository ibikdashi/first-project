import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:ibad_client/pages/calendar/data.dart';


class JsonConnection {

  Data list, list2;
  String month, year;
  static double pLat;
  static double pLong;
  static String city = 'Beirut';
  static String country = 'Lebanon';
  static int method = 2;

  final String url =
      'http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=$method';


  Future getPTData() async {
    http.Response res = await http.get(Uri.encodeFull(url), headers: {
      "Accept":
      "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });
    final data = jsonDecode(res.body);

    list = Data.fromJson(data);
    return list;
  }

  Future getPTLocation() async {
    final position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    //pLat = position.latitude;
    pLat=27.2046;
    //pLong = position.longitude;
    pLong=77.4977;

    String date = DateTime.now().toIso8601String();
    int method = 4;

    final url = "http://api.aladhan.com/v1/timings/$date?latitude=$pLat&longitude=$pLong&method=$method";
    final String url2 = 'https://api.aladhan.com/v1/hijriCalendar?latitude=$pLat&longitude=$pLong&method=$method&month=$month&year=$year';

    http.Response res = await http.get(Uri.encodeFull(url), headers: {
      "Accept":
      "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });

    final data = json.decode(res.body);

    list = new Data.fromJson(data);
    return list;
  }
}