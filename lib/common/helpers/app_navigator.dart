import 'package:flutter/material.dart';

class AppNavigator {
  static AppNavigator? _instance;

  AppNavigator._internal();

  factory AppNavigator() {
    return _instance??=AppNavigator._internal();
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  RouteSettings? routeSettings;

  NavigatorState currentState() => navigatorKey.currentState!;

  BuildContext currentContext() => navigatorKey.currentContext!;

  Future<Object?> push({required String routeName, Object? arguments}) {
    return currentState().pushNamed(routeName, arguments: arguments);
  }

  void pushReplacement({required String routeName, Object? arguments}) {
    currentState().pushReplacementNamed(routeName, arguments: arguments);
  }

  void pushAndRemoveAll({required String routeName, Object? arguments}) {
    currentState().pushNamedAndRemoveUntil(routeName,(Route route) => false, arguments: arguments);
  }

  void goBack({Object? result}) {
    if(currentState().canPop() ){
      currentState().pop(result);
    }
  }

  void popUntilFirstRoot() {
    currentState().popUntil((route) => route.isFirst);
  }

  void popUntilPageWithName({required String routeName}) {
    currentState().popUntil(ModalRoute.withName(routeName));
  }
}
