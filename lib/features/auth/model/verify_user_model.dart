
import 'dart:convert';

VerifyUserModel verifyUserModelFromJson(String str) => VerifyUserModel.fromJson(json.decode(str));

String verifyUserModelToJson(VerifyUserModel data) => json.encode(data.toJson());

class VerifyUserModel {
  int status;
  String message;
  bool verificationResult;
  bool resendingCodeResult;
  bool isUserVerified;

  VerifyUserModel({
    required this.status,
    required this.message,
    required this.verificationResult,
    required this.resendingCodeResult,
    required this.isUserVerified,
  });

  factory VerifyUserModel.fromJson(Map<String, dynamic> json) => VerifyUserModel(
    status: json["status"],
    message: json["message"]??"",
    verificationResult: json["VerificationResult"]??false,
    resendingCodeResult: json["ResendingCodeResult"]??false,
    isUserVerified: json["isUserVerified"]??false,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "VerificationResult": verificationResult,
    "ResendingCodeResult": resendingCodeResult,
    "isUserVerified": isUserVerified,
  };
}
