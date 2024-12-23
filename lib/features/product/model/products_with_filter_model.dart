
import 'dart:convert';

import 'package:bino_kids/features/product/model/filter_model.dart';
import 'package:bino_kids/features/product/model/price_model.dart';
import 'package:bino_kids/features/product/model/product_model.dart';
import 'package:hive/hive.dart';
part 'products_with_filter_model.g.dart';


ProductsWithFilterModel productsWithFilterModeFromJson(String str) => ProductsWithFilterModel.fromJson(json.decode(str));

String productsWithFilterModeToJson(ProductsWithFilterModel data) => json.encode(data.toJson());

ProductsWithFilterBaseModel productsWithFilterBaseModelFromJson(String str) => ProductsWithFilterBaseModel.fromJson(json.decode(str));

String productsWithFilterBaseModelToJson(ProductsWithFilterBaseModel data) => json.encode(data.toJson());



@HiveType(typeId: 16)
class ProductsWithFilterBaseModel extends HiveObject {
  @HiveField(0)
  int? status;
  @HiveField(1)
  String? message;
  @HiveField(2)
  ProductsWithFilterModel? data;

  ProductsWithFilterBaseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductsWithFilterBaseModel.fromJson(Map<String, dynamic> json) => ProductsWithFilterBaseModel(
    status: json["status"] ?? 0,
    message: json["message"] ?? '',
    data: ProductsWithFilterModel.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

@HiveType(typeId: 17)
class ProductsWithFilterModel extends HiveObject {
  @HiveField(0)
  final num? status;
  @HiveField(1)
  final String? message;
  @HiveField(2)
  final bool? next;
  @HiveField(3)
   Filters filters;
  @HiveField(4)
  final dynamic? modelTypes;
  @HiveField(5)
  final Price? price;
  @HiveField(6)
  final List<ProductModel>? modelList;
  @HiveField(7)
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
    status: json["status"] ?? -1,
    message: json["message"] ?? '',
    next: json["next"] ?? false,
    filters: Filters.fromJson(json["filters"] ?? {}),
    modelTypes: json["modelTypes"],
    price: Price.fromJson(json["price"] ?? {}),
    modelList: json["modelList"] == null ? [] : List<ProductModel>.from(json["modelList"].map((x) => ProductModel.fromJson(x))),
    imageList: json["ImageList"] ?? [],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "next": next,
    "filters": filters.toJson(),
    "modelTypes": modelTypes,
    "price": price!.toJson(),
    "modelList": List<dynamic>.from(modelList!.map((x) => x.toJson())),
    "ImageList": imageList,
  };
}







