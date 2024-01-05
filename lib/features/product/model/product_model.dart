
import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final num? id;
  final num? modelListId;
  final String? modelType;
  final String? guId;
  final String? productData;
  final String? material;
  final String? description;
  final num? priceAfter;
  final num? priceBefore;
  final String? imageUrl;
  final String? originalImageUrl;
  final String? modelCode;
  final String? modelTradeMarkName;
  final String? modelAgeName;
  final bool? isInWishList;
  final num? colorId;
  final bool? isMoreThanThreeColors;
  final dynamic? colorsList;

  ProductModel({
    required this.id,
    required this.modelListId,
    required this.modelType,
    required this.guId,
    required this.productData,
    required this.material,
    required this.description,
    required this.priceAfter,
    required this.priceBefore,
    required this.imageUrl,
    required this.originalImageUrl,
    required this.modelCode,
    required this.modelTradeMarkName,
    required this.modelAgeName,
    required this.isInWishList,
    required this.colorId,
    required this.isMoreThanThreeColors,
    required this.colorsList,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["ID"]??-1,
    modelListId: json["Id"]??-1,
    modelType: json["ModelType"]??'',
    guId: json["GuID"]??'',
    productData: json["ProductData"],
    material: json["Material"]??'',
    description: json["Description"],
    priceAfter: json["PriceAfter"],
    priceBefore: json["PriceBefore"],
    imageUrl: json["ImageUrl"]??"",
    originalImageUrl: json["OriginalImageUrl"]??'',
    modelCode: json["ModelCode"]??'',
    modelTradeMarkName: json["ModelTradeMarkName"]??"",
    modelAgeName: json["ModelAgeName"]??"",
    isInWishList: json["isInWishList"]??false,
    colorId: json["ColorId"]??-1,
    isMoreThanThreeColors: json["IsMoreThanThreeColors"]??false,
    colorsList: json["ColorsList"]??[],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Id": modelListId,
    "ModelType": modelType,
    "GuID": guId,
    "ProductData": productData,
    "Material": material,
    "Description": description,
    "PriceAfter": priceAfter,
    "PriceBefore": priceBefore,
    "ImageUrl": imageUrl,
    "OriginalImageUrl": originalImageUrl,
    "ModelCode": modelCode,
    "ModelTradeMarkName": modelTradeMarkName,
    "ModelAgeName": modelAgeName,
    "isInWishList": isInWishList,
    "ColorId": colorId,
    "IsMoreThanThreeColors": isMoreThanThreeColors,
    "ColorsList": colorsList,
  };
}

