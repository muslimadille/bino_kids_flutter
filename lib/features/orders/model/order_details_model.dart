
import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());

class OrderDetailsModel {
  final int status;
  final String message;
  final Request request;

  OrderDetailsModel({
    required this.status,
    required this.message,
    required this.request,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
    status: json["status"]??0,
    message: json["message"]??"",
    request: Request.fromJson(json["request"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "request": request.toJson(),
  };
}

class Request {
  final String address;
  final String from;
  final String to;
  final dynamic promocodeUsed;
  final num prushaseStatus;
  final num chargeValue;
  final dynamic resopnse;
  final int id;
  final String purchaseCode;
  final String purchaseDate;
  final num totalAfterDiscount;
  final num totalAmount;
  final dynamic stockNotes;
  final List<OrderModelItem> cart;

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
    chargeValue: json["ChargeValue"]??0,
    resopnse: json["Resopnse"],
    id: json["Id"]??0,
    purchaseCode: json["PurchaseCode"]??"",
    purchaseDate: json["PurchaseDate"]??"",
    totalAfterDiscount: json["TotalAfterDiscount"]??0,
    totalAmount: json["TotalAmount"]??0,
    stockNotes: json["StockNotes"]??"",
    cart: List<OrderModelItem>.from(json["cart"].map((x) => OrderModelItem.fromJson(x))),
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
    "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
  };
}

class OrderModelItem {
  final String modelMaterial;
  final String modelDescription;
  final String sizeName;
  final String coloeName;
  final String modelTypeName;
  final String modelCode;
  final num quantity;
  final num price;
  final num totalPrice;
  final String imageUrl;

  OrderModelItem({
    required this.modelMaterial,
    required this.modelDescription,
    required this.sizeName,
    required this.coloeName,
    required this.modelTypeName,
    required this.modelCode,
    required this.quantity,
    required this.price,
    required this.totalPrice,
    required this.imageUrl,
  });

  factory OrderModelItem.fromJson(Map<String, dynamic> json) => OrderModelItem(
    modelMaterial: json["ModelMaterial"],
    modelDescription: json["ModelDescription"],
    sizeName: json["SizeName"],
    coloeName: json["ColoeName"],
    modelTypeName: json["ModelTypeName"],
    modelCode: json["ModelCode"],
    quantity: json["Quantity"],
    price: json["Price"],
    totalPrice: json["TotalPrice"],
    imageUrl: json["ImageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "ModelMaterial": modelMaterial,
    "ModelDescription": modelDescription,
    "SizeName": sizeName,
    "ColoeName": coloeName,
    "ModelTypeName": modelTypeName,
    "ModelCode": modelCode,
    "Quantity": quantity,
    "Price": price,
    "TotalPrice": totalPrice,
    "ImageUrl": imageUrl,
  };
}
