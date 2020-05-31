// To parse this JSON data, do
//
//     final service = serviceFromJson(jsonString);

import 'dart:convert';

List<Service> serviceFromJson(String str) => List<Service>.from(json.decode(str).map((x) => Service.fromJson(x)));

String serviceToJson(List<Service> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Service {
  String slno;
  String rollno;
  String name;
  String branch;
  String batch;
  String lastduemonth;
  String lastdueyear;
  String status;

  Service({
    this.slno,
    this.rollno,
    this.name,
    this.branch,
    this.batch,
    this.lastduemonth,
    this.lastdueyear,
    this.status,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    slno: json["slno"],
    rollno: json["rollno"],
    name: json["name"],
    branch: json["branch"],
    batch: json["batch"],
    lastduemonth: json["lastduemonth"],
    lastdueyear: json["lastdueyear"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "slno": slno,
    "rollno": rollno,
    "name": name,
    "branch": branch,
    "batch": batch,
    "lastduemonth": lastduemonth,
    "lastdueyear": lastdueyear,
    "status": status,
  };
}
