import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/product/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductItemWidget extends StatefulWidget {
  final int index;
  final ProductModel productModel;
  final double? height;
  final double? width;
  const ProductItemWidget({
    required this.index,
    required this.productModel,
    this.height,
    this.width,
    Key? key}) : super(key: key);

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        width: widget.width??45.w,
        height: widget.height??(widget.index.isOdd?35.h:30.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius:2,
              blurRadius:5,
              offset: Offset(0,0), // changes position of shadow
            ),
          ],

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10) ),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.productModel.imageUrl??''))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(margin: EdgeInsets.all(2.w),
                        padding: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200], // You can set your desired color
                        ),
                        child: Icon(Icons.add_shopping_cart,size: 5.w,))
                  ],),
              ),
            ),
            SizedBox(height: 1.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.w),
              child: Text(widget.productModel.priceAfter!=null?(widget.productModel.priceAfter.toString()+"EGP"):"",style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),),
            ),
            SizedBox(height: 0.5.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.w),
              child: Text(widget.productModel.description??widget.productModel.productData??'',style: TextStyle(
                  color:Colors.grey,
                  fontSize: AppFontSize.small,fontWeight: FontWeight.w400),),
            ),
            SizedBox(height: 2.h,),
          ],),
      ),
    );
  }
}
