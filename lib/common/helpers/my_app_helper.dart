import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/helpers/check_internet.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/auth/view/screens/forget_password_screen.dart';
import 'package:bino_kids/features/auth/view/screens/login_screen.dart';
import 'package:bino_kids/features/auth/view/screens/otp_screen.dart';
import 'package:bino_kids/features/auth/view/screens/register_screen.dart';
import 'package:bino_kids/features/branches/view/screens/branches_screen.dart';
import 'package:bino_kids/features/cart/view/screens/cart_items_screen.dart';
import 'package:bino_kids/features/cart/view/screens/complete_order_screen.dart';
import 'package:bino_kids/features/cart/view/screens/payment_screen.dart';
import 'package:bino_kids/features/home_tabs/view/home_tabs_screen.dart';
import 'package:bino_kids/features/orders/view/screens/all_orders_screen.dart';
import 'package:bino_kids/features/product/model/model_details_model.dart';
import 'package:bino_kids/features/product/model/product_model.dart';
import 'package:bino_kids/features/product/model/products_screen_arquments_model.dart';
import 'package:bino_kids/features/product/view/screens/images_screen.dart';
import 'package:bino_kids/features/product/view/screens/product_details_screen.dart';
import 'package:bino_kids/features/product/view/screens/products_with_filter_screen.dart';
import 'package:bino_kids/features/product/view/screens/see_all_screen.dart';
import 'package:bino_kids/features/profile/view/about_us_screen.dart';
import 'package:bino_kids/features/profile/view/privacy_policy_screen.dart';
import 'package:bino_kids/features/profile/view/return_policy_screen.dart';
import 'package:bino_kids/features/profile/view/shipping_policy_screen.dart';
import 'package:bino_kids/features/search/view/screens/search_screen.dart';
import 'package:bino_kids/features/settings/view/screens/change_password_screen.dart';
import 'package:bino_kids/features/settings/view/screens/settings_screen.dart';
import 'package:bino_kids/features/user_messages/view/screens/user_messages_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_snakbar.dart';
import '../widgets/no_internet_screen.dart';



 mixin MyAppHelper{
   initConnection({ required Function onConnectionBack}){

     bool isConnectionShowing = false;
     CheckInternet connectionStatus = CheckInternet();
     connectionStatus.initialize();
     connectionStatus.connectionChange.listen((hasConnection){
       if (hasConnection) {
         if (isConnectionShowing) {
           AppNavigator().goBack();
           onConnectionBack();
         }
       } else {
         isConnectionShowing = true;
         AppNavigator().push(routeName: AppRoutes.NO_INTERNET_ROUT);

       }
     });
   }
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
        return MaterialPageRoute(builder: (_) => ProductDetailsScreen(productParams: routeSettings.arguments as ProductDetailsParams,));

      case AppRoutes.CART_ITEMS_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) => CartItemsScreen());


      case AppRoutes.ABOUT_US_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());

      case AppRoutes.PRIVACY_POLICY_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());

      case AppRoutes.RETURN_POLICY_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) => const ReturnPolicyScreen());

      case AppRoutes.SHIPPING_POLICY_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) => const ShippingPolicyScreen());

      case AppRoutes.ALL_ORDERS_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  AllOrdersScreen(params:routeSettings.arguments as OrderScreenParams,));

      case AppRoutes.SETTINGS_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) => const SettingScreen());

      case AppRoutes.SEARCH_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case AppRoutes.REGISTER_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case AppRoutes.IMAGES_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  ImagesScreen(imageList: routeSettings.arguments as List<ImageList>));
      case AppRoutes.PAYMENT_SCREEN_ROUT:
        return MaterialPageRoute(builder: (_) =>  PaymentScreen(url: routeSettings.arguments as String));
      case AppRoutes.OTP_SCREEN_ROUT:
        return MaterialPageRoute(builder: (_) =>  OtpScreen());
      case AppRoutes.BRANCHES_SCREEN_ROUT:
        return MaterialPageRoute(builder: (_) =>  BranchesScreen());
      case AppRoutes.COMPLETE_ORDER_SCREEN_ROUT:
        return MaterialPageRoute(builder: (_) =>  CompleteOrderScreen());
      case AppRoutes.NO_INTERNET_ROUT:
        return MaterialPageRoute(builder: (_) =>  NoInternetScreen());
      case AppRoutes.SEE_ALL_SCREENN_ROUT:
        return MaterialPageRoute(builder: (_) =>  SeeAllScreen(params: routeSettings.arguments as SeeAllScreenParams,));
      case AppRoutes.FORGET_PASSWORD_SCREEN_ROUT:
        return MaterialPageRoute(builder: (_) =>  ForgetPasswordScreen());
      case AppRoutes.CHANGE_PASSWORD_SCREEN_ROUT:
        return MaterialPageRoute(builder: (_) =>  ChangePasswordScreen());

      default:
        return MaterialPageRoute(builder: (_) =>  const HomeTabsScreen());
    }
  }
}