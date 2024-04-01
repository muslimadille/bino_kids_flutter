import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/cart/model/cart_items_respose_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CartListItemWidget extends StatefulWidget {
  CartModelList item;
  final Function(CartModelList item) onChange;
  final Function(CartModelList item) onSelect;
  final Function(CartModelList item) onDelete;

  CartListItemWidget({
    required this.item,
    required this.onChange,
    required this.onSelect,
    required this.onDelete,

    Key? key}) : super(key: key);

  @override
  State<CartListItemWidget> createState() => _CartListItemWidgetState();
}

class _CartListItemWidgetState extends State<CartListItemWidget> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      height: 15.h,
      padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
      margin:EdgeInsets.symmetric(vertical: 0.3.h,horizontal: 2.w),
      child: Row(
        children: [
        // GestureDetector(
        //   onTap: (){
        //     widget.item.isSelected =!(widget.item.isSelected??false);
        //     widget.onSelect(widget.item);
        //   },
        //   child: Icon(widget.item.isSelected??false?
        //     Icons.check_circle:Icons.radio_button_off,color: Colors.black,),),
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
                Expanded(child: Text(widget.item.name??'',style: TextStyle(fontSize: AppFontSize.x_small,fontWeight:FontWeight.w500),)),
                GestureDetector(onTap: (){
                  widget.onDelete(widget.item);
                },child:Icon(Icons.cancel)),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${((widget.item.price??0)*(widget.item.quantity??0)).toInt()} ${tr("EGP")}",style: TextStyle(fontSize: AppFontSize.x_x_small,color: Colors.red,fontWeight: FontWeight.w700),),
                  SizedBox(width: 3.w,),
                  Text("${((widget.item.priceBeforeDiscount??0)*(widget.item.quantity??0)).toInt()} ${tr("EGP")}",textAlign: TextAlign.center,style: TextStyle(fontSize: AppFontSize.x_x_small,color: Colors.grey,fontWeight: FontWeight.w700,decoration: TextDecoration.lineThrough),),
                  Expanded(child:SizedBox()),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.fromBorderSide(
                            BorderSide(
                              width:1,
                              color:Colors.grey,
                            )
                        )
                    ),
                    child: Row(children: [
                      GestureDetector(
                        onTap: (){
                          if((widget.item.quantity??0)>1){
                            widget.item.quantity=(widget.item.quantity??0)-1;
                            widget.onChange(widget.item);
                          }

                        },
                          child:Padding(
                        padding:  EdgeInsets.symmetric(vertical:1.w,horizontal: 3.w),
                        child: Text("-"),
                      )),
                      Container(
                        height: 2.h,
                        width: 1,
                        color: Colors.grey[200],
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 1.w),child: Text(widget.item.quantity.toString(),style: TextStyle(fontSize: AppFontSize.small),),),
                      Container(
                        height: 2.h,
                        width: 1,
                        color: Colors.grey[200],
                      ),
                      GestureDetector(
                        onTap: (){
                          widget.item.quantity=(widget.item.quantity??0)+1;
                          widget.onChange(widget.item);
                        },
                          child:Padding(
                        padding:  EdgeInsets.symmetric(vertical:1.w,horizontal: 3.w),
                        child: Text("+"),
                      ))
                    ],),)
              ],)

            ],),
        ),
         
      ],),
    );
  }
}
