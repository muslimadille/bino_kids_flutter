import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class PaymentMethodItemWidget extends StatelessWidget {
  final Function onSelect;
  final PaymentMethodItemModel model;
  const PaymentMethodItemWidget({
    required this.onSelect,
    required this.model,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onSelect();
      },
      child: Container(
        margin:  EdgeInsets.symmetric(vertical:0.5.h,horizontal: 2.w),
        padding:  EdgeInsets.symmetric(vertical:2.h,horizontal: 2.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.fromBorderSide(
              BorderSide(
                  width:1,
                  color:Colors.black
              )
          ),
          borderRadius: BorderRadius.all(Radius.circular(8) ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(children: [
                Row(
                  children: [
                    Image.asset(model.image,width: 15.w,height: 3.h,),
                    SizedBox(width:2.w),
                    Expanded(child: Text(model.title??""))
                  ],),
              ],),
            ),
            SizedBox(width: 2.w,),
            InkWell(
              onTap:(){
                onSelect();
              },
                child: Icon(model.isSelected?Icons.radio_button_checked :Icons.radio_button_off))
          ],
        ),
      ),
    );
  }
}
class PaymentMethodItemModel{
  String title;
  String image;
  bool isSelected;
  PaymentMethodItemModel({
    required this.title,
    required this.image,
    required this.isSelected
});

}
