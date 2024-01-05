import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset("assets/images/empty-cart.png",width: 15.h,height: 15.h,),
        SizedBox(height: 2.h,),
        Text("Cart is empty",style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w700),)
    ],);
  }
}
