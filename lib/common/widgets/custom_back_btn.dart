import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomBackBtn extends StatelessWidget {

  const CustomBackBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding:EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap:(){
            AppNavigator().goBack();
          } ,
            child: Icon(Icons.arrow_back,textDirection:AppLocalization.isArabic?TextDirection.rtl:TextDirection.ltr ,))],),);
  }
}
