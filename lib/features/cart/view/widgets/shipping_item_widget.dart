import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../profile/model/addresses_list_model.dart';

class ShippingItemWidget extends StatelessWidget {
  final Function(int value) onSelect;
  final int index;
  final AddressItemListModel model;
  final bool isSelected;
  const ShippingItemWidget({
    required this.onSelect,
    required this.index,
    required this.model,
    required this.isSelected,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onSelect(index);
      },
      child: Container(
        margin:  EdgeInsets.symmetric(vertical:0.5.h,horizontal: 2.w),
        padding:  EdgeInsets.symmetric(vertical:0.5.h,horizontal: 2.w),
        decoration: BoxDecoration(
          color: Colors.white,
            border: Border.fromBorderSide(
                BorderSide(
                    width:1,
                    color:Colors.grey
                )
            ),
          borderRadius: BorderRadius.all(Radius.circular(8) ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(children: [
                Row(children: [
                  Icon(Icons.home_outlined,size: 5.w,),
                  SizedBox(width:2.w),
                  Expanded(child: Text("address"))
                ],),
                SizedBox(height: 1.h,),
                Row(children: [
                  Icon(Icons.location_city,size: 5.w,),
                  SizedBox(width:2.w),
                  Expanded(child: Text("Covernate"))
                ],)
              ],),
            ),
            GestureDetector(child: Icon(isSelected?Icons.radio_button_checked:Icons.radio_button_off),)
          ],
        ),
      ),
    );
  }
}
