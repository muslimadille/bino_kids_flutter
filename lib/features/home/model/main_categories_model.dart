
import 'dart:convert';

MainCategoriesModel mainCategoriesModelFromJson(String str) => MainCategoriesModel.fromJson(json.decode(str));

String mainCategoriesModelToJson(MainCategoriesModel data) => json.encode(data.toJson());

class MainCategoriesModel {
  final int status;
  final String message;
  final List<MainCategoriesDataModel> data;

  MainCategoriesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MainCategoriesModel.fromJson(Map<String, dynamic> json) => MainCategoriesModel(
    status: json["status"]??-1,
    message: json["message"]??'',
    data: List<MainCategoriesDataModel>.from((json["Data"]??[]).map((x) => MainCategoriesDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MainCategoriesDataModel {
  final int id;
  final String name;
  final List<ModelAgeForMainPage>? modelAgeForMainPage;

  MainCategoriesDataModel({
    required this.id,
    required this.name,
    required this.modelAgeForMainPage,
  });

  factory MainCategoriesDataModel.fromJson(Map<String, dynamic> json) => MainCategoriesDataModel(
    id: json["ID"]??-1,
    name: json["Name"]??"",
    modelAgeForMainPage: json["modelAgeForMainPage"] == null ? [] : List<ModelAgeForMainPage>.from(json["modelAgeForMainPage"]!.map((x) => ModelAgeForMainPage.fromJson(x))).reversed.toList(),
  );
  Map<String, dynamic> toJson() => {
    "ID": id,
    "Name": name,
    "modelAgeForMainPage": modelAgeForMainPage == null ? [] : List<dynamic>.from(modelAgeForMainPage!.map((x) => x.toJson())),
  };
}

class ModelAgeForMainPage {
  final int id;
  final String arName;
  final String enName;
  final String text;
  final int moduleId;
  final int arrangement;
  final String guidId;

  ModelAgeForMainPage({
    required this.id,
    required this.arName,
    required this.enName,
    required this.text,
    required this.moduleId,
    required this.arrangement,
    required this.guidId,
  });

  factory ModelAgeForMainPage.fromJson(Map<String, dynamic> json) => ModelAgeForMainPage(
    id: json["ID"]??-1,
    arName: json["ArName"]??'',
    enName: json["EnName"]??'',
    text: json["text"]??'',
    moduleId: json["ModuleID"]??-1,
    arrangement: json["Arrangement"]??-1,
    guidId: json["guidId"]??-1,
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "ArName": arName,
    "EnName": enName,
    "text": text,
    "ModuleID": moduleId,
    "Arrangement": arrangement,
    "guidId": guidId,
  };
}
