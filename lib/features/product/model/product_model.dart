
import 'dart:convert';
import 'package:bino_kids/features/product/model/model_details_model.dart';
import 'package:hive/hive.dart';
part 'product_model.g.dart';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());



@HiveType(typeId: 15)
class ProductModel extends HiveObject {
  @HiveField(0)
  final num? id;
  @HiveField(1)
  final num? modelListId;
  @HiveField(2)
  final String? modelType;
  @HiveField(3)
  final String? guId;
  @HiveField(4)
  final String? productData;
  @HiveField(5)
  final String? material;
  @HiveField(6)
  final String? description;
  @HiveField(7)
  final num? priceAfter;
  @HiveField(8)
  final num? priceBefore;
  @HiveField(9)
  final String? imageUrl;
  @HiveField(10)
  final String? originalImageUrl;
  @HiveField(11)
  final String? modelCode;
  @HiveField(12)
  final String? modelTradeMarkName;
  @HiveField(13)
  final String? modelAgeName;
  @HiveField(14)
  final bool? isInWishList;
  @HiveField(15)
  final num? colorId;
  @HiveField(16)
  final bool? isMoreThanThreeColors;
  @HiveField(17)
  final dynamic? colorsList;
  @HiveField(18)
  final List<Color>? colors;
  @HiveField(19)
  final bool? isInNewArrival;
  @HiveField(20)
  final bool? isInTodaysDeal;
  @HiveField(21)
  final int? colorsCount;

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
    required this.colors,
    required this.isInNewArrival,
    required this.isInTodaysDeal,
    required this.colorsCount
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["ID"] ?? -1,
    modelListId: json["Id"] ?? -1,
    modelType: json["ModelType"] ?? '',
    guId: json["GuID"] ?? '',
    productData: json["ProductData"],
    material: json["Material"] ?? '',
    description: json["Description"],
    priceAfter: json["PriceAfter"],
    priceBefore: json["PriceBefore"],
    imageUrl: json["ImageUrl"] ?? "",
    originalImageUrl: json["OriginalImageUrl"] ?? '',
    modelCode: json["ModelCode"] ?? '',
    modelTradeMarkName: json["ModelTradeMarkName"] ?? "",
    modelAgeName: json["ModelAgeName"] ?? "",
    isInWishList: json["isInWishList"] ?? false,
    colorId: json["ColorId"] ?? -1,
    isMoreThanThreeColors: json["IsMoreThanThreeColors"] ?? false,
    colorsList: json["ColorsList"] ?? [],
    colors: json["AllColor"] == null
        ? []
        : List<Color>.from(json["AllColor"].map((x) => Color.fromJson(x))),
    isInNewArrival: json["IsInNewArrival"] ?? false,
    isInTodaysDeal: json["IsInTodaysDeal"] ?? false,
      colorsCount:json["ColorsCount"] ?? 0
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
    "AllColor": List<dynamic>.from(colors!.map((x) => x.toJson())),
  };
}
