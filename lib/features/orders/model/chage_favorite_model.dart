import 'dart:convert';

ChangeFavouriteModel changeFavouriteModelFromJson(String str) => ChangeFavouriteModel.fromJson(json.decode(str));

String changeFavouriteModelToJson(ChangeFavouriteModel data) => json.encode(data.toJson());

class ChangeFavouriteModel {
  final num? status;
  final String? message;

  ChangeFavouriteModel({
    required this.status,
    required this.message,
  });

  factory ChangeFavouriteModel.fromJson(Map<String, dynamic> json) => ChangeFavouriteModel(
    status: json["status"]??0,
    message: json["message"]??"",
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}