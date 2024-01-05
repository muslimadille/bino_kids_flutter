

import 'dart:convert';

SubCategoriesModel subCategoriesModelFromJson(String str) => SubCategoriesModel.fromJson(json.decode(str));

String subCategoriesModelToJson(SubCategoriesModel data) => json.encode(data.toJson());

class SubCategoriesModel {
  final int status;
  final String message;
  final List<SubCategoryDataModel> data;

  SubCategoriesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) => SubCategoriesModel(
    status: json["status"]??-1,
    message: json["message"]??"",
    data: List<SubCategoryDataModel>.from((json["Data"]??[]).map((x) => SubCategoryDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SubCategoryDataModel {
  final int id;
  final String arName;
  final String enName;
  final int idPrevious;
  final bool isEdited;
  final String name;
  final int horizontalRowNumber;
  final int verticalRowNumber;
  final bool isDynamic;
  final String? image;
  final List<ImageNameList> imageNameList;

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
  });

  factory SubCategoryDataModel.fromJson(Map<String, dynamic> json) => SubCategoryDataModel(
    id: json["ID"]??-1,
    arName: json["ArName"]??'',
    enName: json["EnName"]??'',
    idPrevious: json["IDPrevious"]??-1,
    isEdited: json["IsEdited"]??false,
    name: json["Name"]??'',
    horizontalRowNumber: json["HorizontalRowNumber"]??-1,
    verticalRowNumber: json["VerticalRowNumber"]??-1,
    isDynamic: json["IsDynamic"]??false,
    imageNameList: List<ImageNameList>.from((json["ImageNameList"]??[]).map((x) => ImageNameList.fromJson(x))),
    image: json["image"],
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

class ImageNameList {
  final int id;
  final int modelId;
  final int modelTypeId;
  final int arrangeNumber;
  final String modelName;
  final String modelTypeName;
  final String imageName;
  final int arrange;
  final String imagePath;
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
    id: json["ID"]??-1,
    modelId: json["ModelId"]??-1,
    modelTypeId: json["ModelTypeId"]??-1,
    arrangeNumber: json["ArrangeNumber"]??-1,
    modelName: json["ModelName"]??'',
    modelTypeName: json["ModelTypeName"]??'',
    imageName: json["ImageName"]??'',
    arrange: json["Arrange"]??-1,
    imagePath: json["ImagePath"]??'',
    isActive: json["IsActive"]??false,
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
