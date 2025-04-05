import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/features/orders/view/widgets/order_model_item_widget.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/helpers/app_localization.dart';
import '../../../../common/helpers/app_navigator.dart';
import '../../model/order_list_model.dart';
import '../../provider/order_provider.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;
  const OrderDetailsScreen({required this.orderId,super.key});

  @override
  Widget build(BuildContext context) {

    return  ChangeNotifierProvider<OrderProvider>(
        create: (context) => OrderProvider(),
        builder: (buildContext,_) {
          buildContext.read<OrderProvider>().getOrderDetails(orderId);
          return Consumer<OrderProvider>(builder: (ctx,dataModel,_){
            return Scaffold(body:
            SafeArea(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Row(
                children: [
                  Expanded(child: CustomBackBtn(title:tr("order_details"),)),
                ],),
              Container(color: Colors.grey[200],width: double.infinity,height: 1,),

              Expanded(child:dataModel.orderDetails!=null?
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(tr("orderId")+": ",style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w800),),
                    Text(dataModel.orderDetails!.request.id.toString(),style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w500),),

                  ],),
                SizedBox(height: 1.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(tr("price")+": ",style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w800),),
                      Text(dataModel.orderDetails!.request.totalAfterDiscount.toString(),style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w500),),

                    ],),
                  SizedBox(height: 1.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(tr("shipping")+": ",style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w800),),
                      Text(dataModel.orderDetails!.request.chargeValue.toString(),style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w500),),
                    ],),
                  SizedBox(height: 1.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(tr("total_price")+": ",style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w800),),
                      Text(dataModel.orderDetails!.request.totalAmount.toString(),style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w500),),
                    ],),
                  SizedBox(height: 1.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(tr("order_date")+": ",style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w800),),
                      Text(dataModel.orderDetails!.request.purchaseDate.toString(),style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w500),),
                    ],),
                  SizedBox(height: 5.h,),
                Expanded(child: ListView.builder(
                  itemCount:dataModel.orderDetails!.request.cart.length ,
                    itemBuilder: (ctx,index){
                  return OrderModelItemWidget(item: dataModel.orderDetails!.request.cart[index],);
                }))
              ],):SizedBox())
            ],),),);
          });
        });
  }
  Widget _order_information_item(){
    return Container(
      child: Row(),
    );
  }
}
