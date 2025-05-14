import 'dart:convert';

import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/widgets/custom_snakbar.dart';
import 'package:bino_kids/features/auth/model/verify_user_model.dart';
import 'package:bino_kids/features/auth/repository/auth_repository.dart';
import 'package:flutter/Material.dart';

mixin ForgetPasswordScreenHelper{
  late final TextEditingController emailCotroller;
  onInit(){
    emailCotroller=TextEditingController();
  }
  onDispose(){
    emailCotroller.dispose();
  }
  resetPassword()async{
    final resopnse=await AuthRepository().forgetPassword(mobile: emailCotroller.text);
    VerifyUserModel verifyUserModel=verifyUserModelFromJson(jsonEncode(resopnse.data));
    CustomSnakbar().appSnackBar(text: verifyUserModel.message);
    if(verifyUserModel.status==1){
      AppNavigator().goBack();
    }
  }
}