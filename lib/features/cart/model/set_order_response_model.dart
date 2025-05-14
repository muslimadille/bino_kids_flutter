
import 'dart:convert';

SetOrderResponseModel setOrderResponseModelFromJson(String str) => SetOrderResponseModel.fromJson(json.decode(str));

String setOrderResponseModelToJson(SetOrderResponseModel data) => json.encode(data.toJson());

class SetOrderResponseModel {
  final int status;
  final String message;
  final dynamic totalAfterDiscount;
  final String promocodeId;
  final bool exists;
  final String sessionId;
  final String returnedUrlToPayment;
  final dynamic allGovernments;

  SetOrderResponseModel({
    required this.status,
    required this.message,
    required this.totalAfterDiscount,
    required this.promocodeId,
    required this.exists,
    required this.sessionId,
    required this.returnedUrlToPayment,
    required this.allGovernments,
  });

  factory SetOrderResponseModel.fromJson(Map<String, dynamic> json) => SetOrderResponseModel(
    status: json["status"]??-1,
    message: json["message"]??"",
    totalAfterDiscount: json["totalAfterDiscount"].toString(),
    promocodeId: json["promocodeId"]??"",
    exists: json["exists"]??false,
    sessionId: json["SessionId"]??"",
    returnedUrlToPayment: json["returnedURLToPayment"]??"",
    allGovernments: json["allGovernments"]??[],
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
