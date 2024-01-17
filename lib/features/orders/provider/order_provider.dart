import 'dart:convert';

import 'package:bino_kids/features/orders/model/order_list_model.dart';
import 'package:bino_kids/features/orders/repository/order_repository.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider with ChangeNotifier{
  OrderListModel? orders;
  getAllOrders()async{
    final response=await OrderRepository().getOrders();
     orders=orderListModelFromJson(jsonEncode(response.data));
     notifyListeners();
  }
}