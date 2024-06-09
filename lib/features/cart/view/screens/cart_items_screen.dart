import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/cart/view/widgets/cart_list_item_widget.dart';
import 'package:bino_kids/features/cart/view/widgets/empty_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/helpers/app_localization.dart';
import '../../../../common/helpers/app_navigator.dart';
import '../../provider/cart_provider.dart';
import '../widgets/promo_code_widget.dart';

class CartItemsScreen extends StatelessWidget {
  const CartItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CartProvider>().init();
    context.read<CartProvider>().getCartItems().then((value) {
      context.read<CartProvider>().setTotalPrice();
      context.read<CartProvider>().getShippingAddresses();
    });
    return SafeArea(
      child: Consumer<CartProvider>(builder: (context,dataModel,_){
        return  dataModel.cartItemsResponseModel!=null?
        Column(children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.w),
            child: Row(children: [
              Text(tr("Cart"),style:TextStyle(color: Colors.black,fontSize: AppFontSize.medium,fontWeight: FontWeight.w700)),
              SizedBox(width: 1.w,),
              Visibility(
                visible: (dataModel.cartItemsResponseModel!.modelList??[]).isNotEmpty,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0.3.h,horizontal: 3.w),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:
                  Text((dataModel.cartItemsResponseModel!.modelList??[]).length.toString(),style: TextStyle(color: Colors.white,fontSize: AppFontSize.x_small),textAlign: TextAlign.center,),),
              ),
              Expanded(child: SizedBox()),
              Visibility(
                  visible: false/*(dataModel.cartItemsResponseModel!.modelList??[]).isNotEmpty*/,
                  child: Text(tr("All"),style:TextStyle(color: Colors.black,fontSize: AppFontSize.medium,fontWeight: FontWeight.w700))),
              Visibility(
                visible:false /*(dataModel.cartItemsResponseModel!.modelList??[]).isNotEmpty*/,
                child: IconButton(onPressed: (){
                  dataModel.onSelectAll();
                }, icon: Icon(
                  dataModel.isSelectAll?Icons.check_circle:
                  Icons.radio_button_off,color: Colors.black,)),
              ),

            ],),
          ),
          Expanded(child: (dataModel.cartItemsResponseModel!.modelList??[]).isNotEmpty?Container(
            color: Colors.grey[200],
            child: ListView.builder(
                itemCount: (dataModel.cartItemsResponseModel!.modelList??[]).length,
                itemBuilder: (context,index){
                  return CartListItemWidget(
                    item:dataModel.cartItemsResponseModel!.modelList![index],
                    onChange: (item){
                      dataModel.onEdite(item,index);
                    },
                    onSelect: (item){
                      dataModel.onSelectItem(index, item);
                    },
                    onDelete:(item){
                      dataModel.onDelete(item,index);
                    },
                  );
                }),):EmptyCartWidget()),
          Visibility(
            visible: (dataModel.cartItemsResponseModel!.modelList??[]).isNotEmpty,
            child:
          Column(children: [
            SizedBox(height: 2.h,),
            Text("${dataModel.totalPrice.toInt()} ${tr("EGP")}",style: TextStyle(color: Colors.red,fontSize: AppFontSize.x_medium,fontWeight: FontWeight.w700),),

            SizedBox(height: 2.h,),
            Row(
              mainAxisAlignment:MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor:Colors.black,
                        disabledBackgroundColor: Colors.black,
                        disabledForegroundColor: Colors.black,
                        disabledMouseCursor: SystemMouseCursors.forbidden,
                        padding: EdgeInsets.symmetric(vertical:1.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: ()async{
                        if(AppData.USER_NAME.isNotEmpty){
                          AppNavigator().push(routeName: AppRoutes.COMPLETE_ORDER_SCREEN_ROUT);
                        }else{
                          AppNavigator().push(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
                        }
                      },
                      child: SizedBox(
                          width: 25.w,
                          child: Text(
                            tr("Order"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppFontSize.x_x_small,
                                fontWeight: FontWeight.w700
                            ),
                          )
                      ),
                    ),
                  ),
                )
              ],)
          ],),)
        ],)
            :SizedBox();
      })
    );
  }
}
