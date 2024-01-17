// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

OrderListModel orderListModelFromJson(String str) => OrderListModel.fromJson(json.decode(str));

String orderListModelToJson(OrderListModel data) => json.encode(data.toJson());

class OrderListModel {
  final num? status;
  final dynamic? message;
  final List<OrderDataModel>? requests;

  OrderListModel({
    required this.status,
    required this.message,
    required this.requests,
  });

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
    status: json["status"]??0,
    message: json["message"]??"",
    requests: json["requests"]==null?[]:List<OrderDataModel>.from(json["requests"].map((x) => OrderDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "requests": List<OrderDataModel>.from(requests!.map((x) => x.toJson())),
  };
}

class OrderDataModel {
  final String? address;
  final String? from;
  final String? to;
  final dynamic? promocodeUsed;
  final num? prushaseStatus;
  final num? chargeValue;
  final String? resopnse;
  final num? id;
  final String? purchaseCode;
  final String? purchaseDate;
  final num? totalAfterDiscount;
  final num? totalAmount;
  final String? stockNotes;
  final dynamic? cart;

  OrderDataModel({
    required this.address,
    required this.from,
    required this.to,
    required this.promocodeUsed,
    required this.prushaseStatus,
    required this.chargeValue,
    required this.resopnse,
    required this.id,
    required this.purchaseCode,
    required this.purchaseDate,
    required this.totalAfterDiscount,
    required this.totalAmount,
    required this.stockNotes,
    required this.cart,
  });

  factory OrderDataModel.fromJson(Map<String, dynamic> json) => OrderDataModel(
    address: json["Address"],
    from: json["From"],
    to: json["To"],
    promocodeUsed: json["PromocodeUsed"],
    prushaseStatus: json["PrushaseStatus"],
    chargeValue: json["ChargeValue"],
    resopnse: json["Resopnse"],
    id: json["Id"],
    purchaseCode: json["PurchaseCode"],
    purchaseDate: json["PurchaseDate"],
    totalAfterDiscount: json["TotalAfterDiscount"],
    totalAmount: json["TotalAmount"],
    stockNotes: json["StockNotes"],
    cart: json["cart"],
  );

  Map<String, dynamic> toJson() => {
    "Address": address,
    "From": from,
    "To": to,
    "PromocodeUsed": promocodeUsed,
    "PrushaseStatus": prushaseStatus,
    "ChargeValue": chargeValue,
    "Resopnse": resopnse,
    "Id": id,
    "PurchaseCode": purchaseCode,
    "PurchaseDate": purchaseDate,
    "TotalAfterDiscount": totalAfterDiscount,
    "TotalAmount": totalAmount,
    "StockNotes": stockNotes,
    "cart": cart,
  };
}
