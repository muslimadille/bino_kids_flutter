import 'dart:convert';

import 'package:bino_kids/features/orders/model/order_details_model.dart';
import 'package:bino_kids/features/orders/model/order_list_model.dart';
import 'package:bino_kids/features/orders/repository/order_repository.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider with ChangeNotifier{
  int type=-1;
  OrderListModel? orders;
  List<OrderDataModel> requests=[];
  OrderDetailsModel? orderDetails;

  getAllOrders()async{
    final response=await OrderRepository().getOrders();
     orders=orderListModelFromJson(jsonEncode(response.data));
    requests.clear();
    if(type>-1){
      requests.addAll((orders!.requests??[]).where((element) => element.prushaseStatus==type).toList());
    }else{
      requests.addAll(orders!.requests??[]);
    }
     notifyListeners();
  }
  getOrderDetails(String requestId)async{
    orderDetails=null;
    notifyListeners();
    final response=await OrderRepository().getOrderDetails(requestId: requestId);
    orderDetails=orderDetailsModelFromJson(jsonEncode(response.data));
    notifyListeners();
  }
}