// To parse this JSON data, do
//
//     final modelDetailsModel = modelDetailsModelFromJson(jsonString);

import 'dart:convert';

ModelDetailsModel modelDetailsModelFromJson(String str) => ModelDetailsModel.fromJson(json.decode(str));

String modelDetailsModelToJson(ModelDetailsModel data) => json.encode(data.toJson());

class ModelDetailsModel {
  final int? status;
  final dynamic? message;
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

class ModelList {
  final num? id;
  final dynamic? modelType;
  final String? modelTypeName;
  final String? guId;
  final String? productData;
  final num? priceAfterDiscount;
  final num? priceBeforeDiscount;
  final num? minimumOrderLimitWholeSale;
  final String? imageUrl;
  final String? modelCode;
  final String? modelAgeName;
  final String? modelTradeMarkName;
  final String? modelDiscriptionName;
  final String? modelMaterialName;
  final num? colorId;
  final num? modelYear;
  final dynamic? colorsList;
  final List<AllSize>? size;
  final List<AllSize>? allSize;
  final List<Color>? colors;
  final List<dynamic>? wearWith;
  final List<Similar>? similar;
  final List<ImageList>? imageList;
  final int wishListId;
  final bool isFavorite;



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
    required this.wishListId
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
    imageUrl: json["ImageUrl"],
    modelCode: json["ModelCode"],
    modelAgeName: json["ModelAgeName"],
    modelTradeMarkName: json["ModelTradeMarkName"],
    modelDiscriptionName:json["ModelDiscriptionName"],
    modelMaterialName: json["ModelMaterialName"],
    colorId: json["ColorId"],
    modelYear: json["ModelYear"],
    colorsList: json["ColorsList"],
    size: List<AllSize>.from(json["Size"].map((x) => AllSize.fromJson(x))),
    allSize: List<AllSize>.from(json["AllSize"].map((x) => AllSize.fromJson(x))),
    colors: List<Color>.from(json["Colors"].map((x) => Color.fromJson(x))),
    wearWith:json["WearWith"]==null?[]: List<dynamic>.from(json["WearWith"].map((x) => x)),
    similar: json["Similar"]==null?[]:List<Similar>.from(json["Similar"].map((x) => Similar.fromJson(x))),
    imageList: json["ImageList"]==null?[]:List<ImageList>.from(json["ImageList"].map((x) => ImageList.fromJson(x))),
    isFavorite: json["IsFavorite"]??false,
    wishListId: json["WishListID"]??-1,
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

class AllSize {
  final num? id;
  final String? arName;
  final String? enName;
  final num? idPrevious;
  final bool? isEdited;
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

class Color {
  final num? id;
  final String? arName;
  final String? enName;
  final dynamic? colorDegree;
  final num? idPervious;
  final bool? isEdited;
  final num? modelId;
  final num? colorId;
  final String? imageName;
  final String? colorName;
  final num? arrange;
  final bool? isHidden;
   bool? isInWishList;
  final List<AllSize>? sizesOfThisColorList;
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
    sizesOfThisColorList: json["SizesOfThisColorList"]==null?[]:List<AllSize>.from(json["SizesOfThisColorList"].map((x) => AllSize.fromJson(x))),
    imageURL: json["ImageURL"]??''
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
    "ImageURL":imageURL
  };
}

class ImageList {
  final String? imageName;
  final bool? mainImage;
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







class Similar {
  final num? id;
  final num? similarId;
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
   bool? isInWishList;
  final num? colorId;
  final bool? isMoreThanThreeColors;
  final dynamic? colorsList;
  final String modelType;

  Similar({
    required this.id,
    required this.similarId,
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

  factory Similar.fromJson(Map<String, dynamic> json) => Similar(
    id: json["ID"],
    similarId: json["Id"],
    modelType: json["ModelType"],
    guId: json["GuID"],
    productData: json["ProductData"],
    material: json["Material"],
    description: json["Description"],
    priceAfter: json["PriceAfter"],
    priceBefore: json["PriceBefore"],
    imageUrl: json["ImageUrl"],
    originalImageUrl: json["OriginalImageUrl"],
    modelCode: json["ModelCode"],
    modelTradeMarkName: json["ModelTradeMarkName"],
    modelAgeName: json["ModelAgeName"],
    isInWishList: json["isInWishList"],
    colorId: json["ColorId"],
    isMoreThanThreeColors: json["IsMoreThanThreeColors"],
    colorsList: json["ColorsList"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Id": similarId,
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


