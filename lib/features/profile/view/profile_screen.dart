import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/common/widgets/custom_popup.dart';
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
                if(AppData.USER_NAME.isEmpty){
                  AppNavigator().push(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
                }
              },
                child: Text(AppData.USER_NAME.isNotEmpty?"${tr("Hi")} ${AppData.USER_NAME}":tr("SIGNIN/REGISTER >"),style: TextStyle(fontSize: AppFontSize.medium
                    ,fontWeight: FontWeight.w700))),
            GestureDetector(
              onTap: (){
                goTOSettings();
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
                Text(tr("My_orders"),style: TextStyle(fontSize: AppFontSize.medium,fontWeight: FontWeight.w500),),
                GestureDetector(
                  onTap: (){
                    gotoOrders();
                  },
                  child: Text(tr("View_All"),style: TextStyle(
                    color: Colors.grey,
                      fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),),
                ),
              ],),
              SizedBox(height: 2.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(orderTaps.length, (index){
                return Expanded(
                    child: GestureDetector(
                      onTap: (){
                        gotoOrders(type: index,title:orderTaps[index].title );
                      },
                      child: Column(children: [
                        Image.asset(orderTaps[index].icon,width: 6.w,height: 6.w,),
                        SizedBox(height:1.h,),
                        Text(orderTaps[index].title,textAlign: TextAlign.center,style: TextStyle(fontSize: AppFontSize.small),)
                      ],),));
              }),)

            ],),
        ),
        const ProfileDividerWidget(),
        Visibility(
          visible: !AppData.IS_VERIFIED_USER,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
            child: GestureDetector(
              onTap: (){
                AppNavigator().push(routeName: AppRoutes.OTP_SCREEN_ROUT);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tr("active_account"),style: TextStyle(fontSize: AppFontSize.medium,fontWeight: FontWeight.w500),),
                  Icon(Icons.arrow_forward_ios,color: Colors.grey,size:18,)
                ],),
            ),
          ),
        ),
        const ProfileDividerWidget(),
        Expanded(child: SizedBox(),),
        Center(
          child: InkWell(
            onTap: ()async{
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return MyPopup(
                    title: tr("delete_account_message"),
                    onSubmit: () async{
                      await deleteAccount();
                    },
                  );
                },
              );

            },
            child: Text(tr("delete_account"),style: TextStyle(color:Colors.red,fontSize: AppFontSize.medium,fontWeight: FontWeight
            .w800),),
          ),
        ),
        SizedBox(height: 3.h,)

      ],),
    );
  }
}
