import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/widgets/custom_snakbar.dart';
import 'package:bino_kids/features/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier{
  late final TextEditingController nameController;
  late final TextEditingController mobileController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController companyNameController;
  late final TextEditingController companyActivityController;
  late final TextEditingController companyAddressController;

  onTextChange(){
    notifyListeners();
  }
  onInit(){
    selectedRegisterTab=0;
     nameController=TextEditingController();
     mobileController=TextEditingController();
     emailController=TextEditingController();
     passwordController=TextEditingController();
     confirmPasswordController=TextEditingController();
     companyNameController=TextEditingController();
     companyActivityController=TextEditingController();
     companyAddressController=TextEditingController();
  }
  onDispose(){
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    companyNameController.dispose();
    companyActivityController.dispose();
    companyAddressController.dispose();
  }

  List<String>tabNames=[
    tr("person"),
  tr("company")
  ];
  int selectedRegisterTab=0;
  selectTab(int index){
    selectedRegisterTab=index;
    notifyListeners();
  }
  register()async{
    if(selectedRegisterTab==0){
      await AuthRepository().register({
        "Lang": 2,
        "Email": emailController.text,
        "Password": passwordController.text,
        "ConfirmPassword": confirmPasswordController.text,
        "UserName": nameController.text,
        "Phone": mobileController.text,
        "UserTypePortal": 2,
      }).then((value) {
        if(value.data["status"]==1){
          CustomSnakbar().appSnackBar(text:value.data["message"]);
          AppNavigator().goBack();
        }
      });
    }else{
      await AuthRepository().register({
        "Lang": 2,
        "Email": emailController.text,
        "Password": passwordController.text,
        "ConfirmPassword": confirmPasswordController.text,
        "UserName": nameController.text,
        "Phone": mobileController.text,
        "CompanyName": companyNameController.text,
        "CompanyAcivity": companyActivityController.text,
        "CompanyAddress": companyAddressController.text,
        "UserTypePortal": 4,
      }).then((value) {
        if(value.data["status"]==1){
          CustomSnakbar().appSnackBar(text:value.data["message"]);
          AppNavigator().goBack();
        }
      });
    }

  }
  bool isAllFieldsCompleted(){
    if(selectedRegisterTab==0){
      return (
          nameController.text.isNotEmpty&&
              mobileController.text.isNotEmpty&&emailController.text.isNotEmpty&&
              passwordController.text.isNotEmpty&&confirmPasswordController.text.isNotEmpty);
    }else{
      return (
          nameController.text.isNotEmpty&&
              mobileController.text.isNotEmpty&&emailController.text.isNotEmpty&&
              passwordController.text.isNotEmpty&&confirmPasswordController.text.isNotEmpty&&
              companyNameController.text.isNotEmpty&&companyActivityController.text.isNotEmpty&&
              companyAddressController.text.isNotEmpty);
    }
  }
}