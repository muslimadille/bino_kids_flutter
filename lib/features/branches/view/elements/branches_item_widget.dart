import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/branches/model/braches_model.dart';
import 'package:bino_kids/features/orders/model/order_list_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class BranchesItemWidget extends StatelessWidget {
  final Branch branch;
  const BranchesItemWidget({
    required this.branch,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.w),
      width: double.infinity,
      decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 4,
              spreadRadius: 2,
            )
          ]
      ),
      child: Column(children: [
        Padding(padding: EdgeInsets.symmetric(horizontal:2.w,vertical: 1.h),
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/whatsapp.png",width:5.w,height: 5.w,),
                SizedBox(width: 2.w,),
                Expanded(child: Text(branch.whatsAppNumbers.first??'',style: TextStyle(color: Colors.grey,fontSize: AppFontSize.small,fontWeight: FontWeight.w400),)),
              ],),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              width:double.infinity,height: 1,color: Colors.grey[200],),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.phone_android,color: Colors.black,size:5.w,),
                SizedBox(width: 2.w,),
                Expanded(child: Text(branch.telephoneNumbers[0]??'',style: TextStyle(color: Colors.grey,fontSize: AppFontSize.small,fontWeight: FontWeight.w400),)),
              ],),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              width:double.infinity,height: 1,color: Colors.grey[200],),


            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.date_range,color: Colors.black,size:5.w,),
                SizedBox(width: 2.w,),
                Expanded(child: Text((branch.timesOfWork??""),style: TextStyle(color: Colors.grey,fontSize: AppFontSize.small,fontWeight: FontWeight.w400),)),
              ],),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              width:double.infinity,height: 1,color: Colors.grey[200],),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.home_outlined,color: Colors.black,size:5.w,),
                SizedBox(width: 2.w,),
                Expanded(child: Text((branch.address??"").toString(),style: TextStyle(color: Colors.grey,fontSize: AppFontSize.small,fontWeight: FontWeight.w400),)),
              ],),

          ],)
          ,),

      ],),);
  }
}
