import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppNavigator().push(routeName: AppRoutes.SEARCH_SCREEN_ROUTE);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: AppLocalization.isArabic?
                BorderRadius.only(topRight:Radius.circular(5),bottomRight:Radius.circular(5))
                    :BorderRadius.only(topLeft:Radius.circular(5),bottomLeft:Radius.circular(5)),

              ),
            height:5.h,
              padding: EdgeInsets.only(top:3.w,left: 4.w,right:4.w),
              child: Text("boys",style: TextStyle(color: Colors.grey),)),
        ),
        Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: AppLocalization.isArabic?
              BorderRadius.only(topLeft:Radius.circular(5),bottomLeft:Radius.circular(5)):
                BorderRadius.only(topRight:Radius.circular(5),bottomRight:Radius.circular(5))
            ),
            height:5.h,
            padding: EdgeInsets.all(2.w),
            child: Icon(Icons.search,color: Colors.white,))
      ],),
    );
  }
}
