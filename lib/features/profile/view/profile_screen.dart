import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/profile/view/widgets/profile_devider_widget.dart';
import 'package:bino_kids/features/profile/view_model/profile_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>with ProfileHelper {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            GestureDetector(
              onTap:(){
                AppNavigator().push(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
              },
                child: Text("SIGNIN/REGISTER >",style: TextStyle(fontSize: AppFontSize.medium
                    ,fontWeight: FontWeight.w700))),
            GestureDetector(
              onTap: (){
                ///go to settings
              },
                child: Icon(Icons.settings_outlined,size: 6.w,))

          ],),
        ),
        const ProfileDividerWidget(),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("My Orders",style: TextStyle(fontSize: AppFontSize.medium,fontWeight: FontWeight.w500),),
                Text("View All >",style: TextStyle(
                  color: Colors.grey,
                    fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),),
              ],),
              SizedBox(height: 2.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(orderIcons.length, (index){
                return Expanded(
                    child: GestureDetector(
                      onTap: (){
                        AppNavigator().push(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
                      },
                      child: Column(children: [
                        Image.asset(orderIcons[index],width: 6.w,height: 6.w,),
                        SizedBox(height:1.h,),
                        Text(orderTitles[index],textAlign: TextAlign.center,style: TextStyle(fontSize: AppFontSize.x_small),)
                      ],),));
              }),)

            ],),
        ),
        const ProfileDividerWidget(),

      ],),
    );
  }
}
