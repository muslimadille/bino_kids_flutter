// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  final int status;
  final String message;
  final List<BannerDataModel> data;

  BannerModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    status: json["status"],
    message: json["message"],
    data: List<BannerDataModel>.from(json["Data"].map((x) => BannerDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class BannerDataModel {
  final int id;
  final String imageName;
  final String? firstPage;
  final dynamic secondPage;
  final bool isShowingInArabic;
  final String isShowingInArabicName;
  final bool isShowingInEnglish;
  final String isShowingInEnglishName;
  final bool isCurrent;
  final String isCurrentName;
  final String imagePath;
  final int orintedTypeId;
  final String orintedTypeName;
  final int? modelId;
  final String modelName;
  final int? modelTypeId;
  final String modelTypeName;
  final String firstPageName;

  BannerDataModel({
    required this.id,
    required this.imageName,
    required this.firstPage,
    required this.secondPage,
    required this.isShowingInArabic,
    required this.isShowingInArabicName,
    required this.isShowingInEnglish,
    required this.isShowingInEnglishName,
    required this.isCurrent,
    required this.isCurrentName,
    required this.imagePath,
    required this.orintedTypeId,
    required this.orintedTypeName,
    required this.modelId,
    required this.modelName,
    required this.modelTypeId,
    required this.modelTypeName,
    required this.firstPageName,
  });

  factory BannerDataModel.fromJson(Map<String, dynamic> json) => BannerDataModel(
    id: json["ID"],
    imageName: json["ImageName"],
    firstPage: json["FirstPage"],
    secondPage: json["SecondPage"],
    isShowingInArabic: json["IsShowingInArabic"],
    isShowingInArabicName: json["IsShowingInArabicName"],
    isShowingInEnglish: json["IsShowingInEnglish"],
    isShowingInEnglishName: json["IsShowingInEnglishName"],
    isCurrent: json["IsCurrent"],
    isCurrentName: json["IsCurrentName"],
    imagePath: json["imagePath"],
    orintedTypeId: json["OrintedTypeId"],
    orintedTypeName: json["OrintedTypeName"],
    modelId: json["ModelId"],
    modelName: json["ModelName"],
    modelTypeId: json["ModelTypeId"],
    modelTypeName: json["ModelTypeName"],
    firstPageName: json["FirstPageName"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "ImageName": imageName,
    "FirstPage": firstPage,
    "SecondPage": secondPage,
    "IsShowingInArabic": isShowingInArabic,
    "IsShowingInArabicName": isShowingInArabicName,
    "IsShowingInEnglish": isShowingInEnglish,
    "IsShowingInEnglishName": isShowingInEnglishName,
    "IsCurrent": isCurrent,
    "IsCurrentName": isCurrentName,
    "imagePath": imagePath,
    "OrintedTypeId": orintedTypeId,
    "OrintedTypeName": orintedTypeName,
    "ModelId": modelId,
    "ModelName": modelName,
    "ModelTypeId": modelTypeId,
    "ModelTypeName": modelTypeName,
    "FirstPageName": firstPageName,
  };
}
