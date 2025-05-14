import 'dart:convert';

import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/auth/model/verify_user_model.dart';
import 'package:bino_kids/features/auth/repository/auth_repository.dart';
import 'package:bino_kids/features/orders/view/screens/all_orders_screen.dart';
import 'package:bino_kids/features/profile/repository/profile_repository.dart';
import 'package:dio/dio.dart';

mixin ProfileHelper{

  List<OrderTabType> orderTaps=[
    OrderTabType(title: tr("new_order"),icon: "assets/images/ic_unpaid.png"),
    OrderTabType(title: tr("confirmed_order"),icon: "assets/images/ic_processing.png"),
    OrderTabType(title: tr("delivering_order"),icon: "assets/images/ic_review.png"),
    OrderTabType(title: tr("delivered_order"),icon: "assets/images/ic_shipped.png"),
    OrderTabType(title: tr("canceled_order"),icon: "assets/images/cancel_order.png"),
  ];
  gotoOrders({
    num? type,
    String? title,
  }){
    AppNavigator().push(routeName: AppRoutes.ALL_ORDERS_SCREEN_ROUTE,arguments: OrderScreenParams(title:title??'', orderType: type??-1));
  }
  goTOSettings(){
    AppNavigator().push(routeName: AppRoutes.SETTINGS_SCREEN_ROUTE);
  }
  deleteAccount()async{
    await ProfileRepository().deleteAccount();
    AppNavigator().pushAndRemoveAll(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
  }

}
Future<bool?>isUserVerified()async{
  try{
    final response=await AuthRepository().isUserVerified();
    VerifyUserModel verifyUserModel=verifyUserModelFromJson(jsonEncode(response.data));
    AppData.IS_VERIFIED_USER=verifyUserModel.isUserVerified??false;
    return AppData.IS_VERIFIED_USER;
  } on DioException catch (error){
    false;
  }}

class OrderTabType{
  final String title;
  final String icon;
  OrderTabType({required this.title,required this.icon});
}