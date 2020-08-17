// To parse this JSON data, do
//
//     final corona = coronaFromJson(jsonString);

import 'dart:convert';

Corona coronaFromJson(String str) => Corona.fromJson(json.decode(str));

String coronaToJson(Corona data) => json.encode(data.toJson());

class Corona {
  Corona({
    this.success,
    this.result,
  });

  bool success;
  List<dynamic> result;

  factory Corona.fromJson(Map<String, dynamic> json) => Corona(
    success: json["success"] == null ? null : json["success"],
    result: json["result"] == null ? null : List<dynamic>.from(json["result"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "result": result == null ? null : List<dynamic>.from(result.map((x) => x)),
  };
}

class ResultClass {
  ResultClass({
    this.country,
    this.totalCases,
    this.newCases,
    this.totalDeaths,
    this.newDeaths,
    this.totalRecovered,
    this.activeCases,
  });

  String country;
  String totalCases;
  String newCases;
  String totalDeaths;
  String newDeaths;
  String totalRecovered;
  String activeCases;

  factory ResultClass.fromJson(Map<String, dynamic> json) => ResultClass(
    country: json["country"] == null ? null : json["country"],
    totalCases: json["totalCases"] == null ? null : json["totalCases"],
    newCases: json["newCases"] == null ? null : json["newCases"],
    totalDeaths: json["totalDeaths"] == null ? null : json["totalDeaths"],
    newDeaths: json["newDeaths"] == null ? null : json["newDeaths"],
    totalRecovered: json["totalRecovered"] == null ? null : json["totalRecovered"],
    activeCases: json["activeCases"] == null ? null : json["activeCases"],
  );

  Map<String, dynamic> toJson() => {
    "country": country == null ? null : country,
    "totalcases": totalCases == null ? null : totalCases,
    "newCases": newCases == null ? null : newCases,
    "totaldeaths": totalDeaths == null ? null : totalDeaths,
    "newDeaths": newDeaths == null ? null : newDeaths,
    "totalRecovered": totalRecovered == null ? null : totalRecovered,
    "activeCases": activeCases == null ? null : activeCases,
  };
}
