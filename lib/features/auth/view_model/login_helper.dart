import 'dart:convert';

import 'package:bino_kids/features/auth/model/user_model.dart';
import 'package:dio/dio.dart';

import '../repository/auth_repository.dart';

mixin LoginHelper{
  login()async{
    try{
      final response=await AuthRepository().login(mobileNumber: "",password: "");
      UserModel userModel=userModelFromJson(jsonEncode(response.data));
      print(response);
    } on DioException catch (error){
      print(error);
    }
  }
}