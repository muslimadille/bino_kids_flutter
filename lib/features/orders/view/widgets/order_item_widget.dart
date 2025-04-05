import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/orders/model/order_list_model.dart';
import 'package:bino_kids/features/profile/view_model/profile_helper.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class OrderItemWidget extends StatelessWidget {
  final OrderDataModel orderDataModel;
  const OrderItemWidget({
    required this.orderDataModel,
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
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            spreadRadius: 3,
          )
        ]
      ),
      child: InkWell(
        onTap: (){
          AppNavigator().push(routeName: AppRoutes.ORDER_DETAILS_SCREEN_ROUTE,arguments:orderDataModel.id );
        },
        child: Column(children: [
        Padding(padding: EdgeInsets.all(2.w),
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Icon(Icons.home_outlined,color: Colors.black,size:5.w,),
              SizedBox(width: 2.w,),
              Text(tr("Address:"),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),),
                SizedBox(width: 2.w,),
                Expanded(child: Text(orderDataModel.address??'',style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),)),
            ],),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              width:double.infinity,height: 1,color: Colors.grey[200],),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.alarm,color: Colors.black,size:5.w,),
                SizedBox(width: 2.w,),
                Text(tr("from:"),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),),
                SizedBox(width: 2.w,),
                Expanded(child: Text(orderDataModel.from??'',style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),)),
              ],),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              width:double.infinity,height: 1,color: Colors.grey[200],),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.alarm,color: Colors.black,size:5.w,),
                SizedBox(width: 2.w,),
                Text(tr("to:"),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),),
                SizedBox(width: 2.w,),
                Expanded(child: Text(orderDataModel.to??'',style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),)),
              ],),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              width:double.infinity,height: 1,color: Colors.grey[200],),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.date_range,color: Colors.black,size:5.w,),
                SizedBox(width: 2.w,),
                Text(tr("Date:"),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),),
                SizedBox(width: 2.w,),
                Expanded(child: Text(orderDataModel.purchaseDate??'',style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),)),
              ],),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              width:double.infinity,height: 1,color: Colors.grey[200],),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.sticky_note_2_rounded,color: Colors.black,size:5.w,),
                SizedBox(width: 2.w,),
                Text(tr("Bill Status:"),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),),
                SizedBox(width: 2.w,),
                Expanded(child: Text(orderTypes((orderDataModel.prushaseStatus??0).toInt()),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),)),
              ],),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              width:double.infinity,height: 1,color: Colors.grey[200],),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.confirmation_number_outlined,color: Colors.black,size:5.w,),
                SizedBox(width: 2.w,),
                Text(tr("Bill number:"),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),),
                SizedBox(width: 2.w,),
                Expanded(child: Text((orderDataModel.purchaseCode??0).toString(),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),)),
              ],),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              width:double.infinity,height: 1,color: Colors.grey[200],),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.align_horizontal_left_sharp,color: Colors.black,size:5.w,),
                SizedBox(width: 2.w,),
                Text(tr("Total:"),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),),
                SizedBox(width: 2.w,),
                Expanded(child: Text((orderDataModel.totalAmount??0).toString(),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),)),
              ],),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              width:double.infinity,height: 1,color: Colors.grey[200],),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.local_shipping_outlined,color: Colors.black,size:5.w,),
                SizedBox(width: 2.w,),
                Text(tr("Charge value:"),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),),
                SizedBox(width: 2.w,),
                Expanded(child: Text((orderDataModel.chargeValue??0).toString(),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),)),
              ],),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              width:double.infinity,height: 1,color: Colors.grey[200],),


            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.monetization_on_rounded,color: Colors.black,size:5.w,),
                SizedBox(width: 2.w,),
                Text(tr("Total_after_discount"),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),),
                SizedBox(width: 2.w,),
                Expanded(child: Text(((orderDataModel.totalAfterDiscount??0)).toString(),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),)),
              ],),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              width:double.infinity,height: 1,color: Colors.grey[200],),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.monetization_on_rounded,color: Colors.black,size:5.w,),
                SizedBox(width: 2.w,),
                Text(tr("Total_after_shippng"),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),),
                SizedBox(width: 2.w,),
                Expanded(child: Text(((orderDataModel.totalAfterDiscount??0)+(orderDataModel.chargeValue??0)).toString(),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),)),
              ],),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              width:double.infinity,height: 1,color: Colors.grey[200],),
            Visibility(
              visible: (orderDataModel.promocodeUsed??0)!=0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.discount,color: Colors.black,size:5.w,),
                  SizedBox(width: 2.w,),
                  Text(tr("promo_code"),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),),
                  SizedBox(width: 2.w,),
                  Expanded(child: Text(((orderDataModel.promocodeUsed??0)).toString(),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),)),
                ],),
            ),


          ],)
          ,),
        ///notes
        Container(
          padding: EdgeInsets.all(2.w),
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                bottomLeft:Radius.circular(8),bottomRight:Radius.circular(8)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Icon(Icons.notification_important_outlined,color: Colors.white,size:5.w,),
          SizedBox(width: 2.w,),
          Text(tr("Stock notes: "),style: TextStyle(color: Colors.white,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),),
              SizedBox(width: 2.w,),

              Expanded(child: Text(orderDataModel.stockNotes??'',style: TextStyle(color: Colors.white,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500),)),
        ],),)
            ],),
      ),);
  }
  String orderTypes(int value){
    switch(value){
    case 0:return tr("new_order");
    case 1:return tr("confirmed_order");
    case 2:return tr("delivering_order");
    case 3:return tr("delivered_order");
    case 4:return tr("canceled_order");
      default: return "";
    }
  }
}
