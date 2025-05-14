
import 'dart:convert';

AddressesListModel addressesListModelFromJson(String str) => AddressesListModel.fromJson(json.decode(str));

String addressesListModelToJson(AddressesListModel data) => json.encode(data.toJson());

class AddressesListModel {
  final int? status;
  final dynamic? message;
  final AddressDataModel? addressDataModel;

  AddressesListModel({
    required this.status,
    required this.message,
    required this.addressDataModel,
  });

  factory AddressesListModel.fromJson(Map<String, dynamic> json) => AddressesListModel(
    status: json["status"],
    message: json["message"],
    addressDataModel: AddressDataModel.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Data": addressDataModel!.toJson(),
  };
}

class AddressDataModel {
  final List<AddressItemListModel>? addressList;
  final dynamic? user;

  AddressDataModel({
    required this.addressList,
    required this.user,
  });

  factory AddressDataModel.fromJson(Map<String, dynamic> json) => AddressDataModel(
    addressList: json["addressList"]==null?[]:List<AddressItemListModel>.from(json["addressList"].map((x) => AddressItemListModel.fromJson(x))),
    user: json["User"],
  );

  Map<String, dynamic> toJson() => {
    "addressList": List<AddressItemListModel>.from(addressList!.map((x) => x.toJson())),
    "User": user,
  };
}

class AddressItemListModel {
  final int? id;
  final int? governmentId;
  final String? addressName;
  final String? governorateName;

  AddressItemListModel({
    required this.id,
    required this.governmentId,
    required this.addressName,
    required this.governorateName,
  });

  factory AddressItemListModel.fromJson(Map<String, dynamic> json) => AddressItemListModel(
    id: json["Id"],
    governmentId: json["GovernmentId"],
    addressName: json["AddressName"],
    governorateName: json["GovernorateName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "GovernmentId": governmentId,
    "AddressName": addressName,
    "GovernorateName": governorateName,
  };
}
