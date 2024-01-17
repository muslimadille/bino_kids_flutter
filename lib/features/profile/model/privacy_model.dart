// To parse this JSON data, do
//
//     final privacyModel = privacyModelFromJson(jsonString);

import 'dart:convert';

PrivacyModel privacyModelFromJson(String str) => PrivacyModel.fromJson(json.decode(str));

String privacyModelToJson(PrivacyModel data) => json.encode(data.toJson());

class PrivacyModel {
  final int? status;
  final String? message;
  final String? data;

  PrivacyModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PrivacyModel.fromJson(Map<String, dynamic> json) => PrivacyModel(
    status: json["status"],
    message: json["message"],
    data: json["Data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Data": data,
  };
}
