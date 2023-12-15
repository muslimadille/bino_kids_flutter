import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/login_screen.dart';
import 'package:flutter/material.dart';

 mixin MyAppHelper{
  Route onGenerateRoute(RouteSettings routeSettings) {
    AppNavigator().routeSettings=routeSettings;
    switch (routeSettings.name) {
      case AppRoutes.LOGIN_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const LoginScreen());

      default:
        return MaterialPageRoute(builder: (_) =>  Container());
    }
  }
}