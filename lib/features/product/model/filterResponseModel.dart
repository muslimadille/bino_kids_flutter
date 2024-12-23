
// To parse this JSON data, do
//
//     final filterResposeModel = filterResposeModelFromJson(jsonString);

import 'dart:convert';

FilterResposeModel filterResposeModelFromJson(String str) => FilterResposeModel.fromJson(json.decode(str));

String filterResposeModelToJson(FilterResposeModel data) => json.encode(data.toJson());

class FilterResposeModel {
  final int status;
  final dynamic message;
  final Data data;

  FilterResposeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FilterResposeModel.fromJson(Map<String, dynamic> json) => FilterResposeModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  final bool next;
  final Filters filters;
  final dynamic modelTypes;
  final Price price;
  final dynamic modelList;
  final dynamic imageList;

  Data({
    required this.next,
    required this.filters,
    required this.modelTypes,
    required this.price,
    required this.modelList,
    required this.imageList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    next: json["next"],
    filters: Filters.fromJson(json["filters"]),
    modelTypes: json["modelTypes"],
    price: Price.fromJson(json["price"]),
    modelList: json["modelList"],
    imageList: json["ImageList"],
  );

  Map<String, dynamic> toJson() => {
    "next": next,
    "filters": filters.toJson(),
    "modelTypes": modelTypes,
    "price": price.toJson(),
    "modelList": modelList,
    "ImageList": imageList,
  };
}

class Filters {
  final Description gender;
  final Description season;
  final Description modelAge;
  final Description material;
  final Description description;

  Filters({
    required this.gender,
    required this.season,
    required this.modelAge,
    required this.material,
    required this.description,
  });

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
    gender: Description.fromJson(json["gender"]),
    season: Description.fromJson(json["season"]),
    modelAge: Description.fromJson(json["modelAge"]),
    material: Description.fromJson(json["material"]),
    description: Description.fromJson(json["description"]),
  );

  Map<String, dynamic> toJson() => {
    "gender": gender.toJson(),
    "season": season.toJson(),
    "modelAge": modelAge.toJson(),
    "material": material.toJson(),
    "description": description.toJson(),
  };
}

class Description {
  final String filterName;
  final List<FilterList> filterList;

  Description({
    required this.filterName,
    required this.filterList,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
    filterName: json["FilterName"],
    filterList: List<FilterList>.from(json["FilterList"].map((x) => FilterList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "FilterName": filterName,
    "FilterList": List<dynamic>.from(filterList.map((x) => x.toJson())),
  };
}

class FilterList {
  final int id;
  final String text;

  FilterList({
    required this.id,
    required this.text,
  });

  factory FilterList.fromJson(Map<String, dynamic> json) => FilterList(
    id: json["ID"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "text": text,
  };
}

class Price {
  final String filterName;
  final int minPrice;
  final int maxPrice;

  Price({
    required this.filterName,
    required this.minPrice,
    required this.maxPrice,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    filterName: json["filterName"],
    minPrice: json["minPrice"],
    maxPrice: json["maxPrice"],
  );

  Map<String, dynamic> toJson() => {
    "filterName": filterName,
    "minPrice": minPrice,
    "maxPrice": maxPrice,
  };
}
