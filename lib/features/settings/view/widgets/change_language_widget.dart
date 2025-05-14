import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.only(topRight:Radius.circular(5),topLeft:Radius.circular(5)),
        border: Border.fromBorderSide(
            BorderSide(
              width:1,
              color:AppLocalization.isArabic?Colors.black:Colors.grey,
            )
        ),
      ),
      child: Column(children: [
        Row(
          children: [
            SizedBox(width: 5.w,),
            Expanded(child: Text("Change Language",style: TextStyle(fontSize: AppFontSize.medium,fontWeight: FontWeight.w700),textAlign: TextAlign.center,)),
            IconButton(onPressed: (){AppNavigator().goBack();}, icon: Icon(Icons.close)),
          ],
        ),
        Container(width: double.infinity,height: 1,color: Colors.grey[200],),
        SizedBox(height: 3.h,),
        GestureDetector(
          onTap: (){
            AppLocalization.changeLanguage("ar");
            AppNavigator().goBack();
          },
          child: Container(
            width: 80.w,
            padding: EdgeInsets.symmetric(vertical:2.h,horizontal: 10.w),
            decoration: BoxDecoration(
              color:AppLocalization.isArabic?Colors.black:Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.fromBorderSide(
                  BorderSide(
                    width:1,
                    color:AppLocalization.isArabic?Colors.black:Colors.grey,
                  )
              ),
            ),
            child: Text("العربية",style:TextStyle(
                color: AppLocalization.isArabic?Colors.white:Colors.black,
                fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 2.h,),

        GestureDetector(
          onTap: (){
            AppLocalization.changeLanguage("en");
            AppNavigator().goBack();
          },
          child: Container(
            width: 80.w,
            padding: EdgeInsets.symmetric(vertical:2.h,horizontal: 10.w),
            decoration: BoxDecoration(
              color:!AppLocalization.isArabic?Colors.black:Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.fromBorderSide(
                  BorderSide(
                    width:1,
                    color:!AppLocalization.isArabic?Colors.black:Colors.grey,
                  )
              ),
            ),
            child: Text("English",style:TextStyle(
                color: !AppLocalization.isArabic?Colors.white:Colors.black,
                fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 8.h,),

      ],),);
  }
}
