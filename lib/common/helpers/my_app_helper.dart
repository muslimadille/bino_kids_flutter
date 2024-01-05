import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/auth/view/screens/login_screen.dart';
import 'package:bino_kids/features/cart/view/screens/cart_items_screen.dart';
import 'package:bino_kids/features/home_tabs/view/home_tabs_screen.dart';
import 'package:bino_kids/features/product/model/products_screen_arquments_model.dart';
import 'package:bino_kids/features/product/view/screens/product_details_screen.dart';
import 'package:bino_kids/features/product/view/screens/products_with_filter_screen.dart';
import 'package:bino_kids/features/user_messages/view/user_messages_screen.dart';
import 'package:flutter/material.dart';



 mixin MyAppHelper{
  Route onGenerateRoute(RouteSettings routeSettings) {
    AppNavigator().routeSettings=routeSettings;
    switch (routeSettings.name) {
      case AppRoutes.HOME_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>   HomeTabsScreen(selectedIndex: routeSettings.arguments  as int?,));
      case AppRoutes.LOGIN_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const LoginScreen());
      case AppRoutes.USER_MESSAGES_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const UserMessagesScreen());

      case AppRoutes.PRODUCTS_WITH_FILTER_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>   ProductWithFiltersScreen(
          dataModel: routeSettings.arguments as ProductsScreenArqumentsModel,
        ));

      case AppRoutes.PRUDUCT_DETAILS_SCREEN_ORUTE:
        return MaterialPageRoute(builder: (_) => ProductDetailsScreen(modelId: routeSettings.arguments as String,));

      case AppRoutes.CART_ITEMS_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) => CartItemsScreen());


      default:
        return MaterialPageRoute(builder: (_) =>  const HomeTabsScreen());
    }
  }
}