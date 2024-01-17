import 'dart:convert';

import 'package:bino_kids/features/profile/model/privacy_model.dart';
import 'package:bino_kids/features/profile/repository/profile_repository.dart';

mixin PolicyHelper{
  Future<PrivacyModel?>getAboutUs()async{
    final response=await ProfileRepository().getAboutUs();
    PrivacyModel privacyModel=privacyModelFromJson(jsonEncode(response.data));
    return privacyModel;
  }
  Future<PrivacyModel?>getPrivacyPolicy()async{
    final response=await ProfileRepository().getPrivacyPolicy();
    PrivacyModel privacyModel=privacyModelFromJson(jsonEncode(response.data));
    return privacyModel;
  }

  Future<PrivacyModel?>getExchangePolicy()async{
    final response=await ProfileRepository().getExchangePolicy();
    PrivacyModel privacyModel=privacyModelFromJson(jsonEncode(response.data));
    return privacyModel;
  }
  Future<PrivacyModel?>getShippingPolicy()async{
    final response=await ProfileRepository().getShippingPolicy();
    PrivacyModel privacyModel=privacyModelFromJson(jsonEncode(response.data));
    return privacyModel;
  }
}