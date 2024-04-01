
import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/utils/constants/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../utils/constants/app_font_size.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                       "assets/images/no_connection.png"
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(tr("NO_INTERNET"),style: TextStyle(
                      color: Colors.black,
                      fontWeight:FontWeight.w700,
                      fontSize: AppFontSize.x_x_large
                  ),),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w,vertical:1.h),
                    child: Text(tr("check_connectrion"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight:FontWeight.w500,
                          fontSize: AppFontSize.x_x_small
                      ),),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
