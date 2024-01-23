// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  final int status;
  final String message;
  final List<SearchDataModel> data;

  SearchModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    status: json["status"],
    message: json["message"],
    data: json["Data"]==null?[]:List<SearchDataModel>.from(json["Data"].map((x) => SearchDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SearchDataModel {
  final int moduleId;
  final String moduleName;
  final int sectionId;
  final String sectionName;
  final int nodeId;
  final String nodeName;
  final int modelId;
  final String modelGuid;
  final dynamic modelCode;
  final dynamic url;
  final String searchName;
  final int toPage;

  SearchDataModel({
    required this.moduleId,
    required this.moduleName,
    required this.sectionId,
    required this.sectionName,
    required this.nodeId,
    required this.nodeName,
    required this.modelId,
    required this.modelGuid,
    required this.modelCode,
    required this.url,
    required this.searchName,
    required this.toPage,
  });

  factory SearchDataModel.fromJson(Map<String, dynamic> json) => SearchDataModel(
    moduleId: json["moduleId"]??-1,
    moduleName: json["moduleName"]??"",
    sectionId: json["sectionId"]??-1,
    sectionName: json["sectionName"]??"",
    nodeId: json["nodeId"]??-1,
    nodeName: json["nodeName"]??"",
    modelId: json["modelId"]??"",
    modelGuid: json["modelGuid"]??"",
    modelCode: json["modelCode"]??"",
    url: json["url"]??"",
    searchName: json["searchName"]??"",
    toPage: json["toPage"]??-1,
  );

  Map<String, dynamic> toJson() => {
    "moduleId": moduleId,
    "moduleName": moduleName,
    "sectionId": sectionId,
    "sectionName": sectionName,
    "nodeId": nodeId,
    "nodeName": nodeName,
    "modelId": modelId,
    "modelGuid": modelGuid,
    "modelCode": modelCode,
    "url": url,
    "searchName": searchName,
    "toPage": toPage,
  };
}
