import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/home_tabs/view/home_tabs_screen.dart';
import 'package:flutter/material.dart';



 mixin MyAppHelper{
  Route onGenerateRoute(RouteSettings routeSettings) {
    AppNavigator().routeSettings=routeSettings;
    switch (routeSettings.name) {
      case AppRoutes.HOME_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const HomeTabsScreen());
      default:
        return MaterialPageRoute(builder: (_) =>  const HomeTabsScreen());
    }
  }
}