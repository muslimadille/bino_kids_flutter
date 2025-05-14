

import 'dart:convert';

import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:hive/hive.dart';
part 'model_types_model.g.dart';
ModelTypesModel modelTypesModelFromJson(String str) => ModelTypesModel.fromJson(json.decode(str));

String modelTypesModelToJson(ModelTypesModel data) => json.encode(data.toJson());


@HiveType(typeId: 5) // HiveType annotation for Hive
class ModelTypesModel {
  @HiveField(0) // HiveField annotation for Hive
  final int? status;

  @HiveField(1) // HiveField annotation for Hive
  final dynamic? message;

  @HiveField(2) // HiveField annotation for Hive
  final List<SubCategoryDataModel>? modelTypes;

  ModelTypesModel({
    required this.status,
    required this.message,
    required this.modelTypes,
  });

  factory ModelTypesModel.fromJson(Map<String, dynamic> json) => ModelTypesModel(
    status: json["status"],
    message: json["message"],
    modelTypes: json["modelTypes"] == null
        ? []
        : List<SubCategoryDataModel>.from(
        json["modelTypes"].map((x) => SubCategoryDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "modelTypes": List<dynamic>.from(modelTypes!.map((x) => x.toJson())),
  };
}
