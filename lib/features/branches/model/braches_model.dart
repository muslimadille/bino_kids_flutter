// To parse this JSON data, do
//
//     final branchesModel = branchesModelFromJson(jsonString);

import 'dart:convert';

BranchesModel branchesModelFromJson(String str) => BranchesModel.fromJson(json.decode(str));

String branchesModelToJson(BranchesModel data) => json.encode(data.toJson());

class BranchesModel {
  int status;
  dynamic message;
  Branches data;

  BranchesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BranchesModel.fromJson(Map<String, dynamic> json) => BranchesModel(
    status: json["status"]??0,
    message: json["message"]??'',
    data: Branches.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Branches {
  List<Branch> branches;

  Branches({
    required this.branches,
  });

  factory Branches.fromJson(Map<String, dynamic> json) => Branches(
    branches: List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
  };
}

class Branch {
  int id;
  String name;
  String address;
  List<String> telephoneNumbers;
  List<String> whatsAppNumbers;
  String eMail;
  String timesOfWork;
  double latitude;
  double longitude;
  String branchLink;
  List<String>bannerImageList;

  Branch({
    required this.id,
    required this.name,
    required this.address,
    required this.telephoneNumbers,
    required this.whatsAppNumbers,
    required this.eMail,
    required this.timesOfWork,
    required this.latitude,
    required this.longitude,
    required this.branchLink,
    required this.bannerImageList
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["ID"],
    name: json["Name"],
    address: json["Address"],
    telephoneNumbers: List<String>.from(json["TelephoneNumbers"].map((x) => x)),
    whatsAppNumbers: List<String>.from(json["WhatsAppNumbers"].map((x) => x)),
    eMail: json["E_Mail"],
    timesOfWork: json["timesOfWork"],
    latitude: json["Latitude"]?.toDouble(),
    longitude: json["Longitude"]?.toDouble(),
    branchLink: json["BranchLink"],
    bannerImageList: List<String>.from(json["BannerImageList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Name": name,
    "Address": address,
    "TelephoneNumbers": List<dynamic>.from(telephoneNumbers.map((x) => x)),
    "WhatsAppNumbers": List<dynamic>.from(whatsAppNumbers.map((x) => x)),
    "E_Mail": eMail,
    "timesOfWork": timesOfWork,
    "Latitude": latitude,
    "Longitude": longitude,
    "BranchLink": branchLink,
  };
}
