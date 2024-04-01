import 'dart:convert';

import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/common/widgets/custom_snakbar.dart';
import 'package:bino_kids/features/auth/model/verify_user_model.dart';
import 'package:bino_kids/features/auth/repository/auth_repository.dart';
import 'package:flutter/Material.dart';

mixin ChangePasswordHelper{
  late final TextEditingController oldPasswordController;
  late final TextEditingController newPasswordController;
onInit(){
  oldPasswordController=TextEditingController();
  newPasswordController=TextEditingController();
}
onDispose(){
  oldPasswordController.dispose();
  newPasswordController.dispose();
}
  changePassword()async{
  final response=await AuthRepository().changePassword(oldPassword:oldPasswordController.text,newPassword: newPasswordController.text );
  VerifyUserModel verifyUserModel=verifyUserModelFromJson(jsonEncode(response.data));
  if(verifyUserModel.status==1){
    CustomSnakbar().appSnackBar(text: verifyUserModel.message);
    AppNavigator().push(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
  }
  }

}