import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/auth/provider/login_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
                  leading: Icon(Icons.note_alt,color: Colors.black,),
                  title: Text('About us'),
                  onTap: () {
                    AppNavigator().goBack();// Close the drawer
                    AppNavigator().push(routeName: AppRoutes.ABOUT_US_SCREEN_ROUTE);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.note_alt,color: Colors.black,),
                  title: Text('Privacy policy'),
                  onTap: () {
                    AppNavigator().goBack();// Close the drawer
                    AppNavigator().push(routeName: AppRoutes.PRIVACY_POLICY_SCREEN_ROUTE
                    ); // Close the drawer
                  },
                ),
                ListTile(
                  leading: Icon(Icons.note_alt,color: Colors.black,),
                  title: Text('Return and exchange policy'),
                  onTap: () {
                    AppNavigator().goBack();// Close the drawer
                    AppNavigator().push(routeName: AppRoutes.RETURN_POLICY_SCREEN_ROUTE);// Close the drawer
                  },
                ),
                ListTile(
                  leading: Icon(Icons.note_alt,color: Colors.black,),
                  title: Text('Return shipping policy'),
                  onTap: () {
                    AppNavigator().goBack();// Close the drawer
                    AppNavigator().push(routeName: AppRoutes.SHIPPING_POLICY_SCREEN_ROUTE); // Close the drawer
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout,color: Colors.red,),
            title: Text('Logout',style: TextStyle(color: Colors.red,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w700
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
