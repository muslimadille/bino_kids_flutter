// To parse this JSON data, do
//
//     final promoCodeModel = promoCodeModelFromJson(jsonString);

import 'dart:convert';

PromoCodeModel promoCodeModelFromJson(String str) => PromoCodeModel.fromJson(json.decode(str));

String promoCodeModelToJson(PromoCodeModel data) => json.encode(data.toJson());

class PromoCodeModel {
  int status;
  String message;
  num totalAfterDiscount;
  dynamic promocodeId;
  bool exists;
  dynamic sessionId;
  dynamic returnedUrlToPayment;
  dynamic allGovernments;

  PromoCodeModel({
    required this.status,
    required this.message,
    required this.totalAfterDiscount,
    required this.promocodeId,
    required this.exists,
    required this.sessionId,
    required this.returnedUrlToPayment,
    required this.allGovernments,
  });

  factory PromoCodeModel.fromJson(Map<String, dynamic> json) => PromoCodeModel(
    status: json["status"]??0,
    message: json["message"]??"",
    totalAfterDiscount: json["totalAfterDiscount"]??0,
    promocodeId: json["promocodeId"],
    exists: json["exists"],
    sessionId: json["SessionId"],
    returnedUrlToPayment: json["returnedURLToPayment"],
    allGovernments: json["allGovernments"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "totalAfterDiscount": totalAfterDiscount,
    "promocodeId": promocodeId,
    "exists": exists,
    "SessionId": sessionId,
    "returnedURLToPayment": returnedUrlToPayment,
    "allGovernments": allGovernments,
  };
}
