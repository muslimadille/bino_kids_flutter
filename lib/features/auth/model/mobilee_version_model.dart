// To parse this JSON data, do
//
//     final mobileVersionModel = mobileVersionModelFromJson(jsonString);

import 'dart:convert';

MobileVersionModel mobileVersionModelFromJson(String str) => MobileVersionModel.fromJson(json.decode(str));

String mobileVersionModelToJson(MobileVersionModel data) => json.encode(data.toJson());

class MobileVersionModel {
  final int status;
  final dynamic message;
  final LatestVersion latestVersion;

  MobileVersionModel({
    required this.status,
    required this.message,
    required this.latestVersion,
  });

  factory MobileVersionModel.fromJson(Map<String, dynamic> json) => MobileVersionModel(
    status: json["status"]??0,
    message: json["message"]??"",
    latestVersion: LatestVersion.fromJson(json["LatestVersion"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "LatestVersion": latestVersion.toJson(),
  };
}

class LatestVersion {
  final num minVersion;
  final num currentVersion;
  final DateTime versionDate;

  LatestVersion({
    required this.minVersion,
    required this.currentVersion,
    required this.versionDate,
  });

  factory LatestVersion.fromJson(Map<String, dynamic> json) => LatestVersion(
    minVersion: json["minVersion"]??0,
    currentVersion: json["currentVersion"]??0,
    versionDate: DateTime.parse(json["VersionDate"]),
  );

  Map<String, dynamic> toJson() => {
    "minVersion": minVersion,
    "currentVersion": currentVersion,
    "VersionDate": versionDate.toIso8601String(),
  };
}
