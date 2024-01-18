import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/features/orders/provider/order_provider.dart';
import 'package:bino_kids/features/orders/view/widgets/order_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AllOrdersScreen extends StatelessWidget {
  final OrderScreenParams params;
  const AllOrdersScreen({
    required this.params,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderProvider>(
        create: (context) => OrderProvider(),
    builder: (buildContext,_) {
      buildContext.read<OrderProvider>().type=params.orderType.toInt();
      buildContext.read<OrderProvider>().getAllOrders();
          return Consumer<OrderProvider>(builder: (ctx,dataModel,_){
            return Scaffold(body:
              SafeArea(child:
                Column(children: [
                  Row(
                    children: [
                      Expanded(child: CustomBackBtn(title: params.title.isNotEmpty?params.title: tr("My_orders"),)),
                       IconButton(onPressed: (){
                         AppNavigator().pushAndRemoveAll(routeName: AppRoutes.HOME_SCREEN_ROUTE);
                       }, icon: Icon(Icons.home_filled)),
                    ],),
                  Expanded(child:
                  (dataModel.orders)!=null?ListView.builder(
                    itemCount: dataModel.requests.length,
                      itemBuilder: (ctx,index){
                    return OrderItemWidget(orderDataModel: dataModel.requests[index],);
                  }):SizedBox())
                ],),),);
          });
    });
  }
}
class OrderScreenParams{
  final String title;
  final num orderType;
  OrderScreenParams({required this.title,required this.orderType});
}
