
import 'dart:convert';

import 'package:bino_kids/features/product/model/filter_model.dart';
import 'package:bino_kids/features/product/model/price_model.dart';
import 'package:bino_kids/features/product/model/product_model.dart';

ProductsWithFilterModel productsWithFilterModeFromJson(String str) => ProductsWithFilterModel.fromJson(json.decode(str));

String productsWithFilterModeToJson(ProductsWithFilterModel data) => json.encode(data.toJson());

class ProductsWithFilterModel {
  final num? status;
  final String? message;
  final bool? next;
  final Filters? filters;
  final dynamic? modelTypes;
  final Price? price;
  final List<ProductModel>? modelList;
  final dynamic? imageList;

  ProductsWithFilterModel({
    required this.status,
    required this.message,
    required this.next,
    required this.filters,
    required this.modelTypes,
    required this.price,
    required this.modelList,
    required this.imageList,
  });

  factory ProductsWithFilterModel.fromJson(Map<String, dynamic> json) => ProductsWithFilterModel(
    status: json["status"]??-1,
    message: json["message"]??'',
    next: json["next"]??false,
    filters: Filters.fromJson(json["filters"]??{}),
    modelTypes: json["modelTypes"],
    price: Price.fromJson(json["price"]??{}),
    modelList: json["modelList"]==null?[]:List<ProductModel>.from(json["modelList"].map((x) => ProductModel.fromJson(x))),
    imageList: json["ImageList"]??[],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "next": next,
    "filters": filters!.toJson(),
    "modelTypes": modelTypes,
    "price": price!.toJson(),
    "modelList": List<dynamic>.from(modelList!.map((x) => x.toJson())),
    "ImageList": imageList,
  };
}







