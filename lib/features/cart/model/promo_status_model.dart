// To parse this JSON data, do
//
//     final promoStatusModel = promoStatusModelFromJson(jsonString);

import 'dart:convert';

PromoStatusModel promoStatusModelFromJson(String str) => PromoStatusModel.fromJson(json.decode(str));

String promoStatusModelToJson(PromoStatusModel data) => json.encode(data.toJson());

class PromoStatusModel {
  final int status;
  final String message;
  final num totalAfterDiscount;
  final num totalBeforeDiscount;
  final num discountValue;
  final String promocodeId;
  final bool exists;
  final String returnedUrlToPayment;
  final dynamic allGovernments;

  PromoStatusModel({
    required this.status,
    required this.message,
    required this.totalAfterDiscount,
    required this.totalBeforeDiscount,
    required this.discountValue,
    required this.promocodeId,
    required this.exists,
    required this.returnedUrlToPayment,
    required this.allGovernments,
  });

  factory PromoStatusModel.fromJson(Map<String, dynamic> json) => PromoStatusModel(
    status: json["status"]??0,
    message: json["message"]??"",
    totalAfterDiscount: json["totalAfterDiscount"]??0,
    totalBeforeDiscount: json["totalBeforeDiscount"]??0,
    discountValue: json["DiscountValue"]??0,
    promocodeId: json["promocodeId"]??"",
    exists: json["exists"]??false,
    returnedUrlToPayment: json["returnedURLToPayment"]??"",
    allGovernments: json["allGovernments"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "totalAfterDiscount": totalAfterDiscount,
    "totalBeforeDiscount": totalBeforeDiscount,
    "DiscountValue": discountValue,
    "promocodeId": promocodeId,
    "exists": exists,
    "returnedURLToPayment": returnedUrlToPayment,
    "allGovernments": allGovernments,
  };
}
