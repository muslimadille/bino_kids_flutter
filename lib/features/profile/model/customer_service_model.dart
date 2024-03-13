// To parse this JSON data, do
//
//     final customerServiceModel = customerServiceModelFromJson(jsonString);

import 'dart:convert';

CustomerServiceModel customerServiceModelFromJson(String str) => CustomerServiceModel.fromJson(json.decode(str));

String customerServiceModelToJson(CustomerServiceModel data) => json.encode(data.toJson());

class CustomerServiceModel {
  int status;
  String message;
  String data;

  CustomerServiceModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CustomerServiceModel.fromJson(Map<String, dynamic> json) => CustomerServiceModel(
    status: json["status"]??0,
    message: json["message"]??"",
    data: json["Data"]??'',
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
