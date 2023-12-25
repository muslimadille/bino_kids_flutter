import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Expanded(
        child: Container(
          height:5.h,
          color: Colors.grey.withOpacity(0.5),
            padding: EdgeInsets.only(top:3.w,left: 4.w,right:4.w),
            child: Text("boys",style: TextStyle(color: Colors.white),)),
      ),
      Container(
          height:5.h,
          color: Colors.black,
          padding: EdgeInsets.all(2.w),
          child: Icon(Icons.search,color: Colors.white,))
    ],);
  }
}
