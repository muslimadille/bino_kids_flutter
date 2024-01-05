
import 'dart:convert';

OrdersListModel ordersListModelFromJson(String str) => OrdersListModel.fromJson(json.decode(str));

String ordersListModelToJson(OrdersListModel data) => json.encode(data.toJson());

class OrdersListModel {
  final int status;
  final dynamic message;
  final List<Request> requests;
  final dynamic request;

  OrdersListModel({
    required this.status,
    required this.message,
    required this.requests,
    required this.request,
  });

  factory OrdersListModel.fromJson(Map<String, dynamic> json) => OrdersListModel(
    status: json["status"],
    message: json["message"],
    requests: List<Request>.from(json["requests"].map((x) => Request.fromJson(x))),
    request: json["request"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "requests": List<dynamic>.from(requests.map((x) => x.toJson())),
    "request": request,
  };
}

class Request {
  final String address;
  final String from;
  final String to;
  final dynamic promocodeUsed;
  final int prushaseStatus;
  final int chargeValue;
  final String resopnse;
  final int id;
  final dynamic purchaseCode;
  final String purchaseDate;
  final int totalAfterDiscount;
  final int totalAmount;
  final String stockNotes;
  final dynamic cart;

  Request({
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

  factory Request.fromJson(Map<String, dynamic> json) => Request(
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
