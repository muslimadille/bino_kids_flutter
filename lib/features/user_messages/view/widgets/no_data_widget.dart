import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NoDataWidget extends StatelessWidget {
  final String? image;
  final String?  title;
  const NoDataWidget({
     this.image,
     this.title,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Image.asset(image??"assets/images/no_data_img.png",width: 20.w,height: 20.w,),
      SizedBox(height: 2.h,),
      Text(title??tr("no_data"),style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w500),)

    ],);
  }
}
