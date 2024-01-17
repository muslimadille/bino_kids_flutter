import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/helpers/local_storage.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier{
  logout(){
    LocalStorage().putInBox(key: AppData.USER_ID_STORAGE_KEY, value: "");
    LocalStorage().putInBox(key: AppData.USER_ROLE_STORAGE_KEY, value:"");
    LocalStorage().putInBox(key: AppData.USER_NAME_STORAGE_KEY, value: "");
    AppData.USER_ID="";
    AppData.USER_NAME="";
    AppData.USER_ROLE="";
    AppNavigator().pushAndRemoveAll(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
  }
}