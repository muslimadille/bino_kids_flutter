import 'dart:convert';

import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/helpers/local_storage.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/common/widgets/top_snackbar_custom/top_snack_bar.dart';
import 'package:bino_kids/features/auth/model/login_model.dart';
import 'package:bino_kids/features/auth/model/verify_user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_snakbar.dart';
import '../repository/auth_repository.dart';

mixin LoginHelper{
  late final TextEditingController emailCotroller;
  late final TextEditingController passwordCotroller;
  onInit(){
    emailCotroller=TextEditingController();
    passwordCotroller=TextEditingController();
    }
    onDispose(){
      emailCotroller.dispose();
      passwordCotroller.dispose();
    }
  bool showIcone=false;

  login()async{
    if(emailCotroller.text.isNotEmpty&&passwordCotroller.text.isNotEmpty){
      try{
        final response=await AuthRepository().login(mobileNumber: emailCotroller.text,password:passwordCotroller.text);
        LoginModel loginModel=loginModelFromJson(jsonEncode(response.data));
        LocalStorage().putInBox(key: AppData.USER_ID_STORAGE_KEY, value: loginModel.userId);
        LocalStorage().putInBox(key: AppData.USER_ROLE_STORAGE_KEY, value: loginModel.userRole);
        LocalStorage().putInBox(key: AppData.USER_NAME_STORAGE_KEY, value: loginModel.userName);
        AppData.USER_ID=loginModel.userId;
        AppData.USER_NAME=loginModel.userName;
        AppData.USER_ROLE=loginModel.userRole;
        AppData.IS_VERIFIED_USER=loginModel.isVerified=="True";
        AppNavigator().pushReplacement(routeName: AppRoutes.HOME_SCREEN_ROUTE);

      } on DioException catch (error){
      }
    }else{
      CustomSnakbar().appSnackBar(isFaild: true,text: 'Enter valid Email and password');
    }

  }
  Future<bool> isUserLogin()async{
    String id=await LocalStorage().getFromBox(key: AppData.USER_ID_STORAGE_KEY)??"";
    if(id.isNotEmpty){
      AppData.USER_ID=await LocalStorage().getFromBox(key: AppData.USER_ID_STORAGE_KEY)??"";
      AppData.USER_NAME=await LocalStorage().getFromBox(key: AppData.USER_NAME_STORAGE_KEY)??"";
      AppData.USER_ROLE=await LocalStorage().getFromBox(key: AppData.USER_ROLE_STORAGE_KEY)??"";
    }
    return id.isNotEmpty;
  }
  verifyUser(String code)async{

      try{
        final response=await AuthRepository().verifyUser(code);
        VerifyUserModel verifyUserModel=verifyUserModelFromJson(jsonEncode(response.data));
        if(verifyUserModel.status!=0){
          AppData.IS_VERIFIED_USER=true;
          CustomSnakbar().appSnackBar(isFaild: false,text: 'تم تفعيل الحساب بنجاح');
          AppNavigator().pushReplacement(routeName: AppRoutes.HOME_SCREEN_ROUTE);
        }else{
          CustomSnakbar().appSnackBar(isFaild: true,text:verifyUserModel.message);
        }
      } on DioException catch (error){
      }


  }
}