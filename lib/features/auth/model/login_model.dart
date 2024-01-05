// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final String userId;
  final String profileImageUrl;
  final String userName;
  final String status;
  final String userRole;
  final String message;
  final String isVerified;
  final String isFirstTimeToVerify;
  final String isRedirectedToCart;
  final String user;
  final String issued;
  final String expires;

  LoginModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.userId,
    required this.profileImageUrl,
    required this.userName,
    required this.status,
    required this.userRole,
    required this.message,
    required this.isVerified,
    required this.isFirstTimeToVerify,
    required this.isRedirectedToCart,
    required this.user,
    required this.issued,
    required this.expires,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
    userId: json["UserID"],
    profileImageUrl: json["ProfileImageURL"],
    userName: json["userName"],
    status: json["status"],
    userRole: json["userRole"],
    message: json["message"],
    isVerified: json["IsVerified"],
    isFirstTimeToVerify: json["IsFirstTimeToVerify"],
    isRedirectedToCart: json["IsRedirectedToCart"],
    user: json["user"],
    issued: json[".issued"],
    expires: json[".expires"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
    "UserID": userId,
    "ProfileImageURL": profileImageUrl,
    "userName": userName,
    "status": status,
    "userRole": userRole,
    "message": message,
    "IsVerified": isVerified,
    "IsFirstTimeToVerify": isFirstTimeToVerify,
    "IsRedirectedToCart": isRedirectedToCart,
    "user": user,
    ".issued": issued,
    ".expires": expires,
  };
}
