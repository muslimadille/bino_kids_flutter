import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/auth/provider/login_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/helpers/app_localization.dart';

class HomeDrawerWidget extends StatelessWidget {
  const HomeDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(child:
                Center(child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Image.asset("assets/images/app_name_icon.png"),
                )) ),
                ListTile(
                  leading: Icon(Icons.new_releases_outlined,color: Colors.black,),
                  title: Text(tr("about_us")),
                  onTap: () {
                    AppNavigator().goBack();// Close the drawer
                    AppNavigator().push(routeName: AppRoutes.ABOUT_US_SCREEN_ROUTE);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.privacy_tip_outlined,color: Colors.black,),
                  title: Text(tr("privacy_policy")),
                  onTap: () {
                    AppNavigator().goBack();// Close the drawer
                    AppNavigator().push(routeName: AppRoutes.PRIVACY_POLICY_SCREEN_ROUTE
                    ); // Close the drawer
                  },
                ),
                ListTile(
                  leading: Icon(Icons.refresh,color: Colors.black,),
                  title: Text(tr("return_policy")),
                  onTap: () {
                    AppNavigator().goBack();// Close the drawer
                    AppNavigator().push(routeName: AppRoutes.RETURN_POLICY_SCREEN_ROUTE);// Close the drawer
                  },
                ),
                ListTile(
                  leading: Icon(Icons.local_shipping_outlined,color: Colors.black,),
                  title: Text(tr("shipping_pollicy")),
                  onTap: () {
                    AppNavigator().goBack();// Close the drawer
                    AppNavigator().push(routeName: AppRoutes.SHIPPING_POLICY_SCREEN_ROUTE); // Close the drawer
                  },
                ),
              ],
            ),
          ),
          Container(width: double.infinity,height: 1,color: Colors.grey[200],),
          SizedBox(height: 1.h,),
          ListTile(
            leading: Icon(Icons.logout,color: AppData.USER_NAME.isNotEmpty?Colors.red:Colors.green,),
            title: Text(tr(AppData.USER_NAME.isNotEmpty?'Logout':'Login'),style: TextStyle(color: AppData.USER_NAME.isNotEmpty?Colors.red:Colors.green,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w700
            ),),
            onTap: () {
              LoginProvider().logout(); // Close the drawer
            },
          ),
          SizedBox(height: 2.h,)
        ],
      ),
    );
  }
}
