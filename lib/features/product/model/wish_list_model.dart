
import 'dart:convert';
import 'package:bino_kids/features/product/model/model_details_model.dart';

WishlisModel wishlisModelFromJson(String str) => WishlisModel.fromJson(json.decode(str));

String wishlisModelToJson(WishlisModel data) => json.encode(data.toJson());

class WishlisModel {
  final int status;
  final dynamic message;
  final bool isAdded;
  final bool isEdited;
  final List<ModelList> modelList;

  WishlisModel({
    required this.status,
    required this.message,
    required this.isAdded,
    required this.isEdited,
    required this.modelList,
  });

  factory WishlisModel.fromJson(Map<String, dynamic> json) => WishlisModel(
    status: json["status"],
    message: json["message"],
    isAdded: json["isAdded"],
    isEdited: json["isEdited"],
    modelList: List<ModelList>.from(json["modelList"].map((x) => ModelList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "isAdded": isAdded,
    "isEdited": isEdited,
    "modelList": List<dynamic>.from(modelList.map((x) => x.toJson())),
  };
}


