

import 'dart:convert';

import 'package:hive/hive.dart';



part 'sub_categories_model.g.dart'; // Generated file
SubCategoriesModel subCategoriesModelFromJson(String str) => SubCategoriesModel.fromJson(json.decode(str));

String subCategoriesModelToJson(SubCategoriesModel data) => json.encode(data.toJson());

@HiveType(typeId: 6) // HiveType annotation for Hive
class SubCategoriesModel {
  @HiveField(0) // HiveField annotation for Hive
  final int status;

  @HiveField(1) // HiveField annotation for Hive
  final String message;

  @HiveField(2) // HiveField annotation for Hive
  final List<SubCategoryDataModel> data;

  SubCategoriesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) => SubCategoriesModel(
    status: json["status"] ?? -1,
    message: json["message"] ?? "",
    data: List<SubCategoryDataModel>.from((json["Data"] ?? []).map((x) => SubCategoryDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
@HiveType(typeId: 7) // HiveType annotation for Hive
class SubCategoryDataModel {
  @HiveField(0) // HiveField annotation for Hive
  final int id;

  @HiveField(1) // HiveField annotation for Hive
  final String arName;

  @HiveField(2) // HiveField annotation for Hive
  final String enName;

  @HiveField(3) // HiveField annotation for Hive
  final int idPrevious;

  @HiveField(4) // HiveField annotation for Hive
  final bool isEdited;

  @HiveField(5) // HiveField annotation for Hive
  final String name;

  @HiveField(6) // HiveField annotation for Hive
  final int horizontalRowNumber;

  @HiveField(7) // HiveField annotation for Hive
  final int verticalRowNumber;

  @HiveField(8) // HiveField annotation for Hive
  final bool isDynamic;

  @HiveField(9) // HiveField annotation for Hive
  final String? image;

  @HiveField(10) // HiveField annotation for Hive
  final List<ImageNameList> imageNameList;

  @HiveField(11) // HiveField annotation for Hive

  final int modelGenderId;

  SubCategoryDataModel({
    required this.id,
    required this.arName,
    required this.enName,
    required this.idPrevious,
    required this.isEdited,
    required this.name,
    required this.horizontalRowNumber,
    required this.verticalRowNumber,
    required this.isDynamic,
    required this.image,
    required this.imageNameList,
    required this.modelGenderId
  });

  factory SubCategoryDataModel.fromJson(Map<String, dynamic> json) => SubCategoryDataModel(
    id: json["ID"] ?? -1,
    arName: json["ArName"] ?? '',
    enName: json["EnName"] ?? '',
    idPrevious: json["IDPrevious"] ?? -1,
    isEdited: json["IsEdited"] ?? false,
    name: json["Name"] ?? '',
    horizontalRowNumber: json["HorizontalRowNumber"] ?? -1,
    verticalRowNumber: json["VerticalRowNumber"] ?? -1,
    isDynamic: json["IsDynamic"] ?? false,
    imageNameList: List<ImageNameList>.from((json["ImageNameList"] ?? []).map((x) => ImageNameList.fromJson(x))),
    image: json["image"],
      modelGenderId:json["ModelGenderId"]??-1
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "ArName": arName,
    "EnName": enName,
    "IDPrevious": idPrevious,
    "IsEdited": isEdited,
    "Name": name,
    "HorizontalRowNumber": horizontalRowNumber,
    "VerticalRowNumber": verticalRowNumber,
    "IsDynamic": isDynamic,
    "ImageNameList": List<dynamic>.from(imageNameList.map((x) => x.toJson())),
  };
}

@HiveType(typeId: 8) // HiveType annotation for Hive
class ImageNameList {
  @HiveField(0) // HiveField annotation for Hive
  final int id;

  @HiveField(1) // HiveField annotation for Hive
  final int modelId;

  @HiveField(2) // HiveField annotation for Hive
  final int modelTypeId;

  @HiveField(3) // HiveField annotation for Hive
  final int arrangeNumber;

  @HiveField(4) // HiveField annotation for Hive
  final String modelName;

  @HiveField(5) // HiveField annotation for Hive
  final String modelTypeName;

  @HiveField(6) // HiveField annotation for Hive
  final String imageName;

  @HiveField(7) // HiveField annotation for Hive
  final int arrange;

  @HiveField(8) // HiveField annotation for Hive
  final String imagePath;

  @HiveField(9) // HiveField annotation for Hive
  final bool isActive;

  ImageNameList({
    required this.id,
    required this.modelId,
    required this.modelTypeId,
    required this.arrangeNumber,
    required this.modelName,
    required this.modelTypeName,
    required this.imageName,
    required this.arrange,
    required this.imagePath,
    required this.isActive,
  });

  factory ImageNameList.fromJson(Map<String, dynamic> json) => ImageNameList(
    id: json["ID"] ?? -1,
    modelId: json["ModelId"] ?? -1,
    modelTypeId: json["ModelTypeId"] ?? -1,
    arrangeNumber: json["ArrangeNumber"] ?? -1,
    modelName: json["ModelName"] ?? '',
    modelTypeName: json["ModelTypeName"] ?? '',
    imageName: json["ImageName"] ?? '',
    arrange: json["Arrange"] ?? -1,
    imagePath: json["ImagePath"] ?? '',
    isActive: json["IsActive"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "ModelId": modelId,
    "ModelTypeId": modelTypeId,
    "ArrangeNumber": arrangeNumber,
    "ModelName": modelName,
    "ModelTypeName": modelTypeName,
    "ImageName": imageName,
    "Arrange": arrange,
    "ImagePath": imagePath,
    "IsActive": isActive,
  };
}
