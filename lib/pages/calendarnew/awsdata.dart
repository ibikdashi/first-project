// To parse this JSON data, do
//
//     final prayModel = prayModelFromJson(jsonString);

import 'dart:convert';

Data prayModelFromJson(String str) => Data.fromJson(json.decode(str));

String prayModelToJson(Data data) => json.encode(data.toJson());

class Data {
  List<dynamic> errors;
  int length;
  List<Datum> data;
  DateTime requestTime;

  Data({
    this.errors,
    this.length,
    this.data,
    this.requestTime,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
    length: json["length"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    requestTime: DateTime.parse(json["requestTime"]),
  );

  Map<String, dynamic> toJson() => {
    "errors": List<dynamic>.from(errors.map((x) => x)),
    "length": length,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "requestTime": requestTime.toIso8601String(),
  };
}

class Datum {
  String id;
  String day;
  DateTime isoDate;
  String miladi;
  String hijri;
  String fajrMins;
  String fajrHours;
  String shorouqMins;
  String shorouqHours;
  String duhrMins;
  String duhrHours;
  String asurMins;
  String asurHours;
  String maghribMins;
  String maghribHours;
  String ishaMins;
  String ishaHours;
  String note;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    this.id,
    this.day,
    this.isoDate,
    this.miladi,
    this.hijri,
    this.fajrMins,
    this.fajrHours,
    this.shorouqMins,
    this.shorouqHours,
    this.duhrMins,
    this.duhrHours,
    this.asurMins,
    this.asurHours,
    this.maghribMins,
    this.maghribHours,
    this.ishaMins,
    this.ishaHours,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    day: json["day"],
    isoDate: DateTime.parse(json["isoDate"]),
    miladi: json["miladi"],
    hijri: json["hijri"],
    fajrMins: json["fajrMins"],
    fajrHours: json["fajrHours"],
    shorouqMins: json["shorouqMins"],
    shorouqHours: json["shorouqHours"],
    duhrMins: json["duhrMins"],
    duhrHours: json["duhrHours"],
    asurMins: json["asurMins"],
    asurHours: json["asurHours"],
    maghribMins: json["maghribMins"],
    maghribHours: json["maghribHours"],
    ishaMins: json["ishaMins"],
    ishaHours: json["ishaHours"],
    note: json["note"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "day": day,
    "isoDate": isoDate.toIso8601String(),
    "miladi": miladi,
    "hijri": hijri,
    "fajrMins": fajrMins,
    "fajrHours": fajrHours,
    "shorouqMins": shorouqMins,
    "shorouqHours": shorouqHours,
    "duhrMins": duhrMins,
    "duhrHours": duhrHours,
    "asurMins": asurMins,
    "asurHours": asurHours,
    "maghribMins": maghribMins,
    "maghribHours": maghribHours,
    "ishaMins": ishaMins,
    "ishaHours": ishaHours,
    "note": note,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
