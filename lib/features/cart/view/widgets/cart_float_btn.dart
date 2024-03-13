import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/cart/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CartFloatBtn extends StatefulWidget {
  const CartFloatBtn({Key? key}) : super(key: key);

  @override
  State<CartFloatBtn> createState() => _CartFloatBtnState();
}

class _CartFloatBtnState extends State<CartFloatBtn> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context,dataModel,_){
      if(dataModel.cartItemsResponseModel==null){
        dataModel.getCartItems();
      }
      return GestureDetector(
        onTap: (){
          AppNavigator().push(routeName: AppRoutes.HOME_SCREEN_ROUTE,arguments: 2);
        },
        child: Container(
          height:7.h,
            width: 7.h,
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 5,
                  )
                ]
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
              Center(child:Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
                size: 30,
              )),
              Positioned(
                left:-2.h ,
                  top: -2.h,
                  child:_counter(
                  dataModel.cartItemsResponseModel!=null?
                  dataModel.cartItemsResponseModel!.modelList!.length:0) )
            ],),),
      );
      }
    );
  }
  _counter(int value){
    return Container(
      height: 4.h,
      width: 4.h,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(child: Text(value.toString(),style:TextStyle(fontSize: 10.sp,color: Colors.white),),),);
  }
}
