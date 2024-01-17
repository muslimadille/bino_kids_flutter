import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomBackBtn extends StatelessWidget {
  final String? title;
  bool? hideBtn;

   CustomBackBtn({
    this.hideBtn,
    this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
    padding:EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap:(){
                  AppNavigator().goBack();
                } ,
                  child: (hideBtn??false)?SizedBox():Icon(Icons.arrow_back,textDirection:AppLocalization.isArabic?TextDirection.rtl:TextDirection.ltr ,)),
              Expanded(child: Text(title??'',textAlign: TextAlign.center,style: TextStyle(fontSize: AppFontSize.medium,fontWeight: FontWeight.w700),)),
              SizedBox(width: 4.w,)
            ],),
        ),
        Container(color: Colors.grey[200],width: double.infinity,height: 1,)
      ],
    );
  }
}
