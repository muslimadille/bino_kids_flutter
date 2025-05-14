import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/cart/model/cart_items_respose_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../model/order_details_model.dart';

class OrderModelItemWidget extends StatefulWidget {
  OrderModelItem item;

  OrderModelItemWidget({
    required this.item,

    Key? key}) : super(key: key);

  @override
  State<OrderModelItemWidget> createState() => _OrderModelItemWidgetState();
}

class _OrderModelItemWidgetState extends State<OrderModelItemWidget> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional. topEnd,
      children: [
        Container(
          width: double.infinity,
          height: 15.h,
          padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
          margin:EdgeInsets.symmetric(vertical: 0.3.h,horizontal: 2.w),
          decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 2,
                  spreadRadius: 3,
                )
              ]
          ),
          child: Row(
            children: [
              SizedBox(width: 1.w,),
              Image.network(widget.item.imageUrl??'',
                width:10.h,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 2.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Expanded(child: Text(widget.item.modelTypeName??'',style: TextStyle(fontSize: AppFontSize.x_small,fontWeight:FontWeight.w500),)),

                    ],),
                    SizedBox(height:0.1.h),
                    Text(widget.item.coloeName??'',style: TextStyle(fontSize: AppFontSize.x_small,fontWeight:FontWeight.w500,color: Colors.grey),),
                    SizedBox(height:0.5.h),
                    Wrap(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 1.w),
                          padding: EdgeInsets.symmetric(vertical: 0.5.h,horizontal:2.w),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Color:",style: TextStyle(fontSize: AppFontSize.small),),
                              Text(widget.item.coloeName??'',style: TextStyle(fontSize: AppFontSize.small),)
                            ],),),
                        SizedBox(width: 1.w,),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 1.w),
                          padding: EdgeInsets.symmetric(vertical: 0.5.h,horizontal:2.w),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Size:",style: TextStyle(fontSize: AppFontSize.small),),
                              Text(widget.item.sizeName??'',style: TextStyle(fontSize: AppFontSize.small),)
                            ],),)
                      ],),
                    Expanded(child: SizedBox(),),
                    SizedBox(height: 0.5.h,),
                    Row(
                      children: [
                        Text(tr("Quantity")+": ",style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w800),),
                        Text(widget.item.quantity.toString(),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500),),
                      ],
                    ) ,
                    SizedBox(height: 0.5.h,),
                    Row(
                      children: [
                        Text(tr("unit_price")+": ",style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w800),),
                        Text(widget.item.price.toString(),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500),),
                      ],
                    ) ,
                  ],),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(tr("Total_after_discount_details"),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w800),),
                  SizedBox(height: 1.h,),
                  Text(widget.item.totalPrice.toString(),style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w800,color: Colors.red),),
              ],)

            ],),
        ),
      ],
    );
  }
}
