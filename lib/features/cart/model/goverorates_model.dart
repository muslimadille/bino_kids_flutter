// To parse this JSON data, do
//
//     final governoratesModel = governoratesModelFromJson(jsonString);

import 'dart:convert';

GovernoratesModel governoratesModelFromJson(String str) => GovernoratesModel.fromJson(json.decode(str));

String governoratesModelToJson(GovernoratesModel data) => json.encode(data.toJson());

class GovernoratesModel {
  int status;
  dynamic message;
  dynamic totalAfterDiscount;
  dynamic promocodeId;
  bool exists;
  dynamic sessionId;
  dynamic returnedUrlToPayment;
  List<Government> allGovernments;

  GovernoratesModel({
    required this.status,
    required this.message,
    required this.totalAfterDiscount,
    required this.promocodeId,
    required this.exists,
    required this.sessionId,
    required this.returnedUrlToPayment,
    required this.allGovernments,
  });

  factory GovernoratesModel.fromJson(Map<String, dynamic> json) => GovernoratesModel(
    status: json["status"],
    message: json["message"],
    totalAfterDiscount: json["totalAfterDiscount"],
    promocodeId: json["promocodeId"],
    exists: json["exists"],
    sessionId: json["SessionId"],
    returnedUrlToPayment: json["returnedURLToPayment"],
    allGovernments: List<Government>.from(json["allGovernments"].map((x) => Government.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "totalAfterDiscount": totalAfterDiscount,
    "promocodeId": promocodeId,
    "exists": exists,
    "SessionId": sessionId,
    "returnedURLToPayment": returnedUrlToPayment,
    "allGovernments": List<Government>.from(allGovernments.map((x) => x.toJson())),
  };
}

class Government {
  int id;
  String name;
  num chargeValue;

  Government({
    required this.id,
    required this.name,
    required this.chargeValue,
  });

  factory Government.fromJson(Map<String, dynamic> json) => Government(
    id: json["ID"],
    name: json["Name"],
    chargeValue: json["ChargeValue"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Name": name,
    "ChargeValue": chargeValue,
  };
}
