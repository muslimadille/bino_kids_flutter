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

import 'common/helpers/my_app_helper.dart';

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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(/*Image.asset("assets/images/app_icon.png",width: 15.h,height: 15.h,)*/),);
  }
}
