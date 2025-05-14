import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/widgets/costum_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SettingListItem extends StatelessWidget {
  final String title;
  final Function onclick;
  const SettingListItem({
    required this.title,
    required this.onclick,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onclick();
      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 0.5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 4.w,),
            Expanded(child: Text(AppLocalization.translate(title),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),)),
            IconButton(onPressed: (){

            }, icon: Icon(Icons.arrow_forward_ios,textDirection: AppLocalization.isArabic?TextDirection.rtl:TextDirection.ltr,color: Colors.grey,size: 3.5.w,))
          ],),
      ),
    );
  }
}
