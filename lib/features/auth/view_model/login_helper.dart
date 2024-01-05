import 'dart:convert';

import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/helpers/local_storage.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/auth/model/login_model.dart';
import 'package:dio/dio.dart';

import '../repository/auth_repository.dart';

mixin LoginHelper{
  login()async{
    try{
      final response=await AuthRepository().login(mobileNumber: "",password: "");
      LoginModel loginModel=loginModelFromJson(jsonEncode(response.data));
      LocalStorage().putInBox(key: AppData.USER_ID_STORAGE_KEY, value: loginModel.userId);
      LocalStorage().putInBox(key: AppData.USER_ROLE_STORAGE_KEY, value: loginModel.userRole);
      LocalStorage().putInBox(key: AppData.USER_NAME_STORAGE_KEY, value: loginModel.userName);
      AppData.USER_ID=loginModel.userId;
      AppData.USER_NAME=loginModel.userName;
      AppData.USER_ROLE=loginModel.userRole;
      AppNavigator().pushReplacement(routeName: AppRoutes.HOME_SCREEN_ROUTE);

    } on DioException catch (error){
    }
  }
  Future<bool> isUserLogin()async{
    String id=await LocalStorage().getFromBox(key: AppData.USER_ID_STORAGE_KEY)??"";
    if(id.isNotEmpty){
      AppData.USER_ID=await LocalStorage().getFromBox(key: AppData.USER_ID_STORAGE_KEY)??"";
      AppData.USER_NAME=await LocalStorage().getFromBox(key: AppData.USER_ROLE_STORAGE_KEY)??"";
      AppData.USER_ROLE=await LocalStorage().getFromBox(key: AppData.USER_NAME_STORAGE_KEY)??"";
    }
    return id.isNotEmpty;
  }
}