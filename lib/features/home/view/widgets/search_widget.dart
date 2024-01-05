import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Expanded(
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: AppLocalization.isArabic?
              BorderRadius.only(topRight:Radius.circular(8),bottomRight:Radius.circular(8))
                  :BorderRadius.only(topLeft:Radius.circular(8),bottomLeft:Radius.circular(8)),

            ),
          height:5.h,
            padding: EdgeInsets.only(top:3.w,left: 4.w,right:4.w),
            child: Text("boys",style: TextStyle(color: Colors.grey),)),
      ),
      Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: AppLocalization.isArabic?
            BorderRadius.only(topLeft:Radius.circular(8),bottomLeft:Radius.circular(8)):
              BorderRadius.only(topRight:Radius.circular(8),bottomRight:Radius.circular(8))
          ),
          height:5.h,
          padding: EdgeInsets.all(2.w),
          child: Icon(Icons.search,color: Colors.white,))
    ],);
  }
}
