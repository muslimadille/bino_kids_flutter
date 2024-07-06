import 'dart:convert';

import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/helpers/facebook_analytics_helper.dart';
import 'package:bino_kids/common/helpers/local_storage.dart';
import 'package:bino_kids/common/helpers/notification_helper.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/common/widgets/costum_bottom_sheet.dart';
import 'package:bino_kids/features/auth/model/login_model.dart';
import 'package:bino_kids/features/auth/model/verify_user_model.dart';
import 'package:bino_kids/features/auth/view/screens/select_phone_botton_sheet.dart';
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

  Future<bool?>checkSocialLogin({required String socialId,required String email,required name})async{
    final response=await AuthRepository().checkThirdPartyLogin(email: email,socailId:socialId);
    if(response.data["status"]==1){
      showDialog(
          barrierDismissible:false,
        context: AppNavigator().currentContext(), builder: (BuildContext context) {
          return SelectPhoneBottomSheet(onSubmit: (phone)async
          {
            await socialRgister(socialId:socialId,email: email,name: name,phone: phone);
          },);
      },


      );
    }else{
      await login(socialId:socialId);
    }
  }
  login({String? socialId,String?email})async{
    if((emailCotroller.text.isNotEmpty&&passwordCotroller.text.isNotEmpty)||socialId!=null){
      try{
        final response=await AuthRepository().login(
            mobileNumber: email??emailCotroller.text,
            password:passwordCotroller.text,
            socailId: socialId);

        LoginModel loginModel=loginModelFromJson(jsonEncode(response.data));
        LocalStorage().putInBox(key: AppData.USER_ID_STORAGE_KEY, value: loginModel.userId);
        LocalStorage().putInBox(key: AppData.USER_ROLE_STORAGE_KEY, value: loginModel.userRole);
        LocalStorage().putInBox(key: AppData.USER_NAME_STORAGE_KEY, value: loginModel.userName);
        AppData.USER_ID=loginModel.userId;
        AppData.USER_NAME=loginModel.userName;
        AppData.USER_ROLE=loginModel.userRole;
        AppData.IS_VERIFIED_USER=loginModel.isVerified=="True";
        Map<String,dynamic>user=jsonDecode(loginModel.user);
        AppData.USER_NUMBER=user['Phone'].toString();
        FacebookAnalyticsHelper.getInstance().init(AppNavigator().currentContext());
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
      await isUserVerified();
    }
    return id.isNotEmpty;
  }
  socialRgister({required String socialId,required String email,required String name,required String phone})async{
    try{
      await AuthRepository().socialRegister(socialId:socialId,email: email,name: name,phone: phone);
      await login(socialId:socialId);
    } on DioException catch (error){
    }


  }
  verifyUser(String code)async{

      try{
        final response=await AuthRepository().verifyUser(code);
        VerifyUserModel verifyUserModel=verifyUserModelFromJson(jsonEncode(response.data));
        if(verifyUserModel.status!=0){
          AppData.IS_VERIFIED_USER=true;
          CustomSnakbar().appSnackBar(isFaild: false,text: 'تم تفعيل الحساب بنجاح');
          AppNavigator().goBack(result: true);
          //AppNavigator().pushReplacement(routeName: AppRoutes.HOME_SCREEN_ROUTE);
        }else{
          CustomSnakbar().appSnackBar(isFaild: true,text:verifyUserModel.message);
        }
      } on DioException catch (error){
      }


  }
  Future<bool?>isUserVerified()async{
    try{
      final response=await AuthRepository().isUserVerified();
      VerifyUserModel verifyUserModel=verifyUserModelFromJson(jsonEncode(response.data));
      AppData.IS_VERIFIED_USER=verifyUserModel.isUserVerified??false;
    } on DioException catch (error){
    }


  }
  resendVerifyCode()async{
    try{
      final response=await AuthRepository().resendVerifyCode();
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