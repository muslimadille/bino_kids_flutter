import 'dart:convert';

ResponseException responseExceptionFromJson(String str) => ResponseException.fromJson(json.decode(str));

String responseExceptionToJson(ResponseException data) => json.encode(data.toJson());

class ResponseException {
  final Data data;

  ResponseException({
    required this.data,
  });

  factory ResponseException.fromJson(Map<String, dynamic> json) => ResponseException(
    data: Data.fromJson(json["data"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  final String errorCode;
  final String message;

  Data({
    required this.errorCode,
    required this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    errorCode: json["errorCode"]??"",
    message: json["message"]??"",
  );

  Map<String, dynamic> toJson() => {
    "errorCode": errorCode,
    "message": message,
  };
}