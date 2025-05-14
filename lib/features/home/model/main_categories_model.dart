import 'package:hive/hive.dart';
import 'dart:convert';

part 'main_categories_model.g.dart';

MainCategoriesModel mainCategoriesModelFromJson(String str) =>
    MainCategoriesModel.fromJson(json.decode(str));

String mainCategoriesModelToJson(MainCategoriesModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 0)
class MainCategoriesModel extends HiveObject {
  @HiveField(0)
  int status;

  @HiveField(1)
  String message;

  @HiveField(2)
  List<MainCategoriesDataModel> data;

  MainCategoriesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MainCategoriesModel.fromJson(Map<String, dynamic> json) =>
      MainCategoriesModel(
        status: json["status"] ?? -1,
        message: json["message"] ?? '',
        data: List<MainCategoriesDataModel>.from((json["Data"] ?? [])
            .map((x) => MainCategoriesDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

@HiveType(typeId: 1)
class MainCategoriesDataModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  List<ModelAgeForMainPage>? modelAgeForMainPage;

  MainCategoriesDataModel({
    required this.id,
    required this.name,
    required this.modelAgeForMainPage,
  });

  factory MainCategoriesDataModel.fromJson(Map<String, dynamic> json) =>
      MainCategoriesDataModel(
        id: json["ID"] ?? -1,
        name: json["Name"] ?? "",
        modelAgeForMainPage: json["modelAgeForMainPage"] == null
            ? []
            : List<ModelAgeForMainPage>.from(json["modelAgeForMainPage"]
            .map((x) => ModelAgeForMainPage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Name": name,
    "modelAgeForMainPage": modelAgeForMainPage == null
        ? []
        : List<dynamic>.from(modelAgeForMainPage!.map((x) => x.toJson())),
  };
}

@HiveType(typeId: 2)
class ModelAgeForMainPage extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String arName;

  @HiveField(2)
  String enName;

  @HiveField(3)
  String text;

  @HiveField(4)
  int moduleId;

  @HiveField(5)
  int arrangement;

  @HiveField(6)
  String guidId;

  ModelAgeForMainPage({
    required this.id,
    required this.arName,
    required this.enName,
    required this.text,
    required this.moduleId,
    required this.arrangement,
    required this.guidId,
  });

  factory ModelAgeForMainPage.fromJson(Map<String, dynamic> json) =>
      ModelAgeForMainPage(
        id: json["ID"] ?? -1,
        arName: json["ArName"] ?? '',
        enName: json["EnName"] ?? '',
        text: json["text"] ?? '',
        moduleId: json["ModuleID"] ?? -1,
        arrangement: json["Arrangement"] ?? -1,
        guidId: json["guidId"] ?? -1,
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
