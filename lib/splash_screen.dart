import 'dart:convert';
import 'dart:io';

import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/helpers/config_helper.dart';
import 'package:bino_kids/common/helpers/facebook_analytics_helper.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/auth/view_model/login_helper.dart';
import 'package:bino_kids/features/profile/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common/helpers/app_localization.dart';
import 'common/helpers/my_app_helper.dart';
import 'common/utils/constants/app_font_size.dart';
import 'features/auth/model/mobilee_version_model.dart';
import 'features/auth/repository/auth_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with LoginHelper,MyAppHelper{
  @override
  void initState() {

    FacebookAnalyticsHelper.getInstance().init(context);
    context.read<ProfileProvider>().getCustomerServiceNumber();
       checkLogin();
    super.initState();
  }
  checkLogin()async{
    //AppData.REVIEW_MODE =await ConfigHelper().getReviewStatus();

    final  response=await AuthRepository().getMobileVersion();
    MobileVersionModel mobileVersionResponse =mobileVersionModelFromJson(jsonEncode(response.data));
    if(AppData.MOBILE_VERSION<mobileVersionResponse.latestVersion.minVersion){
      showDialog(context: context,
          barrierDismissible:false,
          builder: (ctx){
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 10.w),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
            width:  double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(
                    BorderSide(
                        width:1,
                        color:Colors.grey
                    )
                )
            ),
            child: Column(children: [
              Image.asset("assets/images/app_icon.png",width: 15.h,height: 15.h,),
              SizedBox(height: 2.h,),
              Text("للمتابعة الرجاء التحديث لآخر نسخة  من التطبيق",textAlign: TextAlign.center,style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w600),),
              Expanded(child: SizedBox()),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor:Colors.black,
                    disabledBackgroundColor: Colors.grey,
                    disabledForegroundColor: Colors.grey,
                    disabledMouseCursor: SystemMouseCursors.forbidden,
                    padding: EdgeInsets.symmetric(vertical:2.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(width: 1,color: Colors.black)
                    ),
                  ),
                  onPressed: ()async{
                    String storeUrl="";
                    if (Platform.isAndroid) {
                      storeUrl="https://play.google.com/store/apps/details?id=com.binokids";
                    } else if (Platform.isIOS) {
                      storeUrl="https://apps.apple.com/eg/app/bino-kids/id1596803198";
                    }
                    await _launchUrl(storeUrl);
                  },
                  child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        tr("تحديث"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppFontSize.x_x_small,
                            fontWeight: FontWeight.w700
                        ),
                      )
                  ),
                ),
              ),

            ],),
          ),
        );
          });
    }else{
      await initConnection(onConnectionBack: ()async{
        bool isLogin=await isUserLogin();
        if(isLogin){
          AppNavigator().pushReplacement(routeName: AppRoutes.HOME_SCREEN_ROUTE);
        }else{
          AppNavigator().pushReplacement(routeName: AppRoutes.HOME_SCREEN_ROUTE);
        }
      });
      bool isLogin=await isUserLogin();
      if(isLogin){
        AppNavigator().pushReplacement(routeName: AppRoutes.HOME_SCREEN_ROUTE);
      }else{
        AppNavigator().pushReplacement(routeName: AppRoutes.HOME_SCREEN_ROUTE);
      }
    }

  }
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(/*Image.asset("assets/images/app_icon.png",width: 15.h,height: 15.h,)*/),);
  }
}
