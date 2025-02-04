// To parse this JSON data, do
//
//     final modelDetailsModel = modelDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:bino_kids/features/product/model/product_model.dart';
import 'package:hive/hive.dart';
part 'model_details_model.g.dart';

ModelDetailsModel modelDetailsModelFromJson(String str) => ModelDetailsModel.fromJson(json.decode(str));

String modelDetailsModelToJson(ModelDetailsModel data) => json.encode(data.toJson());

@HiveType(typeId: 10)
class ModelDetailsModel extends HiveObject {
  @HiveField(0)
  final int? status;
  @HiveField(1)
  final dynamic? message;
  @HiveField(2)
  final ModelList? modelList;

  ModelDetailsModel({
    required this.status,
    required this.message,
    required this.modelList,
  });

  factory ModelDetailsModel.fromJson(Map<String, dynamic> json) => ModelDetailsModel(
    status: json["status"],
    message: json["message"],
    modelList: ModelList.fromJson(json["modelList"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "modelList": modelList!.toJson(),
  };
}

@HiveType(typeId: 11)
class ModelList extends HiveObject {
  @HiveField(0)
  final num? id;
  @HiveField(1)
  final dynamic? modelType;
  @HiveField(2)
  final String? modelTypeName;
  @HiveField(3)
  final String? guId;
  @HiveField(4)
  final String? productData;
  @HiveField(5)
  final num? priceAfterDiscount;
  @HiveField(6)
  final num? priceBeforeDiscount;
  @HiveField(7)
  final num? minimumOrderLimitWholeSale;
  @HiveField(8)
  final String? imageUrl;
  @HiveField(9)
  final String? modelCode;
  @HiveField(10)
  final String? modelAgeName;
  @HiveField(11)
  final String? modelTradeMarkName;
  @HiveField(12)
  final String? modelDiscriptionName;
  @HiveField(13)
  final String? modelMaterialName;
  @HiveField(14)
  num? colorId;
  @HiveField(15)
  final num? modelYear;
  @HiveField(16)
  final dynamic? colorsList;
  @HiveField(17)
  final List<AllSize>? size;
  @HiveField(18)
  final List<AllSize>? allSize;
  @HiveField(19)
  final List<Color>? colors;
  @HiveField(20)
  final List<dynamic>? wearWith;
  @HiveField(21)
  final List<ProductModel>? similar;
  @HiveField(22)
  final List<ImageList>? imageList;
  @HiveField(23)
  final int wishListId;
  @HiveField(24)
  final bool isFavorite;
  @HiveField(25)
  final int modelId;
  @HiveField(26)
  num sizeId;
  @HiveField(27)
  num modelColorId;
  @HiveField(28)
  bool isDeletedOrHidden;
  @HiveField(29)
  bool isHasBalance;

  ModelList({
    required this.id,
    required this.modelType,
    required this.modelTypeName,
    required this.guId,
    required this.productData,
    required this.priceAfterDiscount,
    required this.priceBeforeDiscount,
    required this.minimumOrderLimitWholeSale,
    required this.imageUrl,
    required this.modelCode,
    required this.modelAgeName,
    required this.modelTradeMarkName,
    required this.modelDiscriptionName,
    required this.modelMaterialName,
    required this.colorId,
    required this.modelYear,
    required this.colorsList,
    required this.size,
    required this.allSize,
    required this.colors,
    required this.wearWith,
    required this.similar,
    required this.imageList,
    required this.isFavorite,
    required this.wishListId,
    required this.modelId,
    required this.sizeId,
    required this.modelColorId,
    required this.isDeletedOrHidden,
    required this.isHasBalance,
  });

  factory ModelList.fromJson(Map<String, dynamic> json) => ModelList(
    id: json["ID"],
    modelType: json["ModelType"],
    modelTypeName: json["ModelTypeName"],
    guId: json["GuID"],
    productData: json["ProductData"],
    priceAfterDiscount: json["PriceAfterDiscount"],
    priceBeforeDiscount: json["PriceBeforeDiscount"],
    minimumOrderLimitWholeSale: json["MinimumOrderLimitWholeSale"],
    imageUrl: json["imagePath"],
    modelCode: json["ModelCode"],
    modelAgeName: json["ModelAgeName"],
    modelTradeMarkName: json["ModelTradeMarkName"],
    modelDiscriptionName: json["ModelDiscriptionName"],
    modelMaterialName: json["ModelMaterialName"],
    colorId: json["ColorId"],
    modelYear: json["ModelYear"],
    colorsList: json["ColorsList"],
    size: List<AllSize>.from(json["Size"].map((x) => AllSize.fromJson(x))),
    allSize: List<AllSize>.from(json["AllSize"].map((x) => AllSize.fromJson(x))),
    colors: List<Color>.from(json["Colors"].map((x) => Color.fromJson(x))),
    wearWith: json["WearWith"] == null ? [] : List<dynamic>.from(json["WearWith"].map((x) => x)),
    similar: json["Similar"] == null ? [] : List<ProductModel>.from(json["Similar"].map((x) => ProductModel.fromJson(x))),
    imageList: json["ImageList"] == null ? [] : List<ImageList>.from(json["ImageList"].map((x) => ImageList.fromJson(x))),
    isFavorite: json["IsFavorite"] ?? false,
    wishListId: json["WishListID"] ?? -1,
    modelId: json["ModelId"] ?? json["ID"],
    sizeId: json["SizeId"] ?? 0,
    modelColorId: json["modelColorId"] ?? 0,
      isDeletedOrHidden:json["IsDeletedOrHidden"]??false,
      isHasBalance:json["IsHasBalance"]??false
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "ModelType": modelType,
    "ModelTypeName": modelTypeName,
    "GuID": guId,
    "ProductData": productData,
    "PriceAfterDiscount": priceAfterDiscount,
    "PriceBeforeDiscount": priceBeforeDiscount,
    "MinimumOrderLimitWholeSale": minimumOrderLimitWholeSale,
    "ImageUrl": imageUrl,
    "ModelCode": modelCode,
    "ModelAgeName": modelAgeName,
    "ModelTradeMarkName": modelTradeMarkName,
    "ModelDiscriptionName": modelDiscriptionName,
    "ModelMaterialName": modelMaterialName,
    "ColorId": colorId,
    "ModelYear": modelYear,
    "ColorsList": colorsList,
    "Size": List<dynamic>.from(size!.map((x) => x.toJson())),
    "AllSize": List<dynamic>.from(allSize!.map((x) => x.toJson())),
    "Colors": List<dynamic>.from(colors!.map((x) => x.toJson())),
    "WearWith": List<dynamic>.from(wearWith!.map((x) => x)),
    "Similar": List<dynamic>.from(similar!.map((x) => x.toJson())),
    "ImageList": List<dynamic>.from(imageList!.map((x) => x.toJson())),
    "IsFavorite": isFavorite,
    "WishListID": wishListId,
  };
}

@HiveType(typeId: 12)
class AllSize extends HiveObject {
  @HiveField(0)
  final num? id;
  @HiveField(1)
  final String? arName;
  @HiveField(2)
  final String? enName;
  @HiveField(3)
  final num? idPrevious;
  @HiveField(4)
  final bool? isEdited;
  @HiveField(5)
  final String? name;

  AllSize({
    required this.id,
    required this.arName,
    required this.enName,
    required this.idPrevious,
    required this.isEdited,
    required this.name,
  });

  factory AllSize.fromJson(Map<String, dynamic> json) => AllSize(
    id: json["ID"],
    arName: json["ArName"],
    enName: json["EnName"],
    idPrevious: json["IDPrevious"],
    isEdited: json["IsEdited"],
    name: json["Name"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "ArName": arName,
    "EnName": enName,
    "IDPrevious": idPrevious,
    "IsEdited": isEdited,
    "Name": name,
  };
}

@HiveType(typeId: 13)
class Color extends HiveObject {
  @HiveField(0)
  final num? id;
  @HiveField(1)
  final String? arName;
  @HiveField(2)
  final String? enName;
  @HiveField(3)
  final dynamic? colorDegree;
  @HiveField(4)
  final num? idPervious;
  @HiveField(5)
  final bool? isEdited;
  @HiveField(6)
  final num? modelId;
  @HiveField(7)
  final num? colorId;
  @HiveField(8)
  final String? imageName;
  @HiveField(9)
  final String? colorName;
  @HiveField(10)
  final num? arrange;
  @HiveField(11)
  final bool? isHidden;
  @HiveField(12)
  bool? isInWishList;
  @HiveField(13)
  final List<AllSize>? sizesOfThisColorList;
  @HiveField(14)
  final String imageURL;

  Color({
    required this.id,
    required this.arName,
    required this.enName,
    required this.colorDegree,
    required this.idPervious,
    required this.isEdited,
    required this.modelId,
    required this.colorId,
    required this.imageName,
    required this.colorName,
    required this.arrange,
    required this.isHidden,
    required this.isInWishList,
    required this.sizesOfThisColorList,
    required this.imageURL,
  });

  factory Color.fromJson(Map<String, dynamic> json) => Color(
    id: json["ID"],
    arName: json["ArName"],
    enName: json["EnName"],
    colorDegree: json["ColorDegree"],
    idPervious: json["IDPervious"],
    isEdited: json["IsEdited"],
    modelId: json["ModelId"],
    colorId: json["ColorId"],
    imageName: json["ImageName"],
    colorName: json["ColorName"],
    arrange: json["Arrange"],
    isHidden: json["IsHidden"],
    isInWishList: json["IsInWishList"],
    sizesOfThisColorList: json["SizesOfThisColorList"] == null
        ? []
        : List<AllSize>.from(json["SizesOfThisColorList"].map((x) => AllSize.fromJson(x))),
    imageURL: json["ImageURL"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "ArName": arName,
    "EnName": enName,
    "ColorDegree": colorDegree,
    "IDPervious": idPervious,
    "IsEdited": isEdited,
    "ModelId": modelId,
    "ColorId": colorId,
    "ImageName": imageName,
    "ColorName": colorName,
    "Arrange": arrange,
    "IsHidden": isHidden,
    "IsInWishList": isInWishList,
    "SizesOfThisColorList": List<dynamic>.from(sizesOfThisColorList!.map((x) => x.toJson())),
    "ImageURL": imageURL
  };
}

@HiveType(typeId: 14)
class ImageList extends HiveObject {
  @HiveField(0)
  final String? imageName;
  @HiveField(1)
  final bool? mainImage;
  @HiveField(2)
  final num? colorId;

  ImageList({
    required this.imageName,
    required this.mainImage,
    required this.colorId,
  });

  factory ImageList.fromJson(Map<String, dynamic> json) => ImageList(
    imageName: json["ImageName"],
    mainImage: json["MainImage"],
    colorId: json["ColorId"],
  );

  Map<String, dynamic> toJson() => {
    "ImageName": imageName,
    "MainImage": mainImage,
    "ColorId": colorId,
  };
}