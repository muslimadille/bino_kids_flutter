import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/auth/view_model/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with LoginHelper{
  @override
  void initState() {
       checkLogin();
    super.initState();
  }
  checkLogin()async{
    bool isLogin=await isUserLogin();
    if(isLogin){
      AppNavigator().pushReplacement(routeName: AppRoutes.HOME_SCREEN_ROUTE);
    }else{
      AppNavigator().pushReplacement(routeName: AppRoutes.HOME_SCREEN_ROUTE);
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(child: Image.asset("assets/images/app_icon.png",width: 15.h,height: 15.h,),),);
  }
}
