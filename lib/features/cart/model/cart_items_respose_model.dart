
import 'dart:convert';

CartItemsResponseModel cartItemsResponseModelFromJson(String str) => CartItemsResponseModel.fromJson(json.decode(str));

String cartItemsResponseModelToJson(CartItemsResponseModel data) => json.encode(data.toJson());
CartItemsResponseBaseModel cartItemsResponseBaseModelFromJson(String str) => CartItemsResponseBaseModel.fromJson(json.decode(str));

String cartItemsResponseBaseModelToJson(CartItemsResponseBaseModel data) => json.encode(data.toJson());

class CartItemsResponseBaseModel {
  int? status;
  String? message;
  CartItemsResponseModel? data;

  CartItemsResponseBaseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CartItemsResponseBaseModel.fromJson(Map<String, dynamic> json) => CartItemsResponseBaseModel(
    status: json["status"]??0,
    message: json["message"]??'',
    data: CartItemsResponseModel.fromJson(json["data"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
class CartItemsResponseModel {
  final num? status;
  final String? message;
  final List<CartModelList>? modelList;
  final bool? isRedirectedToCart;
  final bool? isUserVerified;
  final bool?isOnlinePayment;

  CartItemsResponseModel({
    required this.status,
    required this.message,
    required this.modelList,
    required this.isRedirectedToCart,
    required this.isUserVerified,
    required this.isOnlinePayment
  });

  factory CartItemsResponseModel.fromJson(Map<String, dynamic> json) => CartItemsResponseModel(
    status: json["status"],
    message: json["message"],
    modelList: json["modelList"]==null?[]:List<CartModelList>.from(json["modelList"].map((x) => CartModelList.fromJson(x))),
    isRedirectedToCart: json["IsRedirectedToCart"],
    isUserVerified: json["IsUserVerified"],
    isOnlinePayment: json["IsOnlinePayment"]

  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "modelList": List<CartModelList>.from(modelList!.map((x) => x.toJson())),
    "IsRedirectedToCart": isRedirectedToCart,
    "IsUserVerified": isUserVerified,
  };
}

class CartModelList {
  final num? id;
  final num? modelId;
   num? quantity;
  final String? modelType;
  final String? name;
  final String? sizeName;
  final String? coloeName;
  final num? price;
  final num? priceBeforeDiscount;
  final String? imageUrl;
  final String? modelCode;
  final bool? isDeletedOrHidden;
  final num? colorId;
  final dynamic? colorsList;
  final bool? isHasBalance;
  /// local variables
  bool? isSelected;

  CartModelList({
    required this.id,
    required this.modelId,
    required this.quantity,
    required this.modelType,
    required this.name,
    required this.sizeName,
    required this.coloeName,
    required this.price,
    required this.priceBeforeDiscount,
    required this.imageUrl,
    required this.modelCode,
    required this.isDeletedOrHidden,
    required this.colorId,
    required this.colorsList,
    required this.isHasBalance,
    this.isSelected,
  });

  factory CartModelList.fromJson(Map<String, dynamic> json) => CartModelList(
    id: json["ID"],
    modelId: json["ModelId"],
    quantity: json["Quantity"],
    modelType: json["ModelType"],
    name: json["Name"],
    sizeName: json["SizeName"],
    coloeName: json["ColoeName"],
    price: json["Price"],
    priceBeforeDiscount: json["PriceBeforeDiscount"],
    imageUrl: json["ImageUrl"],
    modelCode: json["ModelCode"],
    isDeletedOrHidden: json["IsDeletedOrHidden"],
    colorId: json["ColorId"],
    colorsList: json["ColorsList"],
    isHasBalance: json["IsHasBalance"]
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "ModelId": modelId,
    "Quantity": quantity,
    "ModelType": modelType,
    "Name": name,
    "SizeName": sizeName,
    "ColoeName": coloeName,
    "Price": price,
    "PriceBeforeDiscount": priceBeforeDiscount,
    "ImageUrl": imageUrl,
    "ModelCode": modelCode,
    "IsDeletedOrHidden": isDeletedOrHidden,
    "ColorId": colorId,
    "ColorsList": colorsList,
  };
}
